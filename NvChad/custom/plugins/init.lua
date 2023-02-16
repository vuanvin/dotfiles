return {
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },
  ["williamboman/mason.nvim"] = {
   override_options = {
      ensure_installed = {
        -- lua stuff
        "lua-language-server",
        "stylua",
		    "rust-analyzer",
        "cpptools",
        "clangd",

        -- web dev
        "css-lsp",
        "html-lsp",
        "typescript-language-server",
        "deno",
        "emmet-ls",
        "json-lsp",

        -- shell
        "shfmt",
        "shellcheck",
      },
    },
  },
  ["loctvl842/monokai-pro.nvim"] = {
		  override_options = function()
				  require("monokai-pro").setup()
		  end,
  },
}
