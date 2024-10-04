global.player.canTakeAction = false;



depth = -100000




textbox_width = 256 - 8*9;
textbox_height = 8*2 + 12*4 - 4;
margin = 8;
line_sep = 12;
line_width = textbox_width - margin * 2;


txtb_spr[0] = spr_menu;
txtb_img = 0;
txtb_img_spd = 0/60;


page_number = 0;

page = 0;
text[0] = "";
text_length[0] = string_length(text[0]);
char[0, 0] = "";
char_x[0, 0] = 0;
char_y[0, 0] = 0;
draw_char = 0;
text_spd = 1;


setup = false;






text_x_offset[0] = 32;
portait_x_offset[0] = 8;






option[0] = "";
option_link_id[0] = -1;
option_pos = 0;
option_number = 0;


snd_delay = 4;
snd_count = snd_delay;

scr_set_defaults_for_text();
last_free_space = 0;
text_pause_timer = 0;
text_pause_time = 16;