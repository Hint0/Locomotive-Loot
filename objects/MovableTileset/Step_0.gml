function update_tiles(){
	var _x_vec = 0;
	var _y_vec = 0;
	var _x_vec_norm = 0;
	var _y_vec_norm = 0;
	var _tile_x = 0;
	var _tile_y = 0;
	var _tile;
	
	if(abs(position.x) > CHUNK_SIZE){
		_x_vec = position.x div tile_width;
	}
	
	if(abs(position.y) > CHUNK_SIZE){
		_y_vec = position.y div tile_height;	
	}
	
	show_debug_message("X vec: "+string(_x_vec)+", Y vec: "+string(_y_vec));
	_x_vec_norm = abs(_x_vec);
	_y_vec_norm = abs(_y_vec);
	
	// If layer went to the top, then tiles shall be moved also to the top
	// when setting back layer to (0,0).
	if(_y_vec < 0){
		for(_tile_x = 0 ; _tile_x < tile_map_width ; _tile_x++){
			for(_tile_y = 0 ; _tile_y < tile_map_height - _y_vec_norm ; _tile_y++){
				_tile = tilemap_get(tile_map_id, _tile_x, _tile_y + _y_vec_norm);
				tilemap_set(tile_map_id, _tile, _tile_x, _tile_y);
			}
		}
	}else if(_y_vec > 0){
		for(_tile_x = 0 ; _tile_x < tile_map_width ; _tile_x++){
			for(_tile_y = tile_map_height ; _tile_y >= _y_vec_norm ; _tile_y--){
				_tile = tilemap_get(tile_map_id, _tile_x, _tile_y - _y_vec_norm);
				tilemap_set(tile_map_id, _tile, _tile_x, _tile_y);
			}
		}			
	}
	
	if(_x_vec < 0){
		for(_tile_x = 0 ; _tile_x < tile_map_width - _x_vec_norm ; _tile_x++){
			for(_tile_y = 0 ; _tile_y < tile_map_height ; _tile_y++){
				_tile = tilemap_get(tile_map_id, _tile_x + _x_vec_norm, _tile_y);
				tilemap_set(tile_map_id, _tile, _tile_x, _tile_y);
			}
		}
	}else if(_x_vec > 0){
		for(_tile_x = tile_map_width ; _tile_x >= _x_vec_norm ; _tile_x--){
			for(_tile_y = 0 ; _tile_y < tile_map_height ; _tile_y++){
				_tile = tilemap_get(tile_map_id, _tile_x - _x_vec_norm, _tile_y + _y_vec_norm);
				tilemap_set(tile_map_id, _tile, _tile_x, _tile_y);
			}
		}	
	}
	
	for(; _tile_x < tile_map_width ; _tile_x++){
		for(_tile_y = 0 ; _tile_y < tile_map_height ; _tile_y++){
		//TODO: Generate new tiles 	
		}
	}
}

function update_position(){
		show_debug_message("X vec: "+string(position.x)+", Y vec: "+string(position.y));
		position.x %= CHUNK_SIZE;
		position.y %= CHUNK_SIZE;
		show_debug_message("X vec: "+string(position.x)+", Y vec: "+string(position.y));
}

function print_tile_under_mouse(){
	var _x = tilemap_get_cell_x_at_pixel(tile_map_id, mouse_x, mouse_y);
	var _y = tilemap_get_cell_y_at_pixel(tile_map_id, mouse_x, mouse_y);
	show_debug_message("(X: "+string(_x)+", Y: "+string(_y)+")");
}

function move(velocity){
	position.add(velocity);
	absolute_position.add(velocity);
	
	show_debug_message(position);
	if(abs(position.x) > CHUNK_SIZE or abs(position.y) > CHUNK_SIZE){
		update_tiles();
		update_position();
	}
	
	print_tile_under_mouse();
	tilemap_x(tile_map_id, position.x);
	tilemap_y(tile_map_id, position.y);
	
}