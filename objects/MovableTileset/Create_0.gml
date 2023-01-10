// Number of pixels before layer is aligned back to 0
// with its tiles updated.
#macro CHUNK_SIZE 512

position = new vector(0,0);

// Theoritical layer position if layer
// was never aligned back to 0.
absolute_position = new vector(0,0);

tile_map_id = layer_tilemap_get_id(layer_get_id("Tiles_1"));
tile_map_width = tilemap_get_width(tile_map_id);
tile_map_height = tilemap_get_height(tile_map_id);
tile_width = tilemap_get_tile_width(tile_map_id);
tile_height = tilemap_get_tile_height(tile_map_id);

show_debug_message("Tile map width: "+string(tile_map_width));