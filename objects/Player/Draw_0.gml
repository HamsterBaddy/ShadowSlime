var raycast_result = BoxCollisionWithObjects(self, 0, 0, 1, [Floor], true);

if(raycast_result != pointer_null)
{
	draw_sprite_ext(Sprite8, 0, x, raycast_result[1] + raycast_result[2] ,1,1,0,c_white,0.6);
}
else
{
	//draw_sprite_ext(Sprite8, 0, x, y + sprite_height - 3,1,1,0,c_white,0.6);
}


draw_self();


//draw_line_width_color(pos.x - 0.5, (pos.y - self.sprite_height) + pos.z - 1, pos.x - 0.5, (pos.y - self.sprite_height) + pos.z + dim.z - 1, 1, c_red,c_red)
//draw_line_width_color(pos.x + dim.x - 1.5, (pos.y - self.sprite_height) + pos.z - 1, pos.x + dim.x - 1.5, (pos.y - self.sprite_height) + pos.z + dim.z - 1, 1, c_red,c_red)


//draw_line_width_color(pos.x - 0.5, (pos.y - self.sprite_height + dim.y) + pos.z - 1, pos.x - 0.5, (pos.y - self.sprite_height + dim.y) + pos.z + dim.z - 1, 1, c_maroon,c_maroon)
//draw_line_width_color(pos.x + dim.x - 1.5, (pos.y - self.sprite_height + dim.y) + pos.z - 1, pos.x + dim.x - 1.5, (pos.y - self.sprite_height + dim.y) + pos.z + dim.z - 1, 1, c_maroon,c_maroon)


//draw_line_width_color(pos.x - 1, pos.y + pos.z - 0.5, pos.x + dim.x - 1, pos.y + pos.z - 0.5, 1, c_red, c_red)
//draw_line_width_color(pos.x - 1, pos.y + dim.y + pos.z - 1.5, pos.x + dim.x - 1, pos.y + dim.y + pos.z - 1.5, 1, c_maroon, c_maroon)