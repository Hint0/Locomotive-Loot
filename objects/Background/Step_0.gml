/// @description Insert description here
// You can write your code in this editor



// Inherit the parent event
event_inherited();

function generate_layer_instance(_x, _y){
	return instance_create_layer(_x, _y, "Back", BallModified);
}
