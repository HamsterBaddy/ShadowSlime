var accept_key = keyboard_check_pressed(vk_space);



var textbox_x = camera_get_view_x(view_camera[0]);
var textbox_y = camera_get_view_y(view_camera[0]) + 256 - 60 - 18;




if(setup == false)
{
	setup = true;
	
	draw_set_font(global.font_main);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	
	
	page_number = array_length(text);
	
	for(var p = 0; p < page_number; p++)
	{
		text_length[p] = string_length(text[p]);
		
		array_insert(text_x_offset, p, 32);
		
		show_debug_message(text_x_offset)
	}
}



if (draw_char < text_length[page])
{
	draw_char += text_spd;
	draw_char = clamp(draw_char, 0, text_length[page]);
}


if (accept_key)
{
	if(draw_char == text_length[page])
	{
		if (page < page_number - 1)
		{
			page++;
			draw_char = 0;
		}
		else
		{
			global.player.canTakeAction = true;
			instance_destroy();	
		}
	}
	else
	{
		draw_char = text_length[page];	
	}
}



txtb_img += txtb_img_spd;
var txtb_spr_w = sprite_get_width(txtb_spr);
var txtb_spr_h = sprite_get_width(txtb_spr);

draw_sprite_ext(txtb_spr, txtb_img, textbox_x + text_x_offset[page], textbox_y, textbox_width/txtb_spr_w, textbox_height/txtb_spr_h, 0, c_white, 1);



var _drawtext = string_copy(text[page], 1, draw_char);
draw_text_ext(textbox_x + text_x_offset[page] + margin, textbox_y + margin, _drawtext, line_sep, line_width);

