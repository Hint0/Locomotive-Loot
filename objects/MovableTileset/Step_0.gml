/// @description Insert description here
// You can write your code in this editor

function modulo(a, b){
	gml_pragma("forceinline");
	if(a < 0){
		return b-(-a%b);
	}else{
		return a%b;
	}
}

function wrap_to_room(obj){
	obj.x = modulo(obj.x, aligned_room_width);
	obj.y = modulo(obj.y, aligned_room_height);
}

function move_tile(i, j, velocity){
	var old_x = tiles[i][j].x;
	var old_y = tiles[i][j].y;
	
	tiles[i][j].x += velocity.x;
	tiles[i][j].y += velocity.y;

	wrap_to_room(tiles[i][j]);

	if((velocity.x > 0 and tiles[i][j].x < old_x) or
		(velocity.x < 0 and tiles[i][j].x > old_x) or
		(velocity.y > 0 and tiles[i][j].y < old_y) or
		(velocity.y < 0 and tiles[i][j].y > old_y)){
			instance_destroy(tiles[i][j]);
			tiles[i][j] = instance_create_layer(i*tile_width+position.x, j*tile_height+position.y, "Instances", BallModified);
			wrap_to_room(tiles[i][j]);
	}
}

function move(velocity){	
	position.add(velocity);
	
	for(var i = 0 ; i < n_horizontal_tiles ; i++){
		for(var j = 0 ; j < n_vertical_tiles ; j++){
			move_tile(i, j, velocity);
		}
	}
}

/*
function tile_is_in_view(h_idx, v_idx){
	var x_left = h_idx * tile_width;
	var x_right = x_left + tile_width;	
	var y_top = v_idx * tile_height;
	var y_bottom = y_top + tile_height;
	var view_left=camera_get_view_x(view_camera[0]);
	var view_right=view_left + camera_get_view_width(view_camera[0]);
	var view_top=camera_get_view_y(view_camera[0]);
	var view_bottom=view_top + camera_get_view_height(view_camera[0]);
	
	if (x_right > view_left and x_left < view_right and
	y_top < view_bottom and y_bottom > view_top){
		return true;
	}
	
	return false;
}
*/