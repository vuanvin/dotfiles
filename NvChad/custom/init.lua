vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldenable = true

vim.g.luasnippets_path = "~/.config/snippets"

vim.api.nvim_create_autocmd({"BufWinEnter"},
  {pattern = {"?*"}, command = "silent! loadview"})
vim.api.nvim_create_autocmd({"BufWinLeave"},
  {pattern = {"?*"}, command = "silent! mkview"})


vim.defer_fn(function()
  -- vim.cmd([[colorscheme monokai-pro]])
  -- vim.cmd "highlight Normal guibg=NONE ctermbg=NONE"
  -- vim.cmd "highlight EndOfBuffer guibg=NONE ctermbg=NONE"
end, 0)

-- custom.plugins.lspconfig
local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "clangd", "rust-analyzer"}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
