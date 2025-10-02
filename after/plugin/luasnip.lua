local ls = require 'luasnip'
local types = require 'luasnip.util.types'

require("luasnip.loaders.from_vscode").lazy_load()

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
ls.filetype_extend("ruby", { "references", "ruby" })
-- ls.filetype_extend("blade",      {"references"})
ls.filetype_extend("php", { "references" })
ls.filetype_extend("eruby", { "references", "html" })
ls.filetype_extend("javascript",
  { "references", "html", "javascript-moment", "javascript-node", "javascript-webix", "php" })
-- ls.filetype_extend("blade",      {"references", "html"})
ls.filetype_extend("html", { "references", "javascript" })
ls.filetype_extend("vue", { "javascript", "html" })
ls.filetype_extend("javascriptreact", { "javascript", "html" })
ls.filetype_extend("php", { "javascript" })
-- ls.filetype_extend("sql",        {"references", "sql-jeonsoft"})

require("luasnip.loaders.from_snipmate").lazy_load({ paths = "./snippets" })
