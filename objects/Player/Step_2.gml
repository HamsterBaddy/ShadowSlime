event_inherited();


if(pos.z >= global.death_z)
{
	pos.set(origin_x, origin_y, origin_z)	
}



show_debug_message("Player_POS: {0}, {1}, {2}",pos.x, pos.y, pos.z)
show_debug_message("Player_SPE: {0}, {1}, {2}",spe.x, spe.y, spe.z)

var halfViewWidth = camera_get_view_width(view_camera[0]) / 2;
var halfViewHeight = camera_get_view_height(view_camera[0]) / 2;


camera_set_view_pos(view_camera[0], x - halfViewWidth + sprite_width / 2, y - halfViewHeight);