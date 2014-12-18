--[[                                     ]]--
--                                         -
--      z1lt0id Awesome WM 3.5.+ config    --
--           github.com/z1lt0id            --
--    					   --
--      Varation of  github.com/copycat    --
--                                         -
--[[                                     ]]--


-- Required Libraries

gears 	        = require("gears")
awful           = require("awful")
awful.rules     = require("awful.rules")
awful.autofocus = require("awful.autofocus")
wibox           = require("wibox")
beautiful       = require("beautiful")
naughty         = require("naughty")
vicious         = require("vicious")
scratch         = require("scratch")
local lain      = require("lain")
awful.remote    = require("awful.remote")
screenful       = require("screenful")
--local eminent   = require("eminent")

-- layouts
layouts         = require("layouts")

-- Conky
function get_conky()
    local clients = client.get()
    local conky = nil
    local i = 1
    while clients[i]
    do
        if clients[i].class == "Conky"
        then
            conky = clients[i]
        end
        i = i + 1
    end
    return conky
end
function raise_conky()
    local conky = get_conky()
    if conky
    then
        conky.ontop = true
    end
end
function lower_conky()
    local conky = get_conky()
    if conky
    then
        conky.ontop = false
    end
end
function toggle_conky()
    local conky = get_conky()
    if conky
    then
        if conky.ontop
        then
            conky.ontop = false
        else
            conky.ontop = true
        end
    end
end


-- Run once function

function run_once(cmd)
  findme = cmd
  firstspace = cmd:find(" ")
  if firstspace then
     findme = cmd:sub(0, firstspace-1)
  end
  awful.util.spawn_with_shell("pgrep -u $USER -x " .. findme .. " > /dev/null || (" .. cmd .. ")")
 end




run_once("killall conky")
run_once("compton --backend glx --paint-on-overlay --vsync opengl-swc --unredir-if-possible --shadow-exclude 'n:a:synapse' --blur-background-exclude 'n:a:synapse' --config ~/.compton.conf -b")
run_once("nm-applet")
run_once("setxkbmap fr -option caps:escape")

run_once("scrl.sh")
--run_once("xscreensaver -nosplash")
run_once("batterymon")
--run_once("copyq")
run_once("caffeine")
run_once("synapse")
run_once("volumeicon")
run_once("blueman-applet")

run_once("/opt/dropbox/dropboxd")
run_once("pulseaudio")
run_once("mopidy")
--run_once("dropboxd")
--run_once("/home/willian/.conky/NightDrive/start_conky.sh")
run_once("xset -b")
run_once("conky ~/.conkyrc")
run_once("unclutter -idle 10")
run_once("octopi-notifier")


-- Localization

--os.setlocale("en_US.UTF-8")


-- Error Handling

-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
    in_error = false
    awesome.connect_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = err })
        in_error = false
    end)
end


-- Variable Definitions

home = os.getenv("HOME")
confdir = home .. "/.config/awesome"
scriptdir = confdir .. "/script/"
themes = confdir .. "/themes"
active_theme = themes .. "/blackburn"

beautiful.init(active_theme .. "/theme.lua")

terminal = "terminology"
editor = "vim"
editor_cmd = terminal .. " -e " .. editor
gui_editor = "gvim"
browser = "dwb"
browser2 = "dwb"
mail = terminal .. " -g 130x30 -e mutt "
tasks = terminal .. " -e htop "
musicplr = terminal .. " -g 130x34-320+16 -e ncmpcpp "

modkey = "Mod4"
altkey = "Mod1"


-- Table of layouts to cover with awful.layout.inc, order matters.
layouts =
{
	--lain.layout.uselesstile,
	--lain.layout.uselesspiral,
	--lain.layout.uselessfair,
    awful.layout.suit.tile,
    awful.layout.suit.tile.left,
    awful.layout.suit.fair,
    awful.layout.suit.max,
    lain.layout.centerwork,
    awful.layout.suit.magnifier
}
-- }}}


-- Wallpaper

if beautiful.wallpaper then
    for s = 1, screen.count() do
        gears.wallpaper.maximized(beautiful.wallpaper, s, true)
    end
