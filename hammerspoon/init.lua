hs.hotkey.bind(
  {"cmd", "alt", "ctrl"},
  "W",
  function()
    hs.fnutils.each(
      hs.application.runningApplications(),
      function(app)
        hs.notify.new({title = "Mac App Names", informativeText = app:title()}):send()
        print(app:title())
      end
    )
  end
)

hs.hotkey.bind(
  {"cmd", "alt", "ctrl"},
  "Left",
  function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h
    win:setFrame(f)
  end
)

hs.hotkey.bind(
  {"cmd", "alt", "ctrl"},
  "Right",
  function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + (max.w / 2)
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h
    win:setFrame(f)
  end
)

-- 設定ファイル reload
hs.hotkey.bind(
  {"cmd", "alt", "ctrl"},
  "R",
  function()
    hs.reload()
  end
)

-- auto reload
function reloadConfig(files)
  doReload = false
  for _, file in pairs(files) do
    if file:sub(-4) == ".lua" then
      doReload = true
    end
  end
  if doReload then
    hs.reload()
  end
end
myWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
hs.alert.show("Config loaded")
