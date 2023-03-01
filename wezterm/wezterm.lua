local wezterm = require("wezterm")
local act = wezterm.action

-- Show which key table is active in the status area
wezterm.on('update-right-status', function(window, pane)
  local name = window:active_key_table()
  if name then
    name = 'TABLE: ' .. name
  end
  window:set_right_status(name or '')
end)


local config = {
  check_for_updates = false,
  color_scheme = "MonokaiPro (Gogh)",
  font = wezterm.font_with_fallback({
    "JetBrainsMono NF",
    "FiraCode Nerd Font",
    "Cascadia Code",
  }),
  font_size = 10,
  enable_scroll_bar = true,
  exit_behavior = "Close",
  -- tab_bar_at_bottom = true,
  inactive_pane_hsb = {
    hue = 1.0,
    saturation = 1.0,
    brightness = 1.0,
  },
  default_prog = { 'pwsh', '--nologo' },
  launch_menu = {},
  leader = { key = 't', mods = 'ALT', timeout_milliseconds = 5000 },
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
      action = act.CopyTo 'ClipboardAndPrimarySelection' ,
    },
  },
  keys = {
    { key = 'C',          mods = 'CTRL|SHIFT',   action = act.CopyTo 'ClipboardAndPrimarySelection' },
    { key = 'v',          mods = 'SHIFT|CTRL',   action = act.Paste },
    { key = 'c',          mods = 'LEADER',       action = act.SpawnTab 'CurrentPaneDomain', },

    { key = '|',          mods = 'LEADER|SHIFT', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' }, },
    { key = '%',          mods = 'LEADER|SHIFT', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' }, },
    { key = '-',          mods = 'LEADER',       action = act.SplitVertical { domain = 'CurrentPaneDomain' }, },
    { key = '"',          mods = 'LEADER|SHIFT', action = act.SplitVertical { domain = 'CurrentPaneDomain' }, },
    { key = 'z',          mods = 'ALT',          action = act.ShowLauncher },
    { key = 'z',          mods = 'LEADER',       action = act.ShowLauncher },
    { key = 'LeftArrow',  mods = "LEADER",       action = act.ActivatePaneDirection 'Left' },
    { key = 'h',          mods = "LEADER",       action = act.ActivatePaneDirection 'Left' },
    { key = 'RightArrow', mods = "LEADER",       action = act.ActivatePaneDirection 'Right' },
    { key = 'l',          mods = "LEADER",       action = act.ActivatePaneDirection 'Right' },
    { key = 'UpArrow',    mods = "LEADER",       action = act.ActivatePaneDirection 'Up' },
    { key = 'k',          mods = "LEADER",       action = act.ActivatePaneDirection 'Up' },
    { key = 'DownArrow',  mods = "LEADER",       action = act.ActivatePaneDirection 'Down' },
    { key = 'j',          mods = "LEADER",       action = act.ActivatePaneDirection 'Down' },
    { key = 'p',          mods = "LEADER",       action = act.ActivateTabRelative( -1) },
    { key = 'n',          mods = "LEADER",       action = act.ActivateTabRelative(1) },
    { key = '1',          mods = "LEADER",       action = act.ActivateTab(0) },
    { key = '2',          mods = "LEADER",       action = act.ActivateTab(1) },
    { key = '3',          mods = "LEADER",       action = act.ActivateTab(2) },
    { key = '4',          mods = "LEADER",       action = act.ActivateTab(3) },
    { key = '5',          mods = "LEADER",       action = act.ActivateTab(4) },
    { key = '6',          mods = "LEADER",       action = act.ActivateTab(5) },
    { key = '7',          mods = "LEADER",       action = act.ActivateTab(6) },
    { key = '8',          mods = "LEADER",       action = act.ActivateTab(7) },
    { key = '9',          mods = "LEADER",       action = act.ActivateTab(8) },

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
  -- Tab bar appearance
  colors = {
    tab_bar = {
      -- The color of the strip that goes along the top of the window
      background = "#282828",
      -- The active tab is the one that has focus in the window
      active_tab = {
        -- The color of the background area for the tab
        bg_color = "#18131e",
        -- The color of the text for the tab
        fg_color = "#ff65fd",

        intensity = "Normal",
        underline = "None",
        italic = false,
        strikethrough = false,
      },
      -- Inactive tabs are the tabs that do not have focus
      inactive_tab = {
        bg_color = "#282828",
        fg_color = "#d19afc",
      },
      inactive_tab_hover = {
        bg_color = "#202020",
        fg_color = "#ff65fd",
      },
      new_tab = {
        bg_color = "#282828",
        fg_color = "#d19afc",
      },
      new_tab_hover = {
        bg_color = "#18131e",
        fg_color = "#ff65fd",
      },
    },
  },
}

if wezterm.target_triple == "x86_64-pc-windows-msvc" then
  table.insert(config.launch_menu, { label = "PowerShell 7", args = { "pwsh.exe", "-nologo" } })
  table.insert(config.launch_menu, { label = "PowerShell 5", args = { "powershell.exe", "-nologo" } })
  table.insert(config.launch_menu,
    { label = "VS PowerShell 2022", args = { "powershell", "-NoLogo", "-NoExit", "-Command", "devps 17.0" } })
  table.insert(config.launch_menu,
    { label = "VS PowerShell 2019", args = { "powershell", "-NoLogo", "-NoExit", "-Command", "devps 16.0" } })
  table.insert(config.launch_menu, { label = "Command Prompt", args = { "cmd.exe" } })
  table.insert(config.launch_menu,
    { label = "VS Command Prompt 2022", args = { "powershell", "-NoLogo", "-NoExit", "-Command", "devcmd 17.0" } })
  table.insert(config.launch_menu,
    { label = "VS Command Prompt 2019", args = { "powershell", "-NoLogo", "-NoExit", "-Command", "devcmd 16.0" } })

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
      table.insert(config.launch_menu, {
        label = distro .. " (WSL default shell)",
        args = { "wsl", "--distribution", distro },
      })

      -- Here's how to jump directly into some other program; in this example
      -- its a shell that probably isn't the default, but it could also be
      -- any other program that you want to run in that environment
      table.insert(config.launch_menu, {
        label = distro .. " (WSL zsh login shell)",
        args = { "wsl", "--distribution", distro, "--exec", "/bin/zsh", "-l" },
      })
    end
  end
else
  table.insert(config.launch_menu, { label = "zsh", args = { "zsh", "-l" } })
end

-- Equivalent to POSIX basename(3)
-- Given "/foo/bar" returns "bar"
-- Given "c:\\foo\\bar" returns "bar"
function Basename(s)
  return string.gsub(s, "(.*[/\\])(.*)", "%2")
end

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  local pane = tab.active_pane
  local title = Basename(pane.foreground_process_name)
  return {
    { Text = " " .. title .. " " },
  }
end)

return config
