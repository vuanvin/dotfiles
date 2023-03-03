local wezterm = require("wezterm")
local act = wezterm.action

local SOLID_RIGHT_ARROW = utf8.char(0xe0b0)
local RIGHT_ARROW = utf8.char(0xe0b1)
local SOLID_LEFT_ARROW = utf8.char(0xe0b2)
local LEFT_ARROW = utf8.char(0xe0b3)
local TAB_BAR_BG = "Black"
local NORMAL_TAB_BG = "#191f26"
local NORMAL_TAB_FG = "White"
local ACTIVE_TAB_BG = "#ff9248"
local ACTIVE_TAB_FG = "Black"
local HOVER_TAB_BG = "#0f1419"
local HOVER_TAB_FG = "White"

local configs = {
  use_fancy_tab_bar = false,
  force_reverse_video_cursor = true,
  default_cursor_style = 'BlinkingBlock',
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
  color_scheme = "MonokaiPro (Gogh)",
  font = wezterm.font_with_fallback({
    "JetBrainsMono NF",
    "FiraCode Nerd Font",
    "Cascadia Code",
  }),
  font_size = 9,
  exit_behavior = "Close", -- when shell exit
  audible_bell = "Disabled",
  launch_menu = {},
  leader = { key = '[', mods = 'ALT', timeout_milliseconds = 5000 },
  disable_default_key_bindings = true,
  disable_default_mouse_bindings = false,
  mouse_bindings = {
    { event = { Up = { streak = 1, button = 'Middle' } },            mods = 'NONE', action = act.Paste, },
    { event = { Up = { streak = 1, button = 'Right' } },             mods = 'NONE', action = act.CopyTo 'ClipboardAndPrimarySelection', },
    { event = { Down = { streak = 1, button = { WheelUp = 1 } } },   mods = 'CTRL', action = act.IncreaseFontSize, },
    { event = { Down = { streak = 1, button = { WheelDown = 1 } } }, mods = 'CTRL', action = act.DecreaseFontSize, },
    { event = { Up = { streak = 1, button = 'Left' } },              mods = 'CTRL', action = act.OpenLinkAtMouseCursor, },
    { event = { Down = { streak = 1, button = 'Left' } },            mods = 'CTRL', action = act.Nop, },
  },
  -- https://wezfurlong.org/wezterm/config/lua/keyassignment/index.html
  -- command_palette_font_size = 14.0,
  keys = {
    -- { key = 'p',          mods = 'SHIFT|CTRL',   action = act.ActivateCommandPalette },
    { key = 'n',          mods = 'SHIFT|CTRL',   action = act.SpawnWindow },
    { key = 'h',          mods = 'SHIFT|CTRL',   action = act.Hide },
    { key = 'm',          mods = 'SHIFT|CTRL',   action = act.Hide },
    { key = ':',          mods = 'ALT|SHIFT',    action = act.ShowLauncher },
    { key = ':',          mods = 'LEADER|SHIFT', action = act.ShowLauncher },
    { key = 'q',          mods = 'CMD',          action = act.QuitApplication },
    { key = 'q',          mods = 'LEADER',       action = act.QuitApplication },
    { key = 'q',          mods = 'SHIFT|CTRL',   action = act.QuitApplication },
    { key = 'C',          mods = 'SHIFT|CTRL',   action = act.CopyTo 'ClipboardAndPrimarySelection' },
    { key = 'v',          mods = 'SHIFT|CTRL',   action = act.Paste },

    -- Tab
    { key = 'c',          mods = 'LEADER',       action = act.SpawnTab 'CurrentPaneDomain', },
    { key = 's',          mods = 'LEADER',       action = act.ShowTabNavigator },
    { key = 'x',          mods = 'LEADER|SHIFT', action = act.CloseCurrentTab { confirm = true }, },
    { key = 'p',          mods = 'LEADER',       action = act.ActivateTabRelative( -1) },
    { key = 'n',          mods = 'LEADER',       action = act.ActivateTabRelative(1) },
    { key = 'p',          mods = 'ALT',          action = act.ActivateTabRelative( -1) },
    { key = 'n',          mods = 'ALT',          action = act.ActivateTabRelative(1) },
    { key = '1',          mods = 'LEADER',       action = act.ActivateTab(0) },
    { key = '2',          mods = 'LEADER',       action = act.ActivateTab(1) },
    { key = '3',          mods = 'LEADER',       action = act.ActivateTab(2) },
    { key = '4',          mods = 'LEADER',       action = act.ActivateTab(3) },
    { key = '5',          mods = 'LEADER',       action = act.ActivateTab(4) },
    { key = '6',          mods = 'LEADER',       action = act.ActivateTab(5) },
    { key = '7',          mods = 'LEADER',       action = act.ActivateTab(6) },
    { key = '8',          mods = 'LEADER',       action = act.ActivateTab(7) },
    { key = '9',          mods = 'LEADER',       action = act.ActivateTab(8) },

    -- Pane
    { key = 'x',          mods = 'LEADER',       action = act.CloseCurrentPane { confirm = true }, },
    { key = '|',          mods = 'LEADER|SHIFT', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' }, },
    { key = '%',          mods = 'LEADER|SHIFT', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' }, },
    { key = '-',          mods = 'LEADER',       action = act.SplitVertical { domain = 'CurrentPaneDomain' }, },
    { key = '"',          mods = 'LEADER|SHIFT', action = act.SplitVertical { domain = 'CurrentPaneDomain' }, },
    { key = 'LeftArrow',  mods = 'LEADER',       action = act.ActivatePaneDirection 'Left' },
    { key = 'h',          mods = 'LEADER',       action = act.ActivatePaneDirection 'Left' },
    { key = 'RightArrow', mods = 'LEADER',       action = act.ActivatePaneDirection 'Right' },
    { key = 'l',          mods = 'LEADER',       action = act.ActivatePaneDirection 'Right' },
    { key = 'UpArrow',    mods = 'LEADER',       action = act.ActivatePaneDirection 'Up' },
    { key = 'k',          mods = 'LEADER',       action = act.ActivatePaneDirection 'Up' },
    { key = 'DownArrow',  mods = 'LEADER',       action = act.ActivatePaneDirection 'Down' },
    { key = 'j',          mods = 'LEADER',       action = act.ActivatePaneDirection 'Down' },

    { key = '[',          mods = 'LEADER',       action = act.ActivateCopyMode },
    { key = ']',          mods = 'LEADER',       action = act.PasteFrom('PrimarySelection') },
    { key = 'r',          mods = 'LEADER',       action = act.ActivateKeyTable { name = 'resize_pane', one_shot = false, }, },
    { key = 'a',          mods = 'LEADER',       action = act.ActivateKeyTable { name = 'activate_pane', timeout_milliseconds = 3000, }, },
  },
  key_tables = {
    copy_mode = {
      { key = 'c',          mods = 'CTRL',  action = act.CopyMode('Close') },
      { key = 'g',          mods = 'CTRL',  action = act.CopyMode('Close') },
      { key = 'q',          mods = 'NONE',  action = act.CopyMode('Close') },
      { key = 'Escape',     mods = 'NONE',  action = act.CopyMode('Close') },

      { key = 'h',          mods = 'NONE',  action = act.CopyMode('MoveLeft') },
      { key = 'j',          mods = 'NONE',  action = act.CopyMode('MoveDown') },
      { key = 'k',          mods = 'NONE',  action = act.CopyMode('MoveUp') },
      { key = 'l',          mods = 'NONE',  action = act.CopyMode('MoveRight') },

      { key = 'LeftArrow',  mods = 'NONE',  action = act.CopyMode('MoveLeft') },
      { key = 'DownArrow',  mods = 'NONE',  action = act.CopyMode('MoveDown') },
      { key = 'UpArrow',    mods = 'NONE',  action = act.CopyMode('MoveUp') },
      { key = 'RightArrow', mods = 'NONE',  action = act.CopyMode('MoveRight') },

      { key = 'RightArrow', mods = 'ALT',   action = act.CopyMode('MoveForwardWord') },
      { key = 'f',          mods = 'ALT',   action = act.CopyMode('MoveForwardWord') },
      { key = 'Tab',        mods = 'NONE',  action = act.CopyMode('MoveForwardWord') },
      { key = 'w',          mods = 'NONE',  action = act.CopyMode('MoveForwardWord') },

      { key = 'LeftArrow',  mods = 'ALT',   action = act.CopyMode('MoveBackwardWord') },
      { key = 'b',          mods = 'ALT',   action = act.CopyMode('MoveBackwardWord') },
      { key = 'Tab',        mods = 'SHIFT', action = act.CopyMode('MoveBackwardWord') },
      { key = 'b',          mods = 'NONE',  action = act.CopyMode('MoveBackwardWord') },

      { key = '0',          mods = 'NONE',  action = act.CopyMode('MoveToStartOfLine') },
      { key = 'Enter',      mods = 'NONE',  action = act.CopyMode('MoveToStartOfNextLine') },

      { key = '$',          mods = 'NONE',  action = act.CopyMode('MoveToEndOfLineContent') },
      { key = '$',          mods = 'SHIFT', action = act.CopyMode('MoveToEndOfLineContent') },
      { key = '^',          mods = 'NONE',  action = act.CopyMode('MoveToStartOfLineContent') },
      { key = '^',          mods = 'SHIFT', action = act.CopyMode('MoveToStartOfLineContent') },
      { key = 'm',          mods = 'ALT',   action = act.CopyMode('MoveToStartOfLineContent') },

      { key = ' ',          mods = 'NONE',  action = act.CopyMode { SetSelectionMode = 'Cell' } },
      { key = 'v',          mods = 'NONE',  action = act.CopyMode { SetSelectionMode = 'Cell' } },
      { key = 'V',          mods = 'NONE',  action = act.CopyMode { SetSelectionMode = 'Line' } },
      { key = 'V',          mods = 'SHIFT', action = act.CopyMode { SetSelectionMode = 'Line' } },
      { key = 'v',          mods = 'CTRL',  action = act.CopyMode { SetSelectionMode = 'Block' } },

      { key = 'G',          mods = 'NONE',  action = act.CopyMode('MoveToScrollbackBottom') },
      { key = 'G',          mods = 'SHIFT', action = act.CopyMode('MoveToScrollbackBottom') },
      { key = 'g',          mods = 'NONE',  action = act.CopyMode('MoveToScrollbackTop') },

      { key = 'H',          mods = 'NONE',  action = act.CopyMode('MoveToViewportTop') },
      { key = 'H',          mods = 'SHIFT', action = act.CopyMode('MoveToViewportTop') },
      { key = 'M',          mods = 'NONE',  action = act.CopyMode('MoveToViewportMiddle') },
      { key = 'M',          mods = 'SHIFT', action = act.CopyMode('MoveToViewportMiddle') },
      { key = 'L',          mods = 'NONE',  action = act.CopyMode('MoveToViewportBottom') },
      { key = 'L',          mods = 'SHIFT', action = act.CopyMode('MoveToViewportBottom') },

      { key = 'o',          mods = 'NONE',  action = act.CopyMode('MoveToSelectionOtherEnd') },
      { key = 'O',          mods = 'NONE',  action = act.CopyMode('MoveToSelectionOtherEndHoriz') },
      { key = 'O',          mods = 'SHIFT', action = act.CopyMode('MoveToSelectionOtherEndHoriz') },

      { key = 'PageUp',     mods = 'NONE',  action = act.CopyMode('PageUp') },
      { key = 'PageDown',   mods = 'NONE',  action = act.CopyMode('PageDown') },

      { key = 'b',          mods = 'CTRL',  action = act.CopyMode('PageUp') },
      { key = 'f',          mods = 'CTRL',  action = act.CopyMode('PageDown') },

      -- Enter y to copy and quit the copy mode.
      { key = 'y',          mods = 'NONE',  action = act.Multiple { act.CopyTo('ClipboardAndPrimarySelection'), act.CopyMode('Close'), } },
      -- Enter search mode to edit the pattern.
      -- When the search pattern is an empty string the existing pattern is preserved
      { key = '/',          mods = 'NONE',  action = act { Search = { CaseSensitiveString = '' } } },
      { key = '?',          mods = 'NONE',  action = act { Search = { CaseInSensitiveString = '' } } },
      { key = 'n',          mods = 'CTRL',  action = act { CopyMode = 'NextMatch' } },
      { key = 'p',          mods = 'CTRL',  action = act { CopyMode = 'PriorMatch' } },
    },

    search_mode = {
      { key = 'Escape', mods = 'NONE', action = act { CopyMode = 'Close' } },
      -- Go back to copy mode when pressing enter, so that we can use unmodified keys like 'n'
      -- to navigate search results without conflicting with typing into the search area.
      { key = 'Enter',  mods = 'NONE', action = 'ActivateCopyMode' },
      { key = 'c',      mods = 'CTRL', action = 'ActivateCopyMode' },
      { key = 'n',      mods = 'CTRL', action = act { CopyMode = 'NextMatch' } },
      { key = 'p',      mods = 'CTRL', action = act { CopyMode = 'PriorMatch' } },
      { key = 'r',      mods = 'CTRL', action = act.CopyMode('CycleMatchType') },
      { key = 'u',      mods = 'CTRL', action = act.CopyMode('ClearPattern') },
    },

    resize_pane = {
      { key = 'LeftArrow',  action = act.AdjustPaneSize { 'Left', 1 } },
      { key = 'h',          action = act.AdjustPaneSize { 'Left', 1 } },
      { key = 'H',          action = act.AdjustPaneSize { 'Left', 3 } },
      { key = 'RightArrow', action = act.AdjustPaneSize { 'Right', 1 } },
      { key = 'l',          action = act.AdjustPaneSize { 'Right', 1 } },
      { key = 'L',          action = act.AdjustPaneSize { 'Right', 3 } },
      { key = 'UpArrow',    action = act.AdjustPaneSize { 'Up', 1 } },
      { key = 'k',          action = act.AdjustPaneSize { 'Up', 1 } },
      { key = 'K',          action = act.AdjustPaneSize { 'Up', 3 } },
      { key = 'DownArrow',  action = act.AdjustPaneSize { 'Down', 1 } },
      { key = 'j',          action = act.AdjustPaneSize { 'Down', 1 } },
      { key = 'J',          action = act.AdjustPaneSize { 'Down', 3 } },
      -- Cancel the mode by pressing escape
      { key = 'Escape',     action = 'PopKeyTable' },
      { key = 'q',          action = 'PopKeyTable' },
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
  check_for_updates = false,
  set_environment_variables = {},
  ssh_domains = {
    {
      name = 'cloud',
      remote_address = '121.46.19.2:20795',
      username = 'yuanyin',
    },
    {
      name = 'zyynote',
      remote_address = '192.168.198.110',
      username = 'yuanyin',
    },
  },
  wsl_domains = wezterm.default_wsl_domains(),
  tab_bar_style = {
    new_tab = wezterm.format {
      { Background = { Color = HOVER_TAB_BG } }, { Foreground = { Color = TAB_BAR_BG } }, { Text = SOLID_RIGHT_ARROW }, { Background = { Color = HOVER_TAB_BG } }, { Foreground = { Color = HOVER_TAB_FG } },
      { Text = " + " },
      { Background = { Color = '#333333' } }, { Foreground = { Color = HOVER_TAB_BG } }, { Text = SOLID_RIGHT_ARROW },
    },
    new_tab_hover = wezterm.format {
      { Attribute = { Italic = false } },
      { Attribute = { Intensity = "Bold" } },
      { Background = { Color = NORMAL_TAB_BG } }, { Foreground = { Color = TAB_BAR_BG } }, { Text = SOLID_RIGHT_ARROW }, { Background = { Color = NORMAL_TAB_BG } }, { Foreground = { Color = NORMAL_TAB_FG } },
      { Text = " + " },
      { Background = { Color = '#333333' } }, { Foreground = { Color = NORMAL_TAB_BG } }, { Text = SOLID_RIGHT_ARROW },
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
elseif wezterm.target_triple == "x86_64-apple-darwin" then
  -- configs.default_prog = { 'zsh', '-l' }
  table.insert(configs.launch_menu, { label = "zsh", args = { "zsh", "-l" } })
end

wezterm.on('update-right-status', function(window, pane)
  local cells = {}

  table.insert(cells, window:active_key_table())
  table.insert(cells, window:active_workspace())

  local basic_color = '#ff9248'
  local focus_color = '#403e41'
  local text_bg = '#2a2a2a'
  local text_fg = '#c0c0c0'
  local elements = {}
  local num_cells = 0

  local function push(text, is_first)
    if is_first then
      table.insert(elements, { Foreground = { Color = text_bg } })
      table.insert(elements, { Text = SOLID_LEFT_ARROW })
    else
      table.insert(elements, { Foreground = { Color = text_fg } })
      table.insert(elements, { Background = { Color = text_bg } })
      table.insert(elements, { Attribute = { Intensity = "Bold" } })
      table.insert(elements, { Text = LEFT_ARROW })
    end

    table.insert(elements, { Foreground = { Color = text_fg } })
    table.insert(elements, { Background = { Color = text_bg } })
    table.insert(elements, { Attribute = { Intensity = "Normal" } })
    table.insert(elements, { Text = ' ' .. text .. ' ' })
    num_cells = num_cells + 1
  end

  local is_first = true
  while #cells > 0 do
    local cell = table.remove(cells, 1)
    push(cell, is_first)
    is_first = false
  end

  local bactories = {}
  for _, b in ipairs(wezterm.battery_info()) do
    table.insert(bactories, string.format('%.0f%%', b.state_of_charge * 100))
  end

  is_first = true
  while #bactories > 0 do
    local text = table.remove(bactories, 1)
    if is_first then
      table.insert(elements, { Foreground = { Color = focus_color } })
      table.insert(elements, { Text = SOLID_LEFT_ARROW })
    else
      table.insert(elements, { Foreground = { Color = text_fg } })
      table.insert(elements, { Background = { Color = focus_color } })
      table.insert(elements, { Attribute = { Intensity = "Bold" } })
      table.insert(elements, { Text = LEFT_ARROW })
    end

    table.insert(elements, { Attribute = { Intensity = "Normal" } })
    table.insert(elements, { Foreground = { Color = basic_color } })
    table.insert(elements, { Background = { Color = focus_color } })
    table.insert(elements, { Text = ' ' .. text .. ' ' })
    is_first = false
  end

  local date = wezterm.strftime '%H:%M'
  table.insert(elements, { Foreground = { Color = basic_color } })
  table.insert(elements, { Text = SOLID_LEFT_ARROW })
  table.insert(elements, { Foreground = { Color = '#19181a' } })
  table.insert(elements, { Background = { Color = basic_color } })
  table.insert(elements, { Attribute = { Intensity = "Normal" } })
  table.insert(elements, { Text = ' ' .. date .. ' ' })

  window:set_right_status(wezterm.format(elements))

  elements = {}
  window:set_left_status(wezterm.format(elements))
end)

wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
  local basename = function(s)
    s = string.gsub(s, "(.*[/\\])(.*)", "%2")
    return s:gsub(".exe\x20*" .. "$", "") -- x20 is space
  end

  -- local _title = tab.active_pane.foreground_process_name
  local _title = tab.active_pane.title
  local title = wezterm.truncate_right(basename(_title), max_width - 2)
  title = (tab.tab_index + 1) .. ": " .. title

  panes = panes
  config = config
  max_width = max_width

  local background = NORMAL_TAB_BG
  local foreground = NORMAL_TAB_FG

  local is_first = tab.tab_id == tabs[1].tab_id
  local is_last = tab.tab_id == tabs[#tabs].tab_id

  if tab.is_active then
    background = ACTIVE_TAB_BG
    foreground = ACTIVE_TAB_FG
  elseif hover then
    background = HOVER_TAB_BG
    foreground = HOVER_TAB_FG
  end

  local leading_fg = NORMAL_TAB_FG
  local leading_bg = background

  local trailing_fg = background
  local trailing_bg = NORMAL_TAB_BG

  if is_first then
    leading_fg = TAB_BAR_BG
  else
    leading_fg = NORMAL_TAB_BG
  end

  if is_last then
    trailing_bg = TAB_BAR_BG
  else
    trailing_bg = NORMAL_TAB_BG
  end


  return {
    { Attribute = { Italic = false } },
    { Attribute = { Intensity = hover and "Bold" or "Normal" } },
    { Background = { Color = leading_bg } }, { Foreground = { Color = leading_fg } },
    { Text = SOLID_RIGHT_ARROW },
    { Background = { Color = background } }, { Foreground = { Color = foreground } },
    { Text = " " .. title .. " " },
    { Background = { Color = trailing_bg } }, { Foreground = { Color = trailing_fg } },
    { Text = SOLID_RIGHT_ARROW },
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
