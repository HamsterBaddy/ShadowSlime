// Inherit the parent event
event_inherited();

depth = -10

dim.x = sprite_width;
dim.y = thickness;
dim.z = sprite_height;

pos.x = x;
pos.z = 0;
pos.y = (y + sprite_height - dim.y) - pos.z;


pos.orientation = ORIENTATIONS.UPRIGHT;
pos.moveability = MOVEABILITIES.STATIC;