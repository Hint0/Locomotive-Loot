/// @description Insert description here
// You can write your code in this editor

//map a value from one range to another
function map_value(_value, _current_lower_bound, _current_upper_bound, _desired_lowered_bound, _desired_upper_bound) {
	return (((_value - _current_lower_bound) / (_current_upper_bound - _current_lower_bound)) * (_desired_upper_bound - _desired_lowered_bound)) + _desired_lowered_bound;
}

if (not_drawn) {
	if (surface_exists(perlin_noise_surface)) {
		surface_set_target(perlin_noise_surface);
		
		var width=32;
		var height=32;
		
		for (var col = 0; col < room_width/width; col += 1) {
			for (var row = 0; row < room_height/height; row += 1) {
			
				_noise = perlin_noise(col, row);
				var _col_val = map_value(_noise, -1, 1, 0, 255);
				
				draw_set_color(make_color_rgb(_col_val, _col_val, _col_val));
				draw_rectangle(col*height, row*width, col*height + height, row*width + width, false);
			}
		}

		surface_reset_target();
	}

	not_drawn = false;
}

draw_surface(perlin_noise_surface, 0, 0);

