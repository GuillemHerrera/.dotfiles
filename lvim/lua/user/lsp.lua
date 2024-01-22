
-- add `pyright` to `skipped_servers` list
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- remove `jedi_language_server` from `skipped_servers` list
lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
  return server ~= "jedi_language_server"
end, lvim.lsp.automatic_configuration.skipped_servers)

-- setup formatting
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup{{command="ruff", filetypes = {"python"}}}
-- formatters.setup { { name = "black" }, extra_args = {"--line-length", "140", "--skip-string-normalization"} }
-- lvim.format_on_save.enabled = false
-- lvim.format_on_save.pattern = { "*.py" }
local oqqpts = { noremap=true, silent=true }

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

-- Configure `ruff-lsp`.
local configs = require 'lspconfig.configs'
if not configs.ruff_lsp then
  configs.ruff_lsp = {
    default_config = {
      cmd = { 'ruff-lsp' },
      filetypes = { 'python' },
      root_dir = require('lspconfig').util.find_git_ancestor,
      init_options = {
        settings = {
          args = {
            '--line-length=170',
            '--select=ALL',
            '--ignore=N818,ANN204,ANN101,E501,T201,D101,D107,D105,D205,D400,D212,D415,Q000,S101,PD011,PD002,I001,PLR2004',
            -- '--ignore=ANN204',
            -- '--ignore=T201',
            -- '--ignore=E50l',
            '--fixable=D,W'
            -- 'select=["ALL"]
          }
          -- args = {
        }
      }
    }
  }
end
require('lspconfig').ruff_lsp.setup {
  on_attach = on_attach,
}