end

-- Tags

tags = {
       names = { "➊", "➋", "➌", "➍", "➎", "➏", "➐", "➑", "➒"},
       layout = { layouts[1], layouts[1], layouts[1], layouts[1], layouts[1], layouts[1], layouts[1], layouts[1], layouts[1] }
       }
for s = 1, screen.count() do
   tags[s] = awful.tag(tags.names, s, tags.layout)
end
-- Menu
require("freedesktop/freedesktop")

--mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
  --                                   menu = mymainmenu })

-- Colours
coldef  = "</span>"
colwhi  = "<span color='#b2b2b2'>"
colbwhi = "<span color='#ffffff'>"
blue = "<span color='#7493d2'>"
yellow = "<span color='#e0da37'>"
grey = "<span color='#636060'>"
purple = "<span color='#e33a6e'>"
lightpurple = "<span color='#eca4c4'>"
azure = "<span color='#80d9d8'>"
green = "<span color='#87af5f'>"
lightgreen = "<span color='#62b786'>"
red = "<span color='#bd0707'>"
orange = "<span color='#ff7100'>"
brown = "<span color='#db842f'>"
fuchsia = "<span color='#800080'>"
gold = "<span color='#e7b400'>"
lightblue="<span color='#3eae9e'>"
lightblue2="<span color='#266c76'>"
lightblue3="<span color='#285666'>"
lightblue4="<span color='#257c85'>"
lightblue5="<span color='#223d5a'>"
lightblue6="<span color='#235369'>"

offyellow="<span color='#857b52'>"
bottomgrey="<span color='#999999'>"

