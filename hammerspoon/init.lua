-----------------------------------------------
-- Set up
-----------------------------------------------
local hyper = {"cmd", "alt", "ctrl"}
local hyperShift = {"cmd", "alt", "ctrl", "shift"}

-- disable animations
hs.window.animationDuration = 0

-- hide window shadows
hs.window.setShadows(false)

require "extensions"
require "keyboard_grid"

---------------------------------------------------------
-- SCREENS
---------------------------------------------------------

local cycleScreens = hs.fnutils.cycle(hs.screen.allScreens())

hs.hotkey.bind(hyper, "x", function()
  hs.window.focusedWindow():moveToScreen(cycleScreens())
end)

hs.hotkey.bind(hyperShift, "x", function()
  hs.window.focusedWindow():moveToScreen(cycleScreens())

  local toScreen = hs.window.focusedWindow():screen()

  local windows = hs.window.allWindows()
  for i = 1, #windows do
    windows[i]:moveToScreen(toScreen)
  end
end)

---------------------------------------------------------
-- APP HOTKEYS
---------------------------------------------------------

hs.hotkey.bind(hyper, "1", launchOrCycleFocus("Hyper"))
hs.hotkey.bind(hyper, "2", launchOrCycleFocus("Safari"))
hs.hotkey.bind(hyper, "3", launchOrCycleFocus("Google Chrome"))
hs.hotkey.bind(hyper, "4", launchOrCycleFocus("Slack"))
hs.hotkey.bind(hyper, "5", launchOrCycleFocus("Things"))
hs.hotkey.bind(hyper, "6", launchOrCycleFocus("Spotify"))
hs.hotkey.bind(hyper, "7", launchOrCycleFocus("Workflowy"))

hs.hotkey.bind(hyper, "Z", launchOrCycleFocus("Finder"))

-----------------------------------------------
-- hyper left arrow for left one half window
-----------------------------------------------

hs.hotkey.bind(hyper, "Left", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h
    win:setFrame(f)
end)

hs.hotkey.bind(hyperShift, "Left", function()
    local win = hs.window.focusedWindow()
    win:moveToScreen(cycleScreens())
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h
    win:setFrame(f)
end)

-----------------------------------------------
-- hyper right arrow for right one half window
-----------------------------------------------

hs.hotkey.bind(hyper, "Right", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + (max.w / 2)
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h
    win:setFrame(f)
end)

hs.hotkey.bind(hyperShift, "Right", function()
    local win = hs.window.focusedWindow()
    win:moveToScreen(cycleScreens())
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + (max.w / 2)
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h
    win:setFrame(f)
end)

-----------------------------------------------
-- hyper up arrow for fullscreen
-----------------------------------------------

hs.hotkey.bind(hyper, "Up", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w
    f.h = max.h
    win:setFrame(f)
end)

hs.hotkey.bind(hyperShift, "Up", function()
    local win = hs.window.focusedWindow()
    win:moveToScreen(cycleScreens())
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w
    f.h = max.h
    win:setFrame(f)
end)

hs.hotkey.bind(hyper, "m", function()
    local win = hs.window.focusedWindow()
    win:moveToScreen(cycleScreens())
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w
    f.h = max.h
    win:setFrame(f)
end)

-----------------------------------------------
-- Reload config on write
-----------------------------------------------

function reload_config(files)
    hs.reload()
end
hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reload_config):start()
hs.alert.show("Config loaded")

-----------------------------------------------
-- Hyper i to show window hints
-----------------------------------------------

hs.hotkey.bind(hyper, "i", function()
    hs.hints.windowHints()
end)

-----------------------------------------------
-- Hyper hjkl to switch window focus
-----------------------------------------------

hs.hotkey.bind(hyper, 'k', function()
    hs.window.focusedWindow():focusWindowNorth()
end)

hs.hotkey.bind(hyper, 'j', function()
    hs.window.focusedWindow():focusWindowSouth()
end)

hs.hotkey.bind(hyper, 'l', function()
    hs.window.focusedWindow():focusWindowEast()
end)

hs.hotkey.bind(hyper, 'h', function()
    hs.window.focusedWindow():focusWindowWest()
end)

---------------------------------------------------------
-- KEYBOARD-GRID WINDOW MANIPULATION
---------------------------------------------------------

-- # DEFINE A NEW GRID

local createNewGrid = hs.hotkey.modal.new(hyper, "W")

function createNewGridExit()
  createNewGrid:exit()
  mode.exit("keygrid", "newgrid")
end

createNewGrid:bind({}, 'escape', createNewGridExit)

function createNewGrid:entered()
  mode.enter("keygrid", "newgrid")
  hideGridfn = drawGrid()

  local function hideGridAndExit()
    if hideGridfn then hideGridfn() end
    createNewGridExit()
  end

  newKeyboardGrid(hideGridAndExit)
end

-- # RESIZE

local resizeWithCell = hs.hotkey.modal.new(hyper, "Q")

function resizeWithCellExit()
  resizeWithCell:exit()
  mode.exit("keygrid", "resize")
end
createNewGrid:bind({}, 'escape', resizeWithCellExit)

function resizeWithCell:entered()
  mode.enter("keygrid", "resize")
  hideGridfn = drawGrid()

  local function hideGridAndExit()
    if hideGridfn then hideGridfn() end
    resizeWithCellExit()
  end

  resizeGridWithCell(hideGridAndExit)
end
