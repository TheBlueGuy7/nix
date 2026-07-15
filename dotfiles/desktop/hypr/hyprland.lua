-- Hyprland config (Lua syntax, Hyprland 0.55+)
-- Reference: https://wiki.hypr.land/Configuring/

------------------
---- MONITORS ----
------------------

hl.monitor({ output = "DVI-D-1", mode = "1920x1080", position = "0x0", scale = 1 })
hl.monitor({ output = "HDMI-A-1", mode = "1920x1080", position = "1920x0", scale = 1 })

-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function()
	hl.exec_cmd("/run/current-system/sw/libexec/polkit-kde-authentication-agent-1")
	hl.exec_cmd("noctalia-shell")
	hl.exec_cmd("hypridle")
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

hl.env("XCURSOR_THEME", "BreezeX-RosePine-Linux")
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_THEME", "rose-pine-hyprcursor")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("QT_QPA_PLATFORMTHEME", "gtk3")
hl.env("QT_STYLE_OVERRIDE", "Adwaita-Dark")

-----------------------
---- LOOK AND FEEL ----
-----------------------

-- Noctalia theme colors — parsed live from ~/.config/hypr/noctalia/noctalia-colors.conf
-- (noctalia rewrites that file and runs `hyprctl reload`, which re-executes this Lua,
--  so the values below stay in sync with whatever colorscheme is active.)
local function load_noctalia_colors()
	local defaults = {
		primary = "rgb(58a6ff)",
		surface = "rgb(010409)",
		secondary = "rgb(bc8cff)",
		error = "rgb(f85149)",
		tertiary = "rgb(bc8cff)",
	}
	local path = os.getenv("HOME") .. "/.config/hypr/noctalia/noctalia-colors.conf"
	local f = io.open(path, "r")
	if not f then
		return defaults
	end
	for line in f:lines() do
		local name, value = line:match("^%s*%$(%w+)%s*=%s*(.-)%s*$")
		if name and value and defaults[name] ~= nil then
			defaults[name] = value
		end
	end
	f:close()
	return defaults
end

local noctalia = load_noctalia_colors()

hl.config({
	general = {
		gaps_in = 2,
		gaps_out = 5,

		border_size = 2,

		col = {
			active_border = "rgba(595959aa)",
			inactive_border = "rgba(2e2e35ff)",
		},

		resize_on_border = false,
		allow_tearing = false,
		layout = "dwindle",
	},

	group = {
		col = {
			border_active = "rgba(595959aa)",
			border_inactive = "rgba(2e2e35ff)",
			border_locked_active = noctalia.error,
			border_locked_inactive = "rgba(2e2e35ff)",
		},
		groupbar = {
			col = {
				active = "rgba(595959aa)",
				inactive = "rgba(2e2e35ff)",
				locked_active = noctalia.error,
				locked_inactive = "rgba(2e2e35ff)",
			},
		},
	},

	decoration = {
		rounding = 10,
		rounding_power = 2,

		active_opacity = 1.0,
		inactive_opacity = 1.0,

		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
			color = 0xee010409,
		},

		blur = {
			enabled = false,
			size = 3,
			passes = 1,
			vibrancy = 0.1696,
		},
	},

	animations = {
		enabled = true,
	},
})

-- Animation curves
hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 7, bezier = "quick" })

hl.config({
	dwindle = { preserve_split = true },
	master = { new_status = "master" },
	misc = {
		force_default_wallpaper = -1,
		disable_hyprland_logo = false,
	},
})

---------------
---- INPUT ----
---------------

hl.config({
	input = {
		kb_layout = "us",
		kb_variant = "",
		kb_model = "",
		kb_options = "compose:ralt",
		kb_rules = "",

		follow_mouse = 1,
		sensitivity = -0.8,

		touchpad = {
			natural_scroll = false,
		},
	},
})

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})

---------------------
---- KEYBINDINGS ----
---------------------

require("binds")

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- Suppress maximize events for all windows
hl.window_rule({
	match = { class = ".*" },
	suppress_event = "maximize",
})

-- XWayland fixes
hl.window_rule({
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},
	no_focus = true,
})

-- JetBrains suite fixes
hl.window_rule({
	match = { class = "^jetbrains-[^t]", float = true },
	no_initial_focus = true,
})
hl.window_rule({
	match = { class = "^jetbrains-[^t]", float = true },
	stay_focused = true,
})
hl.window_rule({
	match = { class = "^jetbrains-[^t]", title = "^win\\d+$" },
	no_focus = true,
})

hl.window_rule({

	match = { class = "bambu-studio" },

	float = true,

})

hl.window_rule({

	match = { class = "bambu-studio" },

	persistent_size = true,

})

