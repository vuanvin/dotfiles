local global = {}
function global:load_variables()
  local os_name = vim.loop.os_uname().sysname
  self.is_mac = os_name == "Darwin"
  self.is_linux = os_name == "Linux"
  self.is_windows = os_name == "Windows_NT"
  self.is_wsl = vim.fn.has("wsl") == 1
  self.vim_path = vim.fn.stdpath("config")
  local path_sep = self.is_windows and "\\" or "/"
  local home = self.is_windows and os.getenv("USERPROFILE") or os.getenv("HOME")
  self.cache_dir = home .. path_sep .. ".cache" .. path_sep .. "nvim" .. path_sep
  self.modules_dir = self.vim_path .. path_sep .. "modules"
  self.home = home
  self.data_dir = string.format("%s/site/", vim.fn.stdpath("data"))
end
global:load_variables()

local keymap = vim.keymap
local autocmd = vim.api.nvim_create_autocmd

local init_leader = function()
  vim.g.mapleader = " "
  vim.api.nvim_set_keymap("n", " ", "", { noremap = true })
  vim.api.nvim_set_keymap("x", " ", "", { noremap = true })
end

local init_lazy = function()
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath,
    })
  end
  vim.opt.rtp:prepend(lazypath)
end

init_leader()
init_lazy()

