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
local awesompd = require("awesompd/awesompd")
layouts         = require("layouts")
local blingbling = require('blingbling')
require("powerline")
--notify limit icon size
naughty.config.presets.normal.icon_size = 50
naughty.config.presets.low.icon_size = 50
naughty.config.presets.critical.icon_size = 50

-- Run once function
function run_once(cmd)
    findme = cmd
    firstspace = cmd:find(" ")
    if firstspace then
        findme = cmd:sub(0, firstspace-1)
    end
    awful.util.spawn_with_shell("pgrep -u $USER -x " .. findme .. " > /dev/null || (" .. cmd .. ")")
end
run_once("compton --opacity-rule \"70:class_g = 'Thunar'\"  --backend glx --paint-on-overlay --vsync opengl-swc --unredir-if-possible --shadow-exclude 'n:a:synapse' --blur-background-exclude 'n:a:synapse' --config ~/.compton.conf -b")
run_once("nm-applet")
run_once("setxkbmap -option caps:escape")
run_once("scrl")
run_once("pulseaudio")
run_once("mopidy")
--run_once("xmodmap ~/.Xmodmap")
run_once("copyq")
run_once("dropbox")
run_once("xset -b")
run_once("unclutter -idle 4")
run_once("caffeine")

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
terminal = "urxvt"
editor = "emacsclient -nc -s /tmp/emacs1000/server"
editor_cmd = terminal .. " -e " .. editor
gui_editor = editor
browser = "qutebrowser"
browser2 = "qutebrowser"
mail = terminal .. " -g 130x30 -e mutt "
tasks = terminal .. " -e htop "
musicplr = terminal .. " -g 130x34-320+16 -e ncmpcpp "
modkey = "Mod4"
altkey = "Mod1"


-- Table of layouts to cover with awful.layout.inc, order matters.
layouts =
{
    lain.layout.uselesstile,
    lain.layout.uselesspiral,
    lain.layout.uselessfair,
    lain.layout.centerwork,
    awful.layout.suit.magnifier
}

-- Wallpaper

if beautiful.wallpaper then
    for s = 1, screen.count() do
        gears.wallpaper.maximized(beautiful.wallpaper, s, true)
    end
end

-- Tags

tags = {
    names = { "edt", "ter", "web", "tor", "dow", "vid"},
    layout = { layouts[1], layouts[1], layouts[1], layouts[1], layouts[1], layouts[1] },
}

for s = 1, screen.count() do
    tags[s] = awful.tag(tags.names, s, tags.layout)
end
-- Menu
require("freedesktop/freedesktop")


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

--TODO
-- tempicon = wibox.widget.imagebox()
-- tempicon:set_image(beautiful.widget_temp)
-- tempwidget = wibox.widget.textbox()
-- vicious.register(tempwidget, vicious.widgets.thermal, bottomgrey .. "  Temp: $1°C" .. coldef, 15, "thermal_zone0")


-- }}}

-- {{{ Cpu

-- CPU widget

cpu_graph = blingbling.line_graph({ height = 18,
                                        width = 100,
                                        show_text = false,
                                        rounded_size = 0.3,
                                        graph_background_color = "#00000033",
                                        graph_color = "#7e57c2",
                                        graph_line_color = "#7e57c2"
                                      })
vicious.register(cpu_graph, vicious.widgets.cpu,'$1',2)

mem_graph = blingbling.line_graph({ height = 18,
                                        width = 100,
                                        show_text = false,
                                        rounded_size = 0.3,
                                        graph_background_color = "#00000033",
                                        graph_color = "#ef5350",
                                        graph_line_color = "#ef5350"
                                      })
vicious.register(mem_graph, vicious.widgets.mem,'$1',2)
-- }}}


-- {{{ Mpd
--TODO
-- musicwidget = awesompd:create() -- Create awesompd widget
-- musicwidget.font = "Liberation Mono" -- Set widget font
-- musicwidget.scrolling = true -- If true, the text in the widget will be scrolled
-- musicwidget.output_size = 30 -- Set the size of widget in symbols
-- musicwidget.update_interval = 10 -- Set the update interval in seconds

-- Set the folder where icons are located (change username to your login name)

-- musicwidget.path_to_icons = "/home/willian/.config/awesome/awesompd/icons"

-- Set the default music format for Jamendo streams. You can change
-- this option on the fly in awesompd itself.
-- possible formats: awesompd.FORMAT_MP3, awesompd.FORMAT_OGG

-- musicwidget.jamendo_format = awesompd.FORMAT_MP3

-- If true, song notifications for Jamendo tracks and local tracks will also contain
-- album cover image.

-- musicwidget.show_album_cover = true

-- Specify how big in pixels should an album cover be. Maximum value
-- is 100.

-- musicwidget.album_cover_size = 50

-- This option is necessary if you want the album covers to be shown
-- for your local tracks.
--musicwidget.mpd_config = "/home/username/.mpdconf"
-- Specify the browser you use so awesompd can open links from
-- Jamendo in it.

-- musicwidget.browser = "firefox"

-- Specify decorators on the left and the right side of the
-- widget. Or just leave empty strings if you decorate the widget
-- from outside.

-- musicwidget.ldecorator = " "
-- musicwidget.rdecorator = " "

-- Set all the servers to work with (here can be any servers you use)

-- musicwidget.servers = {
--     { server = "localhost",
--     port = 6600 }}

    -- Set the buttons of the widget

--     musicwidget:register_buttons({ { "", awesompd.MOUSE_LEFT, musicwidget:command_playpause() },
--                                  { "Control", awesompd.MOUSE_SCROLL_UP, musicwidget:command_prev_track() },
--                                  { "Control", awesompd.MOUSE_SCROLL_DOWN, musicwidget:command_next_track() },
--                                  { "", awesompd.MOUSE_SCROLL_UP, musicwidget:command_volume_up() },
--                                  { "", awesompd.MOUSE_SCROLL_DOWN, musicwidget:command_volume_down() },
--                                  { "", awesompd.MOUSE_RIGHT, musicwidget:command_show_menu() },
--                                  { modkey, "Pause", musicwidget:command_playpause() } })
-- musicwidget:run() -- After all configuration is done, run the widget

-- }}}

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

