-- Hyprland keybinds (Lua syntax, since Hyprland 0.55)
-- See https://wiki.hypr.land/Configuring/Basics/Binds/

local terminal = "ghostty"
local fileManager = "thunar"
local menu = "noctalia-shell ipc call launcher toggle"
local browser = "helium"
local mainMod = "SUPER"

-- Apps / session
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + M", hl.dsp.exit())
hl.bind(mainMod .. " + ALT + M", hl.dsp.exec_cmd("poweroff"), { locked = true })
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind(mainMod .. " + T", hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(menu))
hl.bind("Print", hl.dsp.exec_cmd("hyprshot -m region -z -o ~/Pictures/Screenshots"))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("noctalia-shell ipc call sessionMenu lock"))

-- Move focus
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "r" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "d" }))

-- Switch workspaces
for i = 1, 9 do
    hl.bind(mainMod .. " + " .. i, hl.dsp.focus({ workspace = i }))
    end
    hl.bind(mainMod .. " + 0", hl.dsp.focus({ workspace = 10 }))
    hl.bind(mainMod .. " + minus", hl.dsp.focus({ workspace = "-1" }))
    hl.bind(mainMod .. " + equal", hl.dsp.focus({ workspace = "+1" }))

    -- Move active window to workspace
    for i = 1, 9 do
        hl.bind(mainMod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = i }))
        end
        hl.bind(mainMod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = 10 }))
        hl.bind(mainMod .. " + SHIFT + minus", hl.dsp.window.move({ workspace = "-1" }))
        hl.bind(mainMod .. " + SHIFT + equal", hl.dsp.window.move({ workspace = "+1" }))

        -- Special workspace (scratchpad)
        hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
        hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

        -- Scroll through workspaces with SUPER + scroll
        hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
        hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

        -- Move / resize windows with SUPER + LMB/RMB drag
        hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
        hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

        -- Resize active window with mainMod + SHIFT + arrows
        hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.resize({ x = -50, y = 0, relative = true }), { repeating = true })
        hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.resize({ x = 50, y = 0, relative = true }), { repeating = true })
        hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.resize({ x = 0, y = -50, relative = true }), { repeating = true })
        hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.resize({ x = 0, y = 50, relative = true }), { repeating = true })

        -- Swap / move active window with mainMod + ALT + arrows
        hl.bind(mainMod .. " + ALT + left", hl.dsp.window.swap({ direction = "l" }))
        hl.bind(mainMod .. " + ALT + left", hl.dsp.window.move({ x = -50, y = 0 }), { repeating = true })
        hl.bind(mainMod .. " + ALT + right", hl.dsp.window.swap({ direction = "r" }))
        hl.bind(mainMod .. " + ALT + right", hl.dsp.window.move({ x = 50, y = 0 }), { repeating = true })
        hl.bind(mainMod .. " + ALT + up", hl.dsp.window.swap({ direction = "u" }))
        hl.bind(mainMod .. " + ALT + up", hl.dsp.window.move({ x = 0, y = -50 }), { repeating = true })
        hl.bind(mainMod .. " + ALT + down", hl.dsp.window.swap({ direction = "d" }))
        hl.bind(mainMod .. " + ALT + down", hl.dsp.window.move({ x = 0, y = 50 }), { repeating = true })

        -- Move current workspace between monitors
        hl.bind(mainMod .. " + CTRL + left", hl.dsp.workspace.move({ monitor = "l" }))
        hl.bind(mainMod .. " + CTRL + right", hl.dsp.workspace.move({ monitor = "r" }))

        -- Volume / brightness (locked + repeating)
        hl.bind(
            "XF86AudioRaiseVolume",
            hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 2%+"),
                { locked = true, repeating = true }
        )
        hl.bind(
            "XF86AudioLowerVolume",
            hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-"),
                { locked = true, repeating = true }
        )
        hl.bind(
            "XF86AudioMute",
            hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_SOURCE@ toggle && wpctl set-mute @DEFAULT_SINK@ toggle"),
                { locked = true }
        )
        hl.bind("CTRL + XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_SOURCE@ toggle"), { locked = true })
        hl.bind("SHIFT + XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_SINK@ toggle"), { locked = true })
        hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
        hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

        -- Media keys (work while screen is locked)
        hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
        hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
        hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
        hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