require("lazy").setup({
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {

    },
    config = function(_, opts)
      local wk = require('which-key')
      wk.setup(opts)

      local keymaps = {
        mode = { "n", "v" },
        ["g"] = { name = "+goto" },
        ["gz"] = { name = "+surround" },
        ["]"] = { name = "+next" },
        ["["] = { name = "+prev" },
        ["<leader><tab>"] = { name = "+tabs" },
        ["<leader>b"] = { name = "+buffer" },
        ["<leader>c"] = { name = "+code" },
        ["<leader>f"] = { name = "+file/find" },
        ["<leader>g"] = { name = "+git" },
        ["<leader>gh"] = { name = "+hunks" },
        ["<leader>q"] = { name = "+quit/session" },
        ["<leader>s"] = { name = "+search" },
        ["<leader>u"] = { name = "+ui" },
        ["<leader>w"] = { name = "+windows" },
        ["<leader>x"] = { name = "+diagnostics/quickfix" },
      }

      wk.register(keymaps)
    end,
  },
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  },
  {
    "folke/neoconf.nvim",
    cmd = "Neoconf"
  },
  "folke/neodev.nvim",

  {
    "lukas-reineke/indent-blankline.nvim",
    config = function ()
      vim.opt.listchars:append "space:⋅"

      require("indent_blankline").setup {
        show_current_context = true,
        show_current_context_start = true,
        space_char_blankline = " ",
      }
    end,
  },

  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = { options = { "buffers", "curdir", "tabpages", "winsize", "help", "globals" } },
    -- stylua: ignore
    keys = {
      { "<leader>qs", function() require("persistence").load() end, desc = "Restore Session" },
      { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
      { "<leader>qd", function() require("persistence").stop() end, desc = "Don't Save Current Session" },
    },
  },

  {
    "loctvl842/monokai-pro.nvim",
    lazy = false,
    version = "v1.1.2",
    config = function()
      require("monokai-pro").setup()
      vim.cmd [[colorscheme monokai-pro]]
    end,
  },
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    keys = {
      {"<leader>tb", "<cmd>Barbecue<CR>", desc = "Barbecue"},
    },
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    opts = {
      -- configurations go here
    },
    config = function()
      require("barbecue.ui").toggle(false)
      -- triggers CursorHold event faster
      vim.opt.updatetime = 200

      require("barbecue").setup({
        theme = 'monokai-pro',
        create_autocmd = false,
      })

      vim.api.nvim_create_autocmd({
        "WinScrolled", -- or WinResized on NVIM-v0.9 and higher
        "BufWinEnter",
        "CursorHold",
        "InsertLeave",

        -- include these if you have set `show_modified` to `true`
        "BufWritePost",
        "TextChanged",
        "TextChangedI",
      },
      {
        group = vim.api.nvim_create_augroup("barbecue.updater", {}),
        callback = function()
          require("barbecue.ui").update()
        end,
      })
    end
  },
  {
    "folke/noice.nvim",
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
    config = function()
      require("noice").setup({
        lsp = {
          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
        },
        -- you can enable a preset for easier configuration
        presets = {
          bottom_search = true, -- use a classic bottom cmdline for search
          command_palette = true, -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = false, -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = false, -- add a border to hover docs and signature help
        },
      })
    end
  },
  {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('alpha').setup(require('alpha.themes.startify').config)
    end
  },
  {
    'nvim-telescope/telescope.nvim',
    version = '0.1.1',
    config = function()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>.', builtin.find_files, {desc = "Find file"})
      vim.keymap.set('n', '<leader>,', builtin.buffers, {desc = "Find buffer"})
      vim.keymap.set('n', '<leader>/', builtin.live_grep, {desc = "Find pattern"})
      vim.keymap.set('n', '<leader>:', builtin.command_history, {desc = "Command history"})

      vim.keymap.set('n', '<leader>T', ":Telescope<CR>", {desc = "Launch telescope"})
      vim.keymap.set('n', '<leader>ff', builtin.find_files, {desc = "Find file"})
      vim.keymap.set('n', '<leader>fp', builtin.live_grep, {desc = "Find pattern"})
      vim.keymap.set('n', '<leader>fb', builtin.buffers, {desc = "Find buffer"})
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, {desc = "Find help"})
    end,
    dependencies = { 'nvim-lua/plenary.nvim' },
  },

  {
    "numToStr/FTerm.nvim",
    config = function()
      require'FTerm'.setup({
        border = 'none',
        dimensions  = {
          height = 0.8,
          width = 0.8,
        },
        blend = 25,
      })

      vim.keymap.set('n', '<A-i>', '<CMD>lua require("FTerm").toggle()<CR>')
      vim.keymap.set('t', '<A-i>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
      vim.api.nvim_create_user_command('FTermToggle', require('FTerm').toggle, { bang = true })
    end
  },
  {
    'phaazon/hop.nvim',
    branch = 'v2',
    config = function()
      vim.keymap.set("n", ",", ":HopWord<CR>", {noremap=true})
      vim.keymap.set("n", "<leader>j", ":HopLineAC<CR>", {noremap=true})
      vim.keymap.set("n", "<leader>k", ":HopLineBC<CR>", {noremap=true})
      vim.keymap.set("n", "<leader>s", ":HopChar2<CR>", {noremap=true})

      require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  },

  {
    'windwp/nvim-autopairs',
    config = function()
      require("nvim-autopairs").setup {}
    end,
  },

  'tpope/vim-surround',

  {
    'nvim-treesitter/nvim-treesitter',
    config = function ()
      vim.opt.foldmethod = "expr"
      vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

      require'nvim-treesitter.configs'.setup {
        -- A list of parser names, or "all" (the four listed parsers should always be installed)
        ensure_installed = { "c", "lua", "vim", "help" },

        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,

        -- Automatically install missing parsers when entering buffer
        -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
        auto_install = true,

        -- List of parsers to ignore installing (for "all")
        ignore_install = { "javascript" },

        ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
        -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

        highlight = {
          enable = true,
          disable = function(lang, buf)
            local max_filesize = 1024 * 1024 -- 1 MB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
              return true
            end
          end,

          -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
          -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
          -- Using this option may slow down your editor, and you may see some duplicate highlights.
          -- Instead of true it can also be a list of languages
          additional_vim_regex_highlighting = false,
        },
      }
    end
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons'},
    config = function()
      require('lualine').setup {
        options = {
          theme = 'monokai-pro'
        }
      }
    end
  },

  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    'williamboman/mason-lspconfig.nvim',
    config = function()
      -- TODO
      require("mason-lspconfig").setup {
        -- ensure_installed = { 'clangd', 'rust_analyzer', 'pyright', 'gopls', 'lua_ls' },
      }
    end,
  },

  'neovim/nvim-lspconfig',

  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/cmp-buffer',
  'hrsh7th/nvim-cmp',

  'hrsh7th/cmp-vsnip',
  'hrsh7th/vim-vsnip',

  {
    'nvim-telescope/telescope.nvim',
    version = '0.1.1',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    cmd = "Neotree",
    keys = {
      {"\\", ":NeoTreeShowToggle<CR>", desc = "NeoTree"},
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
  },
  {
    'akinsho/bufferline.nvim',
    version = "v3.*",
    dependencies = {'nvim-tree/nvim-web-devicons'},
    config = function()
      vim.keymap.set("n", "<leader>bp", ":BufferLineCyclePrev<CR>", {noremap=true})
      vim.keymap.set("n", "<leader>bn", ":BufferLineCycleNext<CR>", {noremap=true})
      vim.keymap.set("n", "<leader>bh", ":BufferLineMovePrev<CR>", {noremap=true})
      vim.keymap.set("n", "<leader>bl", ":BufferLineMoveNext<CR>", {noremap=true})
      vim.keymap.set("n", "<leader>b<leader>", ":BufferLinePick<CR>", {noremap=true, desc = "Buffer jump"})

      vim.opt.termguicolors = true
      require("bufferline").setup{}
    end
  },
})

