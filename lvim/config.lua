-- Read the docs: https://www.lunarvim.org/docs/configuration
-- To make telescope live-grep working
-- https://github.com/LunarVim/LunarVim/issues/2981#issuecomment-1239159274

-- install plugins
reload("user.options")
reload("user.keymaps")
reload("user.lsp")

vim.g.node_host_prog = "/home/guillemherrera/.nvm/versions/node/v14.21.3/bin/node"
vim.g.python3_host_prog = "/usr/local/bin/python3"
lvim.plugins = {
  "ChristianChiarulli/swenv.nvim",
  "stevearc/dressing.nvim",
  "mfussenegger/nvim-dap-python",
  "nvim-neotest/neotest",
  "nvim-neotest/neotest-python",
  'kvrohit/rasmus.nvim',
  'projekt0n/github-nvim-theme',
  'tpope/vim-surround',
  'tpope/vim-repeat',
  -- {'Exafunction/codeium.vim',
  --   config = function ()
  -- vim.keymap.set('i', '<C-l>', function () return vim.fn['codeium#Complete']() end, { expr = true })
  -- vim.keymap.set('i', '<M-TAB>', function () return vim.fn['codeium#Accept']() end, { expr = true })
  -- vim.keymap.set('i', '<M-n>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
  -- vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
  -- vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true })
  -- end
  -- }
}
-- disable auto codeium suggestion  -- colorscheme github_dark_dimmed
vim.g.codeium_manual = 1
-- automatically install python syntax highlighting
lvim.builtin.treesitter.ensure_installed = {
  "python",
}
-- setup plugins.    
--
-- 

-- -- setup formatting
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- -- formatters.setup{{command="ruff-lsp", filetypes = {"python"}}}
-- formatters.setup { { name = "black" }, extra_args = {"--line-length", "140", "--skip-string-normalization"} }
-- lvim.format_on_save.enabled = false
-- lvim.format_on_save.pattern = { "*.py" }

-- -- setup linting
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup { { command = "flake8", args = {"--ignore=E203", "--ignore=E501"}, filetypes = { "python" } } }

-- local opts = { noremap=true, silent=true }
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
-- -- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- -- Use an on_attach function to only map the following keys
-- -- after the language server attaches to the current buffer
-- local on_attach = function(client, bufnr)
--   -- Enable completion triggered by <c-x><c-o>
--   vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

--   -- Mappings.
--   -- See `:help vim.lsp.*` for documentation on any of the below functions
--   local bufopts = { noremap=true, silent=true, buffer=bufnr }
--   -- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
--   -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
--   -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
--   -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
--   -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
--   -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
--   -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
--   -- vim.keymap.set('n', '<space>wl', function()
--   --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
--   -- end, bufopts)
--   vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
--   -- vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
--   -- vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
--   -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
--   -- vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
-- end

-- -- Configure `ruff-lsp`.
-- -- See: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ruff_lsp
-- -- For the default config, along with instructions on how to customize the settings
-- require('lspconfig').ruff_lsp.setup {
--   on_attach = on_attach,
--   init_options = {
--     settings = {
--       -- Any extra CLI arguments for `ruff` go here.
--       args = {"line-length = 140", "select = [E, F, G]"},
--     }
--   }
-- }
