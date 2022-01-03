return function(s)
	local awful = require 'awful'
	local gears = require 'gears'
	local wibox = require 'wibox'


	return awful.widget.taglist {
		screen = s,
		filter = awful.widget.taglist.filter.all,
		buttons = {
			awful.button(
				{},
				1,
				function(t)
					

					t:view_only()
				end
			),
			awful.button(
				{modkey},
				1,
				function(t)
					if client.focus then
						client.focus:move_to_tag(t)
					end
				end
			),
			awful.button({}, 3, awful.tag.viewtoggle),
			awful.button(
				{modkey},
				3,
				function(t)
					if client.focus then
						client.focus:toggle_tag(t)
					end
				end
			),
			awful.button(
				{},
				4,
				function(t)
					awful.tag.viewnext(t.screen)
				end
			),
			awful.button(
				{},
				5,
				function(t)
					awful.tag.viewprev(t.screen)
				end
			)
		},
		layout = {
			spacing = 4,
			layout = wibox.layout.fixed.horizontal
		}
	}
end