local setup_editor = function ()
  local clipboard_config = function()
    if global.is_mac then
      vim.g.clipboard = {
        name = "macOS-clipboard",
        copy = { ["+"] = "pbcopy", ["*"] = "pbcopy" },
        paste = { ["+"] = "pbpaste", ["*"] = "pbpaste" },
        cache_enabled = 0,
      }
    elseif global.is_wsl then
      vim.g.clipboard = {
        name = "win32yank-wsl",
        copy = {
          ["+"] = "win32yank.exe -i --crlf",
          ["*"] = "win32yank.exe -i --crlf",
        },
        paste = {
          ["+"] = "win32yank.exe -o --lf",
          ["*"] = "win32yank.exe -o --lf",
        },
        cache_enabled = 0,
      }
    end
  end

  clipboard_config() -- maybe need scoop install win32yank
  autocmd({"BufWinEnter"}, { pattern = {"*?"}, command = "silent! loadview",})
  autocmd({"BufWinLeave"}, { pattern = {"*?"}, command = "silent! mkview",})
end

local load_options = function()
  local opt = vim.opt

  opt.timeout = true
  opt.timeoutlen = 300

  opt.list = true
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

end

local load_keymaps = function ()
  -- Window
  keymap.set("n", "<M-h>", "<C-W>h", {noremap=true})
  keymap.set("n", "<M-l>", "<C-W>l", {noremap=true})
  keymap.set("n", "<M-j>", "<C-W>j", {noremap=true})
  keymap.set("n", "<M-k>", "<C-W>k", {noremap=true})

  keymap.set("t", "<M-h>", "<C-\\><C-N><C-W>h", {noremap=true})
  keymap.set("t", "<M-l>", "<C-\\><C-N><C-W>l", {noremap=true})
  keymap.set("t", "<M-j>", "<C-\\><C-N><C-W>j", {noremap=true})
  keymap.set("t", "<M-k>", "<C-\\><C-N><C-W>k", {noremap=true})
  keymap.set("t", "<Esc>", "<C-\\><C-N>", {noremap=true})
  -- Cmdline
  keymap.set("c", "<C-A>", "<Home>", {noremap=true})
  keymap.set("c", "<C-F>", "<Right>", {noremap=true})
  keymap.set("c", "<C-B>", "<Left>", {noremap=true})

  -- barbecue
  local barbecue_ui = require('barbecue.ui')
  keymap.set('n', '<leader>tb', barbecue_ui.toggle, {})
end

local setup_lsp = function ()
  -- https://github.com/neovim/nvim-lspconfig
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
    buf_set_keymap('n', 'gh', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>',  {noremap=true, silent=true, desc = "Goto declaration"})
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', {noremap=true, silent=true, desc = "Goto definition"})
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', {noremap=true, silent=true, desc = "Goto implementation"})
    buf_set_keymap('n', 'gI', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', {noremap=true, silent=true, desc = "Goto references"})
    buf_set_keymap('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    buf_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  end

  local lspconfig = require('lspconfig')
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  local servers = { 'clangd', 'rust_analyzer', 'pyright', 'gopls' }
  for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end

  lspconfig.lua_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      Lua = {
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = 'LuaJIT',
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = {'vim'},
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = vim.api.nvim_get_runtime_file("", true),
          checkThirdParty = false,
        },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = {
          enable = false,
        },
      },
    },
  }
end

local setup_completion = function ()
  local cmp = require "cmp"

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
    sources = cmp.config.sources(
    {{ name = 'path' }},
    {{ name = 'cmdline' }}
    )
  })
end

setup_lsp()
setup_completion()
setup_editor()
load_options()
load_keymaps()
