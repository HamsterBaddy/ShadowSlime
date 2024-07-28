event_inherited();


if(pos.z >= global.death_z)
{
	pos.set(origin_x, origin_y, origin_z)	
}



var halfViewWidth = camera_get_view_width(view_camera[0]) / 2;
var halfViewHeight = camera_get_view_height(view_camera[0]) / 2;


camera_set_view_pos(view_camera[0], x - halfViewWidth + sprite_width / 2, y - halfViewHeight);