-- {{{ Wibox

-- {{{{ Temp

tempicon = wibox.widget.imagebox()
tempicon:set_image(beautiful.widget_temp)
tempwidget = wibox.widget.textbox()
vicious.register(tempwidget, vicious.widgets.thermal, bottomgrey .. "  Temp: $1°C" .. coldef, 15, "thermal_zone0")


-- }}}

-- {{{ Kernel Info

sysicon = wibox.widget.imagebox()
sysicon:set_image(beautiful.widget_arch)
syswidget = wibox.widget.textbox()
vicious.register( syswidget, vicious.widgets.os, bottomgrey .. "  Kernel: $2" .. coldef)

-- }}}

-- {{{ Uptime

uptimeicon = wibox.widget.imagebox()
uptimeicon:set_image(beautiful.widget_uptime)
uptimewidget = wibox.widget.textbox()
vicious.register( uptimewidget, vicious.widgets.uptime, bottomgrey .. "  Uptime: $1d $2h $3m" .. coldef)

-- }}}

-- {{{ Cpu

-- CPU widget
cpuicon = wibox.widget.imagebox()
cpuicon:set_image(beautiful.widget_cpu)
cpuwidget = wibox.widget.textbox()
vicious.register(cpuwidget, vicious.widgets.cpu, bottomgrey .. "  Cpu: $1%" .. coldef, 15)
cpuicon:buttons(awful.util.table.join(awful.button({ }, 1, function () awful.util.spawn(tasks, false) end)))

-- }}}


-- {{{ Ram

-- Memory widget
memicon = wibox.widget.imagebox()
memicon:set_image(beautiful.widget_mem)
memwidget = wibox.widget.textbox()
vicious.register(memwidget, vicious.widgets.mem, bottomgrey .. "  Memory: $2MB" .. coldef, 15)

-- }}}

-- {{{ Mpd

--mpdicon = wibox.widget.imagebox()
--mpdicon:set_image(beautiful.widget_mpd)
--mpdwidget = wibox.widget.textbox()
-- Register widget
--vicious.register(mpdwidget, vicious.widgets.mpd,
    --function (widget, args)
        --if args["{state}"] == "Stop" then
            --return " - "
        --else
            --return args["{Artist}"]..' - '.. args["{Title}"]
        --end
    --end, 10)





-- }}}

-- {{{ Net
-- Net widget
netdownicon = wibox.widget.imagebox()
netdownicon:set_image(beautiful.widget_netdown)
netdownicon.align = "middle"
netdowninfo = wibox.widget.textbox()
vicious.register(netdowninfo, vicious.widgets.net, green .. "${eno1 down_kb}" .. coldef, 1)
netupicon = wibox.widget.imagebox()
netupicon:set_image(beautiful.widget_netup)
netupicon.align = "middle"
netupinfo = wibox.widget.textbox()
vicious.register(netupinfo, vicious.widgets.net, red .. "${eno1 up_kb}" .. coldef, 1)


ethdowninfo = wibox.widget.textbox()
vicious.register(ethdowninfo, vicious.widgets.net, "<span color=\"#d3c6d7\">${enp9s0 down_kb}</span>", 1)

ethupinfo = wibox.widget.textbox()
vicious.register(ethupinfo, vicious.widgets.net, "<span color=\"#d3c6d7\">${enp9s0 up_kb}</span>", 1)

-- }}}
--
--
-- Battery
baticon = wibox.widget.imagebox(beautiful.widget_batt)
batbar = awful.widget.progressbar()
batbar:set_color(beautiful.fg_normal)
batbar:set_width(55)
batbar:set_ticks(true)
batbar:set_ticks_size(6)
batbar:set_background_color(beautiful.bg_normal)
batmargin = wibox.layout.margin(batbar, 2, 7)
batmargin:set_top(6)
batmargin:set_bottom(6)
batupd = lain.widgets.bat({
    settings = function()
        if bat_now.perc == "N/A" then
            bat_perc = 100
            baticon:set_image(beautiful.ac)
        else
            bat_perc = tonumber(bat_now.perc)
            if bat_perc > 50 then
                batbar:set_color(beautiful.fg_normal)
                baticon:set_image(beautiful.widget_batt)
            elseif bat_perc > 15 then
                batbar:set_color(beautiful.fg_normal)
                baticon:set_image(beautiful.widget_batt)
            else
                batbar:set_color("#EB8F8F")
			baticon:set_image(beautiful.widget_batt)

            end

        end
        batbar:set_value(bat_perc / 100)
    end
})
batwidget = wibox.widget.background(batmargin)
batwidget:set_bgimage(beautiful.widget_bg)



-- {{{ Volume

-- Volume widget
--volicon = wibox.widget.imagebox()
--volicon:set_image(beautiful.widget_vol)
--volumewidget = wibox.widget.textbox()
--vicious.register(volumewidget, vicious.widgets.volume, bottomgrey .. "  Volume: $1%" .. coldef,  1, "Master")





volicon = wibox.widget.imagebox()
volicon:set_image(beautiful.widget_vol)
volume = lain.widgets.alsabar({width = 55, ticks = true, ticks_size = 6,
settings = function()
    if volume_now.status == "off" then
        volicon:set_image(beautiful.widget_vol)
    elseif volume_now.level == 0 then
        volicon:set_image(beautiful.widget_vol)
    elseif volume_now.level <= 50 then
        volicon:set_image(beautiful.widget_vol)
    else
        volicon:set_image(beautiful.widget_vol)
    end
end,
colors =
{
    background = beautiful.bg_normal,
    mute = "#EB8F8F",
    unmute = beautiful.fg_normal
}})
volmargin = wibox.layout.margin(volume.bar, 2, 7)
volmargin:set_top(6)
volmargin:set_bottom(6)
volumewidget = wibox.widget.background(volmargin)
volumewidget:set_bgimage(beautiful.widget_bg)


-- }}}

-------------------
-- Pacman Widget --
-------------------

-- Pacman Icon
pacicon = wibox.widget.imagebox()
pacicon:set_image(beautiful.widget_pac)

-- Pacman Widget
pacwidget = wibox.widget.textbox()
pacwidget_t = awful.tooltip({ objects = {pacwidget},})
vicious.register(pacwidget, vicious.widgets.pkg,
                function(widget,args)
                    local io = { popen = io.popen }
                    local s = io.popen("pacman -Qu")
                    local str = ''
                    for line in s:lines() do
                        str = str .. line .. "\n"
                    end
                    pacwidget_t:set_text(str)
                    s:close()
                    return "" .. bottomgrey .. "  Updates: " .. args[1] .. coldef
                end, 60, "Arch")
                --'1800' means check every 30 minutes

pacicon:buttons(awful.util.table.join(
    awful.button({ }, 3, function () awful.util.spawn("".. terminal.. " --hold -e sudo pacman -Syu", false) end),
    awful.button({ }, 1, function () awful.util.spawn("sudo pacman -Syu", false) end)
))



-- {{{ Clock

-- Textclock widget
clockicon = wibox.widget.imagebox()
clockicon:set_image(beautiful.widget_clock)
mytextclock = awful.widget.textclock(bottomgrey .. "  %A %d %B</span> " .. colwhi .. "</span><span color=\"#ffffff\">></span> <span color='#999999'>%H:%M</span>")

-- }}}

-- {{{ Spacers
space = wibox.widget.textbox()
space:set_text('    ')

-- {{{ Seperator
openb = wibox.widget.textbox(lightblue6 .. " [" .. coldef)
closeb = wibox.widget.textbox(lightblue6 .. " ]" .. coldef)

-- }}}

-- Create a wibox for each screen and add it
mywibox = {}
mybottomwibox = {}
bottombox = {}
mypromptbox = {}
mylayoutbox = {}
mytaglist = {}
mytaglist.buttons = awful.util.table.join(
                    awful.button({ }, 1, awful.tag.viewonly),
                    awful.button({ modkey }, 1, awful.client.movetotag),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, awful.client.toggletag),
                    awful.button({ }, 4, function(t) awful.tag.viewnext(awful.tag.getscreen(t)) end),
                    awful.button({ }, 5, function(t) awful.tag.viewprev(awful.tag.getscreen(t)) end)
                    )
mytasklist = {}
mytasklist.buttons = awful.util.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
                                                  -- Without this, the following
                                                  -- :isvisible() makes no sense
                                                  c.minimized = false
                                                  if not c:isvisible() then
                                                      awful.tag.viewonly(c:tags()[1])
                                                  end
                                                  -- This will also un-minimize
                                                  -- the client, if needed
                                                  client.focus = c
                                                  c:raise()
                                              end
                                          end),
                     awful.button({ }, 3, function ()
                                              if instance then
                                                  instance:hide()
                                                  instance = nil
                                              else
                                                  instance = awful.menu.clients({ width=250 })
                                              end
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                              if client.focus then client.focus:raise() end
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                              if client.focus then client.focus:raise() end
                                          end))

for s = 1, screen.count() do
    -- Create a promptbox for each screen
    mypromptbox[s] = awful.widget.prompt()
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    mylayoutbox[s] = awful.widget.layoutbox(s)
    mylayoutbox[s]:buttons(awful.util.table.join(
                           awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
                           awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)))
    -- Create a taglist widget
    mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.filter.all, mytaglist.buttons)

    -- Create a tasklist widget
    mytasklist[s] = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, mytasklist.buttons)

    -- Create the wibox
    mywibox[s] = awful.wibox({ position = "top", screen = s })


    -- Widgets that are aligned to the left
    local left_layout = wibox.layout.fixed.horizontal()
    left_layout:add(mylauncher)
    left_layout:add(mypromptbox[s])


    -- Widgets that are aligned to the right
    local right_layout = wibox.layout.fixed.horizontal()
    right_layout:add(space)
    right_layout:add(space)
	

	right_layout:add(baticon)
    right_layout:add(batwidget)
    right_layout:add(mylayoutbox[s])

    -- Now bring it all together (with the tasklist in the middle)
    local layout = wibox.layout.align.horizontal()
    layout:set_left(left_layout)
    -- layout:set_middle(mytasklist[s])
    layout:set_middle(mytaglist[s])
    layout:set_right(right_layout)

    mywibox[s]:set_widget(layout)

    -- Create Bottom WiBox
    mybottomwibox[s] = awful.wibox({ position = "bottom", screen = s })

    -- Widgets Aligned to the Middle
    local bottom_left_layout = wibox.layout.fixed.horizontal()
    bottom_left_layout:add(sysicon)
    bottom_left_layout:add(syswidget)
  --  bottom_left_layout:add(space)
  --  bottom_left_layout:add(volicon)
  --  bottom_left_layout:add(volumewidget)
    bottom_left_layout:add(space)
    bottom_left_layout:add(cpuicon)
    bottom_left_layout:add(cpuwidget)
    bottom_left_layout:add(space)
    bottom_left_layout:add(memicon)
    bottom_left_layout:add(memwidget)
    bottom_left_layout:add(space)
    bottom_left_layout:add(tempicon)
    bottom_left_layout:add(tempwidget)
    bottom_left_layout:add(space)
    bottom_left_layout:add(pacicon)
    bottom_left_layout:add(pacwidget)
    bottom_left_layout:add(space)
    bottom_left_layout:add(uptimeicon)
    bottom_left_layout:add(uptimewidget)
    bottom_left_layout:add(space)
    bottom_left_layout:add(clockicon)
    bottom_left_layout:add(mytextclock)


    local bottom_right_layout = wibox.layout.fixed.horizontal()
    if s == 1 then bottom_right_layout:add(wibox.widget.systray()) end

    -- Bring Bottom Wibox Together
    local bottom_layout = wibox.layout.align.horizontal()
    bottom_layout:set_middle(bottom_left_layout)
    bottom_layout:set_right(bottom_right_layout)
    mybottomwibox[s]:set_widget(bottom_layout)
end
-- }}}


