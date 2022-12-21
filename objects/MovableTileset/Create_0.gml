/// @description Insert description here
// You can write your code in this editor

position=new vector(0,0);

tile_height=64;
tile_width=64;

n_horizontal_tiles=floor(room_width/tile_width);
n_vertical_tiles=floor(room_height/tile_height);

aligned_room_width=n_horizontal_tiles * tile_width;
aligned_room_height=n_vertical_tiles * tile_height;

tiles=array_create(n_horizontal_tiles, 0);
for(var i = 0; i < n_horizontal_tiles ; i++){
	tiles[i]=array_create(n_vertical_tiles, 0);
}

function tiles_init(){
	for(var i = 0 ; i < n_horizontal_tiles ; i++){
		for(var j = 0 ; j < n_vertical_tiles ; j++){
			if(tiles[i][j] == 0){
					tiles[i][j] = instance_create_layer(i*tile_width, j*tile_height, "Instances", Ball);
			}
		}
	}
}

tiles_init();