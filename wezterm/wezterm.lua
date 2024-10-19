-- Pull in the wezterm API
local wezterm = require 'wezterm'

local mux = wezterm.mux
wezterm.on("gui-startup", function(cmd)
    local tab, pane, window = mux.spawn_window(cmd or {})
    window:gui_window():maximize()
end)
  
local config = wezterm.config_builder()

config.enable_scroll_bar = true

config.tab_bar_at_bottom = true

config.front_end = "OpenGL"
config.max_fps = 144
config.default_cursor_style = "BlinkingBlock"
config.animation_fps = 1
config.cursor_blink_rate = 500
config.term = "xterm-256color" -- Set the terminal type

config.window_background_opacity = 0.9
config.prefer_egl = true
config.font_size = 10
config.font = wezterm.font("RobotoMono Nerd Font Mono")

config.color_scheme = 'AdventureTime'
config.default_prog = { 'powershell.exe', '-NoLogo'}

config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false

-- config.window_decorations = "NONE"
config.window_decorations = "RESIZE | TITLE"
config.initial_rows = 30 -- adjust this value to your desired height
config.initial_cols = 160 -- adjust this value to your desired width


config.leader = {
  key = 'b',
  mods = 'CTRL',
  timeout_milliseconds = 2000,
}

config.keys = {
  {
    key = 'n',
    mods = 'LEADER',
    action = wezterm.action.ActivateTabRelative(1),
  },
  {
    key = 'p',
    mods = 'LEADER',
    action = wezterm.action.ActivateTabRelative(-1),
  },
  {
    key = '1',
    mods = 'LEADER',
    action = wezterm.action.ActivateTab(0)
  },
  {
    key = '2',
    mods = 'LEADER',
    action = wezterm.action.ActivateTab(1)
  },
  {
    key = '3',
    mods = 'LEADER',
    action = wezterm.action.ActivateTab(2)
  },
  {
    key = '4',
    mods = 'LEADER',
    action = wezterm.action.ActivateTab(3),
  },
  {
    key = '5',
    mods = 'LEADER',
    action = wezterm.action.ActivateTab(4),
  },
  {
    key = '6',
    mods = 'LEADER',
    action = wezterm.action.ActivateTab(5),
  },                                   
  {                                    
    key = '7',                         
    mods = 'LEADER',                   
    action = wezterm.action.ActivateTab(6),
  },                                   
  {                                    
    key = '8',                         
    mods = 'LEADER',                   
    action = wezterm.action.ActivateTab(7)
  },                                   
  {                                    
    key = '9',                         
    mods = 'LEADER',                   
    action = wezterm.action.ActivateTab(8),
  },
  
  { 
	key = 'l', 
	mods = 'LEADER', 
	action = wezterm.action.ShowLauncher 
  },
  { key = 'j', mods = 'LEADER', action = wezterm.action.ShowTabNavigator },
  -- Vertical split
  {
    -- |
    key = 'v',
    mods = 'LEADER',
    action = wezterm.action.SplitPane {
      direction = 'Right',
      size = { Percent = 50 },
    },
  },
    -- Horizontal split
  {
    -- -
    key = 'h',
    mods = 'LEADER',
    action = wezterm.action.SplitPane {
      direction = 'Down',
      size = { Percent = 50 },
    },
  },
  {                                    
    key = 'w',                         
    mods = 'LEADER',                   
    action = wezterm.action.CloseCurrentTab {
      confirm = true,
    },
  },
}

config.launch_menu = {
  {
    label = "Powershell",
    args = {"powershell", "-NoLogo"},
  },
  {
    label = "WSL UBUNTU 22.04",
    args = {"ubuntu.exe"},
  },
  {
    label = "HPSERVER",
    args = {"ssh", "thpserver"},
  },
  {
    label = "IVAN",
    args = {"ssh", "tivan"},
  },
  {
    label = "RYPI",
    args = {"ssh", "trypi"},
  },
}

return config