--volume
volume_master = blingbling.volume({height = 18, width = 40, bar =true, show_text = false, graph_color="#03A9f4", pulseaudio = true})
volume_master:update_master()
volume_master:set_master_control()
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
    mytag={}
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
    -- mytag[s]=blingbling.tagslist(s, awful.widget.taglist.filter.all, mytaglist.buttons )
    -- Create a tasklist widget
    mytasklist[s] = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, mytasklist.buttons)

    -- Create the wibox
    mywibox[s] = awful.wibox({ position = "top", screen = s })


    -- Widgets that are aligned to the left
    local left_layout = wibox.layout.fixed.horizontal()
    left_layout:add(mytaglist[s])
    left_layout:add(mypromptbox[s])


    -- Widgets that are aligned to the right
    local right_layout = wibox.layout.fixed.horizontal()
    right_layout:add(powerline_widget)
    right_layout:add(cpu_graph)
    right_layout:add(mem_graph)
    right_layout:add(baticon)
    right_layout:add(batwidget)
    right_layout:add(volume_master)
    right_layout:add(mylayoutbox[s])
    if s == 1 then right_layout:add(wibox.widget.systray()) end
    -- Now bring it all together (with the tasklist in the middle)
    local layout = wibox.layout.align.horizontal()
    layout:set_left(left_layout)
    layout:set_right(right_layout)
    mywibox[s]:set_widget(layout)

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
awful.key({ modkey,           }, "Left",   awful.tag.viewprev       ),
awful.key({ modkey,           }, "Right",  awful.tag.viewnext       ),
awful.key({ modkey,           }, "Escape", awful.tag.history.restore),
awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incmwfact( 0.05)     end),
awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incmwfact(-0.05)     end),
awful.key({ modkey,           }, "w",
    function ()
        awful.client.focus.byidx( 1)
        if client.focus then client.focus:raise() end
        end),


-- Show/Hide Wibox
awful.key({ modkey }, "b", function ()
    mywibox[mouse.screen].visible = not mywibox[mouse.screen].visible
    end),


-- Application Switcher
awful.key({ "Mod1" }, "Tab", function ()
    -- If you want to always position the menu on the same place set coordinates
    awful.menu.menu_keys.down = { "Down", "Alt_L" }
    local cmenu = awful.menu.clients({width=245}, { keygrabber=true, coords={x=525, y=330} })
    end),

-- Layout manipulation
awful.key({ modkey, }, "h", function () awful.screen.focus_relative( 1) end),
awful.key({ modkey, }, "l", function () awful.screen.focus_relative(-1) end),


-- Standard program
awful.key({ modkey,           }, "Return", function () awful.util.spawn(terminal) end),
awful.key({ modkey, "Control" }, "r",
  function ()
    awful.util.spawn("pkill -f powerline")
    awesome.restart() end),
awful.key({ modkey, "Shift"   }, "q", awesome.quit),
awful.key({ modkey,           }, "space", function () awful.layout.inc(layouts,  1)  end),
awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(layouts, -1)  end),
awful.key({ modkey,  }, "p", function() awful.util.spawn("rofi -show run -font 'snap 10' -fg '#505050' -bg '#000000' -hlfg '#ffb964' -hlbg '#000000' -o 85"  ) end),



-- Widgets popups

awful.key({ }, "XF86MonBrightnessDown", function () awful.util.spawn("xbacklight -dec 15") end),
awful.key({ }, "XF86MonBrightnessUp", function () awful.util.spawn("xbacklight -inc 15") end),


awful.key({ }, "XF86AudioPlay", function () awful.util.spawn("mpc toggle") end),
awful.key({ }, "XF86AudioNext", function () awful.util.spawn("mpc next") end),
awful.key({ }, "XF86AudioPrev", function () awful.util.spawn("mpc prev") end),

awful.key({ }, "XF86AudioRaiseVolume", function ()
    awful.util.spawn("amixer set Master 9%+") end),
awful.key({ }, "XF86AudioLowerVolume", function ()
    awful.util.spawn("amixer set Master 9%-") end),
awful.key({ }, "XF86AudioMute", function ()
    awful.util.spawn("amixer sset Master toggle") end),



-- User programs
awful.key({ modkey,        }, "q",      function () awful.util.spawn( "qutebrowser" , false ) end),
awful.key({ modkey,        }, "s",      function () awful.util.spawn(gui_editor) end),
awful.key({ modkey,        }, "d", 	    function () awful.util.spawn( "thunar", false ) end),



-- Prompt
awful.key({ modkey }, "r", function () mypromptbox[mouse.screen]:run() end)


)

clientkeys = awful.util.table.join(
    awful.key({ modkey,           }, "f",      function (c) c.fullscreen = not c.fullscreen  end),
    awful.key({ modkey, "Shift"   }, "c",      function (c) c:kill()                         end),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end),
    awful.key({ modkey,           }, "o",      awful.client.movetoscreen                        ),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end)
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
properties = { floating = true , ontop = true } },

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
        awful.placement.no_offscreen(c)
        awful.placement.no_overlap(c)
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
