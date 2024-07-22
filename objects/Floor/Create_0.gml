
event_inherited();


dim.x = sprite_width;
dim.y = sprite_height;
dim.z = thickness;

pos.x = x;
pos.z = (_z + dim.z);
pos.y = y - (pos.z - dim.z);


pos.orientation = ORIENTATIONS.FLAT;
pos.moveability = MOVEABILITIES.STATIC;