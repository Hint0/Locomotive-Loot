/// @description Insert description here
// You can write your code in this editor

position=new vector(0,0);

tile_height=undefined;
tile_width=undefined;
n_horizontal_tiles=undefined;
n_vertical_tiles=undefined;
aligned_room_width=undefined;
aligned_room_height=undefined;

tiles=undefined;

function tiles_init(_layer, _object){
	
	n_horizontal_tiles=floor(room_width/tile_width);
	n_vertical_tiles=floor(room_height/tile_height);
	aligned_room_width=n_horizontal_tiles * tile_width;
	aligned_room_height=n_vertical_tiles * tile_height;
	
	tiles=ds_grid_create(n_horizontal_tiles, n_vertical_tiles);
	ds_grid_clear(tiles, 0);

	for(var i = 0 ; i < n_horizontal_tiles ; i++){
		for(var j = 0 ; j < n_vertical_tiles ; j++){
			if(tiles[# i, j] == 0){
					tiles[# i, j] = instance_create_layer(i*tile_width, j*tile_height, _layer, _object);
			}
		}
	}
}