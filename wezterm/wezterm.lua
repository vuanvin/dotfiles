local wezterm = require("wezterm")
local act = wezterm.action

-- https://wezfurlong.org/wezterm/config/lua/config/index.html
local configs = {
  ratelimit_output_bytes_per_second = 10000000,
  enable_scroll_bar = false,
  show_tab_index_in_tab_bar = true,
  tab_and_split_indices_are_zero_based = false,
  tab_bar_at_bottom = false,
  window_decorations = "RESIZE",
  window_background_opacity = 0.7,
  window_padding = { left = 0, right = 0, top = 0, bottom = 0 },
  initial_rows = 50,
  initial_cols = 160,
  check_for_updates = false,
  color_scheme = "MonokaiPro (Gogh)",
  -- color_scheme = "Gruvbox Dark", -- "MonokaiPro (Gogh)",
  font = wezterm.font_with_fallback({
    "JetBrainsMono NF",
    "FiraCode Nerd Font",
    "Cascadia Code",
  }),
  font_size = 9,
  exit_behavior = "Close",
  inactive_pane_hsb = {
    hue = 1.0,
    saturation = 1.0,
    brightness = 1.0,
  },
  launch_menu = {},
  leader = { key = '[', mods = 'ALT', timeout_milliseconds = 5000 },
  disable_default_key_bindings = true,
  mouse_bindings = {
    {
      event = { Up = { streak = 1, button = 'Middle' } },
      mods = 'NONE',
      action = act.Paste,
    },
    {
      event = { Up = { streak = 1, button = 'Right' } },
      mods = 'NONE',
      action = act.CopyTo 'ClipboardAndPrimarySelection',
    },
  },
  -- command_palette_font_size = 14.0,
  -- https://wezfurlong.org/wezterm/config/lua/keyassignment/index.html
  keys = {
    -- { key = 'p',          mods = 'SHIFT|CTRL',   action = act.ActivateCommandPalette },
    { key = 'n',          mods = 'SHIFT|CTRL',   action = act.SpawnWindow },
    { key = 'h',          mods = 'SHIFT|CTRL',   action = act.Hide },
    { key = ':',          mods = 'ALT|SHIFT',    action = act.ShowLauncher },
    { key = ':',          mods = 'LEADER|SHIFT', action = act.ShowLauncher },
    { key = ']',          mods = 'LEADER',       action = act.ShowLauncher },
    { key = 'q',          mods = 'CMD',          action = act.QuitApplication },
    { key = 'q',          mods = 'LEADER',       action = act.QuitApplication },
    { key = 'q',          mods = 'SHIFT|CTRL',   action = act.QuitApplication },
    { key = 'C',          mods = 'SHIFT|CTRL',   action = act.CopyTo 'ClipboardAndPrimarySelection' },
    { key = 'v',          mods = 'SHIFT|CTRL',   action = act.Paste },

    -- Tab
    { key = 'c',          mods = 'LEADER',       action = act.SpawnTab 'CurrentPaneDomain', },
    { key = 's',          mods = 'LEADER',       action = act.ShowTabNavigator },
    { key = 'x',          mods = 'LEADER|SHIFT', action = act.CloseCurrentTab { confirm = true }, },
    { key = 'p',          mods = "LEADER",       action = act.ActivateTabRelative( -1) },
    { key = 'n',          mods = "LEADER",       action = act.ActivateTabRelative(1) },
    { key = 'p',          mods = "ALT",          action = act.ActivateTabRelative( -1) },
    { key = 'n',          mods = "ALT",          action = act.ActivateTabRelative(1) },
    { key = '1',          mods = "LEADER",       action = act.ActivateTab(0) },
    { key = '2',          mods = "LEADER",       action = act.ActivateTab(1) },
    { key = '3',          mods = "LEADER",       action = act.ActivateTab(2) },
    { key = '4',          mods = "LEADER",       action = act.ActivateTab(3) },
    { key = '5',          mods = "LEADER",       action = act.ActivateTab(4) },
    { key = '6',          mods = "LEADER",       action = act.ActivateTab(5) },
    { key = '7',          mods = "LEADER",       action = act.ActivateTab(6) },
    { key = '8',          mods = "LEADER",       action = act.ActivateTab(7) },
    { key = '9',          mods = "LEADER",       action = act.ActivateTab(8) },

    -- Pane
    { key = 'x',          mods = 'LEADER',       action = act.CloseCurrentPane { confirm = true }, },
    { key = '|',          mods = 'LEADER|SHIFT', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' }, },
    { key = '%',          mods = 'LEADER|SHIFT', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' }, },
    { key = '-',          mods = 'LEADER',       action = act.SplitVertical { domain = 'CurrentPaneDomain' }, },
    { key = '"',          mods = 'LEADER|SHIFT', action = act.SplitVertical { domain = 'CurrentPaneDomain' }, },
    { key = 'LeftArrow',  mods = "LEADER",       action = act.ActivatePaneDirection 'Left' },
    { key = 'h',          mods = "LEADER",       action = act.ActivatePaneDirection 'Left' },
    { key = 'RightArrow', mods = "LEADER",       action = act.ActivatePaneDirection 'Right' },
    { key = 'l',          mods = "LEADER",       action = act.ActivatePaneDirection 'Right' },
    { key = 'UpArrow',    mods = "LEADER",       action = act.ActivatePaneDirection 'Up' },
    { key = 'k',          mods = "LEADER",       action = act.ActivatePaneDirection 'Up' },
    { key = 'DownArrow',  mods = "LEADER",       action = act.ActivatePaneDirection 'Down' },
    { key = 'j',          mods = "LEADER",       action = act.ActivatePaneDirection 'Down' },

    {
      key = 'r',
      mods = 'LEADER',
      action = act.ActivateKeyTable {
        name = 'resize_pane',
        one_shot = false,
      },
    },
    {
      key = 'a',
      mods = 'LEADER',
      action = act.ActivateKeyTable {
        name = 'activate_pane',
        timeout_milliseconds = 1000,
      },
    },
  },
  key_tables = {
    resize_pane = {
      { key = 'LeftArrow',  action = act.AdjustPaneSize { 'Left', 1 } },
      { key = 'h',          action = act.AdjustPaneSize { 'Left', 1 } },
      { key = 'RightArrow', action = act.AdjustPaneSize { 'Right', 1 } },
      { key = 'l',          action = act.AdjustPaneSize { 'Right', 1 } },
      { key = 'UpArrow',    action = act.AdjustPaneSize { 'Up', 1 } },
      { key = 'k',          action = act.AdjustPaneSize { 'Up', 1 } },
      { key = 'DownArrow',  action = act.AdjustPaneSize { 'Down', 1 } },
      { key = 'j',          action = act.AdjustPaneSize { 'Down', 1 } },
      -- Cancel the mode by pressing escape
      { key = 'Escape',     action = 'PopKeyTable' },
    },
    activate_pane = {
      { key = 'LeftArrow',  action = act.ActivatePaneDirection 'Left' },
      { key = 'h',          action = act.ActivatePaneDirection 'Left' },
      { key = 'RightArrow', action = act.ActivatePaneDirection 'Right' },
      { key = 'l',          action = act.ActivatePaneDirection 'Right' },
      { key = 'UpArrow',    action = act.ActivatePaneDirection 'Up' },
      { key = 'k',          action = act.ActivatePaneDirection 'Up' },
      { key = 'DownArrow',  action = act.ActivatePaneDirection 'Down' },
      { key = 'j',          action = act.ActivatePaneDirection 'Down' },
    },
  },
  set_environment_variables = {},
  ssh_domains = {
    {
      name = 'cloud',
      remote_address = '121.46.19.2:20795',
      username = 'yuanyin',
    },
  },
  wsl_domains = {
    {
      name = 'WSL:Ubuntu',
      distribution = 'Ubuntu',
    },
  },
}

if wezterm.target_triple == "x86_64-pc-windows-msvc" then
  configs.default_prog = { 'pwsh', '-Login', '-NoLogo' }

  table.insert(configs.launch_menu, { label = "pwsh", args = { "pwsh", "-Login", "-NoLogo" } })
  table.insert(configs.launch_menu, { label = "Nushell", args = { "nu", "-l" } })

  -- Enumerate any WSL distributions that are installed and add those to the menu
  local success, wsl_list, wsl_err = wezterm.run_child_process({ "wsl", "-l" })
  -- `wsl.exe -l` has a bug where it always outputs utf16:
  -- https://github.com/microsoft/WSL/issues/4607
  -- So we get to convert it
  wsl_list = wezterm.utf16_to_utf8(wsl_list)

  for idx, line in ipairs(wezterm.split_by_newlines(wsl_list)) do
    -- Skip the first line of output; it's just a header
    if idx > 1 then
      -- Remove the "(Default)" marker from the default line to arrive
      -- at the distribution name on its own
      local distro = line:gsub(" %(Default%)", "")
      -- Add an entry that will spawn into the distro with the default shell
      table.insert(configs.launch_menu,
        { label = distro .. " (WSL default shell)", args = { "wsl", "--distribution", distro }, })
      table.insert(configs.launch_menu,
        {
          label = distro .. " (WSL zsh login shell)",
          args = { "wsl", "--distribution", distro, "--exec", "/bin/zsh", "-l" },
        })
    end
  end

  table.insert(configs.launch_menu, { label = "Git Bash", args = { [[C:\Program Files\Git\bin\bash.exe]] } })
  table.insert(configs.launch_menu, { label = "PowerShell 5", args = { "powershell.exe", "-NoLogo" } })
elseif wezterm.target_triple == "x86_64-unknown-linux-gnu" then
  -- configs.default_prog = { 'zsh', '-l' }

  table.insert(configs.launch_menu, { label = "bash", args = { "bash", "-l" } })
  table.insert(configs.launch_menu, { label = "zsh", args = { "zsh", "-l" } })
else
  -- configs.default_prog = { 'zsh', '-l' }
  --
  table.insert(configs.launch_menu, { label = "zsh", args = { "zsh", "-l" } })
end

wezterm.on('update-right-status', function(window, pane)
  local name = window:active_key_table()
  if name then
    name = 'TABLE: ' .. name .. '   '
  end
  window:set_right_status(name or '')
end)

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  local basename = function(s)
    s = string.gsub(s, "(.*[/\\])(.*)", "%2")
    return s:gsub(".exe" .. "$", "")
  end

  -- local _title = tab.active_pane.foreground_process_name
  local _title = tab.active_pane.title
  local title = wezterm.truncate_right(basename(_title), max_width - 2)
  return {
    { Text = " " .. (tab.tab_index + 1) .. ": " .. title .. " " },
  }
end)

local ssh_config = io.open(wezterm.home_dir .. "/.ssh/config")
if ssh_config then
  local line = ssh_config:read("*l")
  while line do
    if line:find("Host ") == 1 then
      local host = line:gsub("Host ", "")
      table.insert(configs.launch_menu, { label = "SSH " .. host, args = { "ssh", host } })
    end
    line = ssh_config:read("*l")
  end
  ssh_config:close()
end

return configs