-- Mouse Bindings

root.buttons(awful.util.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))


-- Key bindings
globalkeys = awful.util.table.join(

    -- Capture a screenshot
    awful.key({ altkey }, "p", function() awful.util.spawn("screenshot",false) end),



    -- Move clients
    awful.key({ altkey }, "Next",  function () awful.client.moveresize( 1,  1, -2, -2) end),
    awful.key({ altkey }, "Prior", function () awful.client.moveresize(-1, -1,  2,  2) end),
    awful.key({ altkey }, "Down",  function () awful.client.moveresize(  0,  1,   0,   0) end),
    awful.key({ altkey }, "Up",    function () awful.client.moveresize(  0, -1,   0,   0) end),
    awful.key({ altkey }, "Left",  function () awful.client.moveresize(-1,   0,   0,   0) end),
    awful.key({ altkey }, "Right", function () awful.client.moveresize( 1,   0,   0,   0) end),
    awful.key({ modkey,           }, "Left",   awful.tag.viewprev       ),
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext       ),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore),
    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.byidx( 1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "j",
        function ()
            awful.client.focus.byidx(-1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "w", function () mymainmenu:show({keygrabber=true}) end),

    -- Show/Hide Wibox
    awful.key({ modkey }, "b", function ()
        mywibox[mouse.screen].visible = not mywibox[mouse.screen].visible
        mybottomwibox[mouse.screen].visible = not mybottomwibox[mouse.screen].visible
    end),


    -- Application Switcher
     awful.key({ "Mod1" }, "Tab", function ()
     -- If you want to always position the menu on the same place set coordinates
     awful.menu.menu_keys.down = { "Down", "Alt_L" }
     local cmenu = awful.menu.clients({width=245}, { keygrabber=true, coords={x=525, y=330} })
 end),

    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end),
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto),
    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end),

    -- Standard program
    awful.key({ modkey,           }, "Return", function () awful.util.spawn(terminal) end),
    awful.key({ modkey, "Control" }, "r", awesome.restart),
    awful.key({ modkey, "Shift"   }, "q", awesome.quit),
    awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)     end),
    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)     end),
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1)       end),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1)       end),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1)          end),
	awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1)          end),
    awful.key({ modkey,           }, "space", function () awful.layout.inc(layouts,  1)  end),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(layouts, -1)  end),
    awful.key({ modkey, "Control" }, "n", awful.client.restore),
	awful.key({"Control"}, "space", function() awful.util.spawn( "synapse" ) end),
	--	awful.key({ modkey, "Control" }, "l", function () awful.util.spawn("xscreensaver-command -lock") end),
    --change scren
    awful.key({ modkey }, "z",function () awful.util.spawn('scrl.sh') end),


	-- Widgets popups

    -- Volume control
    awful.key({ "Control" }, "Up", function ()
                                       awful.util.spawn("amixer set Master playback 1%+", false )
                                       vicious.force({ volumewidget })
                                   end),
    awful.key({ "Control" }, "Down", function ()
                                       awful.util.spawn("amixer set Master playback 1%-", false )
                                       vicious.force({ volumewidget })
                                     end),
    awful.key({ "Control" }, "m", function ()
                                       awful.util.spawn("amixer set Master playback mute", false )
                                       vicious.force({ volumewidget })
                                     end),
    awful.key({ "Control" }, "u", function ()
                                      awful.util.spawn("amixer set Master playback unmute", false )
                                       vicious.force({ volumewidget })
                                  end),
    awful.key({ altkey, "Control" }, "m", function ()
                                              awful.util.spawn("amixer set Master playback 100%", false )
                                              vicious.force({ volumewidget })
                                          end),

	awful.key({ }, "XF86MonBrightnessDown", function () awful.util.spawn("xbacklight -dec 15") end),
	awful.key({ }, "XF86MonBrightnessUp", function () awful.util.spawn("xbacklight -inc 15") end),

	awful.key({ }, "XF86AudioRaiseVolume", function ()
       awful.util.spawn("amixer set Master 9%+") end),
	awful.key({ }, "XF86AudioLowerVolume", function ()
       awful.util.spawn("amixer set Master 9%-") end),
	 awful.key({ }, "XF86AudioMute", function ()
       awful.util.spawn("amixer sset Master toggle") end),

	-- Music control
    awful.key({ altkey, "Control" }, "Up", function ()
                                              awful.util.spawn( "mpc toggle", false )
                                              vicious.force({ mpdwidget } )
                                           end),
    awful.key({ altkey, "Control" }, "Down", function ()
                                                awful.util.spawn( "mpc stop", false )
                                                vicious.force({ mpdwidget } )
                                             end ),
    awful.key({ altkey, "Control" }, "Left", function ()
                                                awful.util.spawn( "mpc prev", false )
                                                vicious.force({ mpdwidget } )
                                             end ),
    awful.key({ altkey, "Control" }, "Right", function ()
                                                awful.util.spawn( "mpc next", false )
                                                vicious.force({ mpdwidget } )
                                              end ),

    -- Copy to clipboard
    awful.key({ modkey,        }, "c",      function () os.execute("xsel -p -o | xsel -i -b") end),

    -- User programs
    awful.key({ modkey,        }, "q",      function () awful.util.spawn( "dwb", false ) end),
    awful.key({ modkey, "Control" }, "m",       function () awful.util.spawn( terminal .. " -g 130x30 -e mutt", false ) end),

    awful.key({ modkey,        }, "s",      function () awful.util.spawn(gui_editor) end),
    awful.key({ modkey, "Control" }, "f", 	    function () awful.util.spawn( terminal .. " -depth 16 -g 130x30 -e ranger", false ) end),
    --awful.key({ modkey, "Control" }, "v",           function () awful.util.spawn( "/usr/local/bin/video", false) end),
    awful.key({ modkey,        }, "d", 	    function () awful.util.spawn( "thunar", false ) end),

    -- Conky

    -- Prompt
    awful.key({ modkey }, "r", function () mypromptbox[mouse.screen]:run() end),


    awful.key({ modkey }, "x",
              function ()
                  awful.prompt.run({ prompt = "Run Lua code: " },
                  mypromptbox[mouse.screen].widget,
                  awful.util.eval, nil,
                  awful.util.getdir("cache") .. "/history_eval")
              end)
)

