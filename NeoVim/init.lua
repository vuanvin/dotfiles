vim.defer_fn(function()
  pcall(require, "impatient")
end, 0)

local fn = vim.fn
local opt = vim.opt
local keymap = vim.keymap
local autocmd = vim.api.nvim_create_autocmd

opt.cursorline = true
opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"
opt.clipboard = "unnamedplus"

-- Indenting
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2

-- Numbers
opt.number = true
opt.numberwidth = 2
opt.ruler = false

local plugins = function(use)
  use {
    'wbthomason/packer.nvim',
    config = function() 
      local present, packer = pcall(require, "packer")
    end
  }

  use 'lewis6991/impatient.nvim'

  if not vim.g.vscode then
    use {'easymotion/vim-easymotion', opt = true}
    use 'nvim-treesitter/nvim-treesitter'
    use {
      "loctvl842/monokai-pro.nvim",
      config = function()
        require("monokai-pro").setup()
      end
    }

    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    use "williamboman/mason.nvim"

    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.1',
      requires = { {'nvim-lua/plenary.nvim'} }
    }
  end

  use {'asvetliakov/vim-easymotion', opt = true, as = 'vsc-easymotion'}
  use 'tpope/vim-surround'

  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/nvim-cmp'

  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'

  use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}
end

local install_path = fn.stdpath "data" .. "/site/pack/packer/opt/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1e222a" })
  print "Cloning packer .."
  fn.system { "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path }

  vim.cmd "packadd packer.nvim"

  local present, packer = pcall(require, "packer")
  if present then
    packer.startup { plugins }
  end

  vim.cmd "PackerSync"

else

  vim.cmd "packadd packer.nvim"

  local present, packer = pcall(require, "packer")
  if present then
    packer.startup(plugins)
  end
end


if vim.g.vscode then
  vim.cmd [[packadd vsc-easymotion]]
  keymap.set("c", "bn", "tabn", {noremap=true})
  keymap.set("c", "bp", "tabp", {noremap=true})

else
  vim.cmd [[packadd vim-easymotion]]
  vim.cmd [[colorscheme monokai-pro]]

  require('lualine').setup()

  require("mason").setup()

  local builtin = require('telescope.builtin')
  keymap.set('n', '<leader>ff', builtin.find_files, {})
  keymap.set('n', '<leader>fg', builtin.live_grep, {})
  keymap.set('n', '<leader>fb', builtin.buffers, {})
  keymap.set('n', '<leader>fh', builtin.help_tags, {})
end

autocmd({"BufWinEnter"}, { pattern = {"*?"}, command = "silent! loadview",})
autocmd({"BufWinLeave"}, { pattern = {"*?"}, command = "silent! mkview",})
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"

vim.g.mapleader = " "

keymap.set("n", "<M-h>", "<C-W>h", {noremap=true})
keymap.set("n", "<M-l>", "<C-W>l", {noremap=true})
keymap.set("n", "<M-j>", "<C-W>j", {noremap=true})
keymap.set("n", "<M-k>", "<C-W>k", {noremap=true})
keymap.set("c", "<C-A>", "<Home>", {noremap=true})
keymap.set("c", "<C-F>", "<Right>", {noremap=true})
keymap.set("c", "<C-B>", "<Left>", {noremap=true})

keymap.set("n", ",", "<Plug>(easymotion-bd-w)", {noremap=true})
keymap.set("n", "<leader>j", "<Plug>(easymotion-j)", {noremap=true})
keymap.set("n", "<leader>k", "<Plug>(easymotion-k)", {noremap=true})
keymap.set("n", "<leader>s", "<Plug>(easymotion-overwin-f2)", {noremap=true})


local on_attach = function(client, bufnr)
  vim.g.completion_matching_strategy_list = "['exact', 'substring', 'fuzzy']"

  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<leader>,', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

-- See https://github.com/hrsh7th/nvim-cmp
local cmp = require'cmp'

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For vsnip users.
    -- { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  }, {
    { name = 'buffer' },
  })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
require('lspconfig').clangd.setup{
  capabilities = capabilities,
  on_attach = on_attach,
}

require("bufferline").setup{}

