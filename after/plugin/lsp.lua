require "mason".setup()

require "mason-lspconfig".setup({
  ensure_installed = {
    'lua_ls',
    'pyright',
    'tailwindcss',
    'jdtls',
    'ruby_lsp'
  }
})

local lsp = require "lspconfig"
local caps = require 'cmp_nvim_lsp'.default_capabilities()

local on_attach_base = function(client, bufnr)
  local function bufmap(mode, combo, macro)
    vim.keymap.set(mode, combo, macro, { buffer = bufnr, noremap = true, silent = true })
  end

  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  bufmap('n', 'K', vim.lsp.buf.hover)
  bufmap('n', 'gD', vim.lsp.buf.declaration)
  bufmap('n', '<C-k>', vim.lsp.buf.signature_help)
  bufmap('n', '<leader>fmt', function() vim.lsp.buf.format { async = true } end)
  bufmap('n', '<leader>pd', function() vim.diagnostic.open_float { scope = 'cursor' } end)
  bufmap('n', '<leader>ld', function() vim.diagnostic.open_float { scope = 'line' } end)
  bufmap('n', '<leader>ca', vim.lsp.buf.code_action)
  bufmap('n', '<F2>', vim.lsp.buf.rename)

  local t = require 'telescope.builtin'
  bufmap('n', '<leader>wd', t.diagnostics)
  bufmap('n', '<leader>dd', function() t.diagnostics({ bufnr = 0 }) end)
  bufmap('n', 'gd', t.lsp_definitions)
  bufmap('n', 'gt', t.lsp_type_definitions)
  bufmap('n', 'gr', t.lsp_references)
  bufmap('n', '<leader>ds', t.lsp_document_symbols)
end

local on_attach = function(client, bufnr)
  vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format({timeout_ms = 5000})]]
  on_attach_base(client, bufnr);
end
-- Language Server Setups
lsp.lua_ls.setup { on_attach = on_attach, capabilities = caps,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
}
lsp.denols.setup {
  on_attach = on_attach,
  capabilities = caps,
  root_dir = lsp.util.root_pattern('deno.jsonc', 'deno.json'),
  settings = {
    deno = {
      enable = true,
      lint = true,
      config = 'deno.jsonc'
    }
  },
  filetypes = {
    "json", "jsonc", "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact",
    "typescript.tsx"
  }
}
lsp.rust_analyzer.setup { on_attach = on_attach, capabilities = caps }
lsp.emmet_ls.setup {
  on_attach = on_attach,
  capabilities = caps,
  filetypes = {
    'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'svelte'
  }
}
lsp.svelte.setup {
  on_attach = on_attach_base,
  capabilities = caps
}
lsp.tailwindcss.setup {
  on_attach = on_attach,
  capabilities = caps,
}

lsp.eslint.setup {
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
    on_attach_base(client, bufnr)
  end,
  capabilities = caps,
}

lsp.jdtls.setup {
  on_attach = on_attach,
  capabilities = caps,
}

lsp.volar.setup {
  on_attach = on_attach,
  capabilities = caps,
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
  init_options = {
    typescript = {
      serverPath = '/usr/local/lib/node_modules/typescript/lib/tsserverlibrary.js'
    },
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = "/usr/local/lib/node_modules/@vue/typescript-plugin",
        languages = { "javascript", "typescript", "vue" },
      },
    },
  },
}

lsp.ruby_lsp.setup {
  on_attach = on_attach,
  capabilities = caps,
}

-- You must make sure volar is setup
-- e.g. require'lspconfig'.volar.setup{}
-- See volar's section for more information

local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.completion.spell,
    null_ls.builtins.diagnostics.eslint,

    -- Add Ruby and ERB support
    null_ls.builtins.formatting.rubocop,
    null_ls.builtins.diagnostics.rubocop,
    null_ls.builtins.diagnostics.erb_lint,
  },
})
