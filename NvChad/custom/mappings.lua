---@type MappingsConfig
local M = {}

M.disabled = {
  n = {
      ["<C-h>"] = "",
      ["<C-l>"] = "",
      ["<C-j>"] = "",
      ["<C-k>"] = ""
  },
}

M.general = {
  n = {
      ["<C-h>"] = {"h"},
      ["<C-l>"] = {"l"},
      ["<C-j>"] = {"j"},
      ["<C-k>"] = {"k"}
  }
}

M.custom = {
  n = {
    ["A-h"] = { "<C-w>h", "window left" },
    ["A-l"] = { "<C-w>l", "window right" },
    ["A-j"] = { "<C-w>j", "window down" },
    ["A-k"] = { "<C-w>k", "window up" },
    ["<leader>wh"] = { "<C-w>h", "window left" },
    ["<leader>wl"] = { "<C-w>l", "window right" },
    ["<leader>wj"] = { "<C-w>j", "window down" },
    ["<leader>wk"] = { "<C-w>k", "window up" },
  }

  i = {
    -- more keys!
  }
}

return M
