/// @param _text_id
function scr_game_text(_text_id)
{
	switch(_text_id)
	{
		case "test1":
			scr_text("HIIII HIIII HIIII HIIII HIIII HIIII HIIII HIIII HIIII HIIII HIIII HIIII HIIII HIIII HIIII HIIII HIIII HIIII HIIII HIIII ", "Shadow Slime")
				scr_text_color(6, 11, c_purple, c_purple, c_purple, c_purple);
			scr_text("HIIII", "Shadow Slime", -1)
				scr_text_shake(0, 4);
				scr_option("Yello", "test1 - Yello");
				scr_option("...", "test1 - ...");
			break;
			
		case "test1 - Yello":
			scr_text("BYE!")
			break;
			
		case "test1 - ...":
			scr_text("...")
			break;
			
		default:
			scr_text("Congratulations, you found a bug!")
			break;
	}
}