clientkeys = awful.util.table.join(
    awful.key({ modkey,           }, "f",      function (c) c.fullscreen = not c.fullscreen  end),
    awful.key({ modkey, "Shift"   }, "c",      function (c) c:kill()                         end),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end),
    awful.key({ modkey,           }, "o",      awful.client.movetoscreen                        ),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end),
    awful.key({ modkey,           }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c.maximized_vertical   = not c.maximized_vertical
        end)
)

-- Compute the maximum number of digit we need, limited to 9

keynumber = 0
for s = 1, screen.count() do
   keynumber = math.min(9, math.max(#tags[s], keynumber));
end

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, keynumber do
    globalkeys = awful.util.table.join(globalkeys,
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        screen = mouse.screen
                        if tags[screen][i] then
                            awful.tag.viewonly(tags[screen][i])
                        end
                  end),
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      screen = mouse.screen
                      if tags[screen][i] then
                          awful.tag.viewtoggle(tags[screen][i])
                      end
                  end),
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus and tags[client.focus.screen][i] then
                          awful.client.movetotag(tags[client.focus.screen][i])
                      end
                  end),
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus and tags[client.focus.screen][i] then
                          awful.client.toggletag(tags[client.focus.screen][i])
                      end
                  end))
end

clientbuttons = awful.util.table.join(
    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
    awful.button({ modkey }, 1, awful.mouse.client.move),
    awful.button({ modkey }, 3, awful.mouse.client.resize))


