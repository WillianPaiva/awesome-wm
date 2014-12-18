--[[                                        ]]--
----                                          -
----    Blackburn Awesome WM 3.5.+ theme      --
----       github.com/copycat-killer          --
----                                          -
----[[                                      ]]--


theme = {}

themes_dir                                  = os.getenv("HOME") .. "/.config/awesome/themes/blackburn"
theme.wallpaper                             = themes_dir .. "/wall3.jpg"

themes_bg_normal                            = "png:" .. themes_dir .. "/taskbar/bg_normal.png"
themes_bg_focus                             = "png:" .. themes_dir .. "/taskbar/bg_focus.png"

theme.font                                  = "Ubuntu Mono 9"
theme.fg_normal                             = "#43454f"
theme.fg_focus                              = "#f40b20"
theme.fg_urgent                             = "#224440"
theme.bg_normal                             = "#01080a"
theme.bg_focus                              = "#01080a"
theme.bg_urgent                             = "#051014"
theme.border_width                          = "1"
theme.border_normal                         = "#292727"
theme.border_focus                          = "#3d3a3a"
theme.border_marked                         = "#292741"
theme.titlebar_bg_focus                     = "#091114"
theme.titlebar_bg_normal                    = "#091154"
theme.taglist_fg_focus                      = "#529366"
theme.tasklist_bg_focus                     = "#01080a"
theme.tasklist_fg_focus                     = "#bf1e2d"
theme.textbox_widget_margin_top             = 1
theme.notify_fg                             = theme.fg_normal
theme.notify_bg                             = theme.bg_normal
theme.notify_border                         = theme.border_focus
theme.taglist_bg_focus                      = "#01080a"
theme.awful_widget_height                   = 14
theme.awful_widget_margin_top               = 10
theme.awful_widget_margin_bottom			= 10
theme.awful_widget_margin_left				= 10
theme.awful_widget_margin_right				= 10
theme.mouse_finder_color                    = "#CC9393"
-- theme.menu_height                           = "16"
-- theme.menu_width                            = "140"
theme.useless_gap_width = 15

-- Variables set for theming the menu:
theme.menu_submenu_icon = themes_dir .. "/icons/submenu.png"
theme.menu_height = "15"
theme.menu_width  = "100"

 
-- Define the image to load
theme.titlebar_close_button_normal = "/usr/share/awesome/themes/default/titlebar/close_normal.png"
theme.titlebar_close_button_focus  = "/usr/share/awesome/themes/default/titlebar/close_focus.png"
 
theme.titlebar_ontop_button_normal_inactive = "/usr/share/awesome/themes/default/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive  = "/usr/share/awesome/themes/default/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = "/usr/share/awesome/themes/default/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active  = "/usr/share/awesome/themes/default/titlebar/ontop_focus_active.png"
 
theme.titlebar_sticky_button_normal_inactive = "/usr/share/awesome/themes/default/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive  = "/usr/share/awesome/themes/default/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = "/usr/share/awesome/themes/default/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active  = "/usr/share/awesome/themes/default/titlebar/sticky_focus_active.png"
 
theme.titlebar_floating_button_normal_inactive = "/usr/share/awesome/themes/default/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive  = "/usr/share/awesome/themes/default/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = "/usr/share/awesome/themes/default/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active  = "/usr/share/awesome/themes/default/titlebar/floating_focus_active.png"
 
theme.titlebar_maximized_button_normal_inactive = "/usr/share/awesome/themes/default/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = "/usr/share/awesome/themes/default/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = "/usr/share/awesome/themes/default/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active  = "/usr/share/awesome/themes/default/titlebar/maximized_focus_active.png"
 
-- You can use your own layout icons like this:
theme.menu_submenu_icon                     = themes_dir .. "/icons/submenu.png"
theme.taglist_squares_sel                   = themes_dir .. "/icons/square_sel.png"
theme.taglist_squares_unsel                 = themes_dir .. "/icons/square_unsel.png"

theme.layout_tile                           = themes_dir .. "/icons/tile.png"
theme.layout_tileleft                       = themes_dir .. "/icons/tileleft.png"
theme.layout_uselesstile                    = themes_dir .. "/icons/tile.png"
theme.layout_tilebottom                     = themes_dir .. "/icons/tilebottom.png"
theme.layout_tiletop                        = themes_dir .. "/icons/tiletop.png"
theme.layout_fairv                          = themes_dir .. "/icons/fairv.png"
theme.layout_fairh                          = themes_dir .. "/icons/fairh.png"
theme.layout_spiral                         = themes_dir .. "/icons/spiral.png"
theme.layout_dwindle                        = themes_dir .. "/icons/dwindle.png"
theme.layout_max                            = themes_dir .. "/icons/max.png"
theme.layout_fullscreen                     = themes_dir .. "/icons/fullscreen.png"
theme.layout_magnifier                      = themes_dir .. "/icons/magnifier.png"
theme.layout_floating                       = themes_dir .. "/icons/floating.png"
 
-- Vicious
 
theme.widget_sys        = themes_dir .. "/widgets/dish.png"
theme.widget_pac        = themes_dir .. "/widgets/pacman.png"
theme.widget_arch       = themes_dir .. "/widgets/arch.png"
theme.widget_temp       = themes_dir .. "/widgets/temp.png"
theme.widget_uptime     = themes_dir .. "/widgets/ac.png"
theme.widget_cpu        = themes_dir .. "/widgets/cpu.png"
theme.widget_mem        = themes_dir .. "/widgets/mem.png"
theme.widget_fs         = themes_dir .. "/widgets/fs.png"
theme.widget_netdown    = themes_dir .. "/widgets/net_down.png"
theme.widget_netup      = themes_dir .. "/widgets/net_up.png"
theme.widget_gmail      = themes_dir .. "/widgets/mail.png"
theme.widget_batt       = themes_dir .. "/widgets/bat.png"
theme.widget_clock      = themes_dir .. "/widgets/clock.png"
theme.widget_vol        = themes_dir .. "/widgets/spkr.png"
return theme
