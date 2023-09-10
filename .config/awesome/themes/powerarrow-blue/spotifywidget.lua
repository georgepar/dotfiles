
-- SPOTIFY START

local GET_SPOTIFY_STATUS_CMD = "spt pb --status"
local GET_CURRENT_SONG_CMD = "spt pb -f '%s | %b | %a | %t' --status"

local function ellipsize(text, length)
	return (utf8.len(text) > length and length > 0) and text:sub(0, utf8.offset(text, length - 2) - 1) .. "..." or text
end

local spotify_widget = {}

local function split_string(inputstr, sep)
	if sep == nil then
		sep = "%s"
	end
	local t = {}
	for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
		table.insert(t, str)
	end
	return t
end

local function trim_string(s)
	if s ~= nil then
		return s:gsub("^%s*(.-)%s*$", "%1")
	else
		return nil
	end
end

local function parse_status(stdout)
	local tab = split_string(stdout, "|")
	local playing = trim_string(tab[1])
	local album = trim_string(tab[2])
	local artist = trim_string(tab[3])
	local song = trim_string(tab[4])
	return playing, album, artist, song
end

local function make_spotify_widget(user_args)
	local args = user_args or {}

	local spotify_icon = args.spotify_icon or "/usr/share/icons/Numix/16/status/spotify-indicator.svg"
	local font = args.font or "Source Code Pro 10"
	local dim_when_paused = true
	local dim_opacity = args.dim_opacity or 0.7
	local max_length = args.max_length or 15
	local show_tooltip = args.show_tooltip == nil and true or args.show_tooltip
	local timeout = args.timeout or 1

	local cur_artist = ""
	local cur_title = ""
	local cur_album = ""

	spotify_widget = wibox.widget({
		{
			id = "icon",
			widget = wibox.widget.imagebox,
			resize = true,
			forced_height = 24,
			forced_width = 24,
		},
		{
			layout = wibox.container.scroll.horizontal,
			max_size = 100,
			step_function = wibox.container.scroll.step_functions.waiting_nonlinear_back_and_forth,
			speed = 40,
			{
				id = "titlew",
				font = font,
				widget = wibox.widget.textbox,
			},
		},
		{
			id = "playingw",
			font = font,
			widget = wibox.widget.imagebox,
		},
		layout = wibox.layout.align.horizontal,
		set_status = function(self, is_playing)
			if is_playing then
				self.playingw.image = theme.widget_music_pause
			else
				self.playingw.image = theme.widget_music_on
			end
			if dim_when_paused then
				self:get_children_by_id("icon")[1]:set_opacity(is_playing and 1 or dim_opacity)

				self:get_children_by_id("titlew")[1]:set_opacity(is_playing and 1 or dim_opacity)
				self:get_children_by_id("titlew")[1]:emit_signal("widget::redraw_needed")
			end
		end,
		set_text = function(self, song)
			local title_to_display = ellipsize(song, max_length) .. "  "
			if self:get_children_by_id("titlew")[1]:get_markup() ~= title_to_display then
				self:get_children_by_id("titlew")[1]:set_markup(title_to_display)
			end
		end,
	})

	local update_widget_icon = function(widget, stdout, _, _, _)
		stdout = string.gsub(stdout, "\n", "")
		widget:set_status(string.find(stdout, "▶") and true or false)
	end

	local update_widget_text = function(widget, stdout, _, _, _)
		if string.find(stdout, "Error: Spotify is not running.") ~= nil then
			widget:set_text("")
			widget:set_visible(false)
			return
		end

		local escaped = string.gsub(stdout, "&", "&amp;")

		local album, artist, title = nil, nil, nil, nil
		if escaped ~= nil then
			_, album, artist, title = parse_status(escaped)
		end
		if album ~= nil and title ~= nil and artist ~= nil then
			widget.icon.image = spotify_icon
			cur_artist = artist
			cur_title = title
			cur_album = album
			widget:set_text(title)
			widget:set_visible(true)
		end
	end

	watch(GET_SPOTIFY_STATUS_CMD, timeout, update_widget_icon, spotify_widget)
	watch(GET_CURRENT_SONG_CMD, timeout, update_widget_text, spotify_widget)

	--- Adds mouse controls to the widget:
	--  - left click - play/pause
	--  - scroll up - play next song
	--  - scroll down - play previous song
	spotify_widget:connect_signal("button::press", function(_, _, _, button)
		if button == 1 then
			awful.spawn("spt pb --toggle", false) -- left click
		elseif button == 4 then
			awful.spawn("spt pb --next", false) -- scroll up
		elseif button == 5 then
			awful.spawn("spt pb --previous", false) -- scroll down
		end
		awful.spawn.easy_async(GET_SPOTIFY_STATUS_CMD, function(stdout, stderr, exitreason, exitcode)
			update_widget_icon(spotify_widget, stdout, stderr, exitreason, exitcode)
		end)
	end)

	if show_tooltip then
		local spotify_tooltip = awful.tooltip({
			mode = "outside",
			preferred_positions = { "bottom" },
		})

		spotify_tooltip:add_to_object(spotify_widget)

		spotify_widget:connect_signal("mouse::enter", function()
			spotify_tooltip.markup = "<b>Album</b>: "
				.. cur_album
				.. "\n<b>Artist</b>: "
				.. cur_artist
				.. "\n<b>Song</b>: "
				.. cur_title
		end)
	end

	return spotify_widget
end

-- SPOTIFY END


