local ls = require 'luasnip'
local types = require 'luasnip.util.types'

ls.setup({
  history = true,
  -- Update more often, :h events for more info.
  update_events = "TextChanged,TextChangedI",
  enable_autosnippets = true,
  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = { { "choiceNode", "Comment" } },
      },
    },
  },
})

-- extend snippets
-- ls.filetype_extend("lua",        {"references"})
-- ls.filetype_extend("ruby",       {"references"})
-- ls.filetype_extend("blade",      {"references"})
ls.filetype_extend("javascript", { "references", "html", "javascript-moment", "javascript-node", "javascript-webix" })
-- ls.filetype_extend("blade",      {"references", "html"})
ls.filetype_extend("html", { "references", "javascript" })
-- ls.filetype_extend("eruby",      {"references", "html"})
-- ls.filetype_extend("sql",        {"references", "sql-jeonsoft"})

require("luasnip.loaders.from_snipmate").lazy_load({ paths = "./snippets" })