-- Set keys
root.keys(globalkeys)


-- Rules

awful.rules.rules = {
     -- All clients will match this rule.
     { rule = { },
       properties = { border_width = beautiful.border_width,
                      border_color = beautiful.border_normal,
                      focus = true,
                      keys = clientkeys,
                      buttons = clientbuttons,
	                  size_hints_honor = false
                     }
    },

    { rule = { class = "MPlayer" },
      properties = { floating = true } },

    { rule = { class = "mpv" },
      properties = { floating = true } },

    { rule = { class = "Conky" },
          properties = {
          floating = true,
          sticky = true,
          ontop = false,
	  border_width = 0,
          focusable = false,
          size_hints = {"program_position", "program_size"}
    } },

}


-- Signals

-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c, startup)
    -- Enable sloppy focus
    c:connect_signal("mouse::enter", function(c)
        if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
            and awful.client.focus.filter(c) then
            client.focus = c
        end
    end)

    if not startup then
        -- Set the windows at the slave,
        -- i.e. put it at the end of others instead of setting it master.
        -- awful.client.setslave(c)

        -- Put windows in a smart way, only if they does not set an initial position.
        if not c.size_hints.user_position and not c.size_hints.program_position then
            awful.placement.no_overlap(c)
            awful.placement.no_offscreen(c)
        end
    end

    local titlebars_enabled = false
    if titlebars_enabled and (c.type == "normal" or c.type == "dialog") then
        -- Widgets that are aligned to the left
        local left_layout = wibox.layout.fixed.horizontal()
        left_layout:add(awful.titlebar.widget.iconwidget(c))

        -- Widgets that are aligned to the right
        local right_layout = wibox.layout.fixed.horizontal()
        right_layout:add(awful.titlebar.widget.floatingbutton(c))
        right_layout:add(awful.titlebar.widget.maximizedbutton(c))
        right_layout:add(awful.titlebar.widget.stickybutton(c))
        right_layout:add(awful.titlebar.widget.ontopbutton(c))
        right_layout:add(awful.titlebar.widget.closebutton(c))
        right_layout:add(awful.titlebar.widget.closebutton(c))

        -- The title goes in the middle
        local title = awful.titlebar.widget.titlewidget(c)
        title:buttons(awful.util.table.join(
                awful.button({ }, 1, function()
                    client.focus = c
                    c:raise()
                    awful.mouse.client.move(c)
                end),
                awful.button({ }, 3, function()
                    client.focus = c
                    c:raise()
                    awful.mouse.client.resize(c)
                end)
                ))

        -- Now bring it all together
        local layout = wibox.layout.align.horizontal()
        layout:set_left(left_layout)
        layout:set_right(right_layout)
        layout:set_middle(title)

        awful.titlebar(c):set_widget(layout)
    end
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
