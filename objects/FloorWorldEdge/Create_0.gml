
event_inherited();

thickness += 32768;
_z -= 16384; 

dim.x = sprite_width;
dim.y = sprite_height;
dim.z = thickness;

pos.x = x;
pos.z = (_z + dim.z);
pos.y = y;


pos.orientation = ORIENTATIONS.FLAT;
pos.moveability = MOVEABILITIES.STATIC;