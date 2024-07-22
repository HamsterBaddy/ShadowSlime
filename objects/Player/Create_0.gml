event_inherited();

depth = -1000

speed_move = 3.5;

isJumping = false;
canJump = true;

canTakeAction = true;

dim.x = sprite_width;
dim.y = 3;
dim.z = sprite_height;

pos.x = x;
pos.z = 0;
pos.y = (y + sprite_height - dim.y) - pos.z;


origin_x = pos.x;
origin_y = pos.y;
origin_z = pos.z;

global.death_z = 128;

global.player = self;


pos.orientation = ORIENTATIONS.UPRIGHT;
pos.moveability = MOVEABILITIES.DYNAMIC;




function jumpHeight(t)
{
	return sqr(t / 2.582) - 60;	
}