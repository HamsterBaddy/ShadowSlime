enum ORIENTATIONS
{
	FLAT,
	UPRIGHT
}

enum MOVEABILITIES
{
	DYNAMIC,
	KINEMATIC,
	STATIC
}


global.grav = 3.5;


pos =
{
	x: 0,
	y: 0,
	z: 0,
	
	orientation: ORIENTATIONS.UPRIGHT,
	moveability: MOVEABILITIES.KINEMATIC,
	
	update: function()
			{
				return;
			},
	set: function(_x,_y,_z)
			{
				return;
			}
};

spe =
{
	x: 0,
	y: 0,
	z: 0
};

dim =
{
	x: 0,
	y: 0,
	z: 0
};



pos.update = function()
			{
				if(pos.orientation == ORIENTATIONS.FLAT)
				{
					if(pos.moveability == MOVEABILITIES.DYNAMIC)
					{
						pos.x = pos.x + spe.x;
						pos.y = pos.y + spe.y;
						pos.z = pos.z + spe.z;
					}
						
					self.x = pos.x;
					self.y = pos.y + (pos.z - dim.z);
				}
				else if(pos.orientation == ORIENTATIONS.UPRIGHT)
				{
					if(pos.moveability == MOVEABILITIES.DYNAMIC)
					{
						pos.x = pos.x + spe.x;
						pos.y = pos.y + spe.y;
						pos.z = pos.z + spe.z;
					}

					self.x = pos.x
					self.y = (pos.y - self.sprite_height + dim.y) + pos.z;
				}
				
				
				
				return;
			}
			
			
pos.set = function(_x,_y,_z)
			{
				if(pos.orientation == ORIENTATIONS.FLAT)
				{
					if(pos.moveability == MOVEABILITIES.DYNAMIC or pos.moveability == MOVEABILITIES.KINEMATIC)
					{
						pos.x = _x;
						pos.y = _y;
						pos.z = _z;
				
						self.x = _x;
						self.y = _y + (_z - dim.z);
					}
				}
				else if(pos.orientation == ORIENTATIONS.UPRIGHT)
				{
					if(pos.moveability == MOVEABILITIES.DYNAMIC or pos.moveability == MOVEABILITIES.KINEMATIC)
					{
						pos.x = _x;
						pos.y = _y;
						pos.z = _z;
				
						self.x = _x;
						self.y = (_y - self.sprite_height + dim.y) + _z;
					}
				}
				
				
				return;
			}