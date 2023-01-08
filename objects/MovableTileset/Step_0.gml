/// @description Insert description here
// You can write your code in this editor
function wrap_to_room(obj){
	obj.x = modulo(obj.x, aligned_room_width);
	obj.y = modulo(obj.y, aligned_room_height);
}

function generate_layer_instance(_x, _y){
}

function move_tile(i, j, velocity){
	var _tile = tiles[# i, j];
	
	var _old_x = _tile.x;
	var _old_y = _tile.y;
	
	_tile.x += velocity.x;
	_tile.y += velocity.y;

	wrap_to_room(_tile);

	if((velocity.x > 0 and _tile.x < _old_x) or
		(velocity.x < 0 and _tile.x > _old_x) or
		(velocity.y > 0 and _tile.y < _old_y) or
		(velocity.y < 0 and _tile.y > _old_y)){
			instance_destroy(_tile);
			tiles[# i, j] = generate_layer_instance(i*tile_width+position.x, j*tile_height+position.y);
			wrap_to_room(tiles[# i, j]);
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