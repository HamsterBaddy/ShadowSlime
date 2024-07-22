spe.x = 0;
spe.y = 0;
spe.z = 0;


if(keyboard_check_pressed(vk_rshift) and canTakeAction)
{
	instance_create_depth(0,0,1000000, obj_textbox);
}


if(keyboard_check(ord("W")) and canTakeAction)
{
	spe.y += -speed_move;
}

if(keyboard_check(ord("A")) and canTakeAction)
{
	spe.x += -speed_move;
}

if(keyboard_check(ord("S")) and canTakeAction)
{
	spe.y += speed_move;
}

if(keyboard_check(ord("D")) and canTakeAction)
{
	spe.x += speed_move;
}

if(spe.x != 0 or spe.y != 0)
{
	var new_spe_x = (spe.x / sqrt(sqr(spe.x) + sqr(spe.y))) * speed_move
	var new_spe_y = (spe.y / sqrt(sqr(spe.x) + sqr(spe.y))) * speed_move
	
	spe.x = new_spe_x;
	spe.y = new_spe_y;
}

if(keyboard_check_pressed(vk_space) and canTakeAction)
{
	if(!isJumping and canJump)
	{
		isJumping = true;
		canJump = false;
		
		alarm_set(0, 20)
		
		spe.z = jumpHeight(max(0,alarm_get(0) - 1)) - jumpHeight(alarm_get(0))
	}
}

if(canTakeAction)
{
	if(!isJumping)
	{
		spe.z = global.grav;	
	}
	else
	{
		spe.z = jumpHeight(max(0,alarm_get(0) - 1)) - jumpHeight(alarm_get(0))
	}
}
else
{
	alarm_set(0, alarm_get(0) + 1)
}


var collResult = BoxCollisionWithObjects(self, spe.x, spe.y, spe.z, [Floor,Wall]);

if(collResult != pointer_null)
{
	if(collResult[4] == 0 and pos.x == collResult[0])
	{
		spe.x = 0;
		
		collResult = BoxCollisionWithObjects(self, spe.x, spe.y, spe.z, [Floor,Wall]);
		
		if(collResult != pointer_null)
		{
			if(collResult[4] == 1 and pos.y == collResult[1])
			{
				spe.y = 0;
		
				collResult = BoxCollisionWithObjects(self, spe.x, spe.y, spe.z, [Floor,Wall]);
				
				if(collResult != pointer_null)
				{
					if(collResult[4] == 2 and pos.z == collResult[2])
					{
						spe.z = 0;
		
						collResult = BoxCollisionWithObjects(self, spe.x, spe.y, spe.z, [Floor,Wall]);
					}
				}
			}
			else if(collResult[4] == 2 and pos.z == collResult[2])
			{
				if(spe.z > 0)
				{
					canJump = true;	
				}
				
				spe.z = 0;
		
				collResult = BoxCollisionWithObjects(self, spe.x, spe.y, spe.z, [Floor,Wall]);
				
				if(collResult != pointer_null)
				{
					if(collResult[4] == 1 and pos.y == collResult[1])
					{
						spe.y = 0;
		
						collResult = BoxCollisionWithObjects(self, spe.x, spe.y, spe.z, [Floor,Wall]);
					}
				}
			}
		}
	}
	else if(collResult[4] == 1 and pos.y == collResult[1])
	{
		spe.y = 0;
		
		collResult = BoxCollisionWithObjects(self, spe.x, spe.y, spe.z, [Floor,Wall]);
		
		if(collResult != pointer_null)
		{
			if(collResult[4] == 0 and pos.x == collResult[0])
			{
				spe.x = 0;
		
				collResult = BoxCollisionWithObjects(self, spe.x, spe.y, spe.z, [Floor,Wall]);
				
				if(collResult != pointer_null)
				{
					if(collResult[4] == 2 and pos.z == collResult[2])
					{
						spe.z = 0;
		
						collResult = BoxCollisionWithObjects(self, spe.x, spe.y, spe.z, [Floor,Wall]);
					}
				}
			}
			else if(collResult[4] == 2 and pos.z == collResult[2])
			{
				if(spe.z > 0)
				{
					canJump = true;	
				}
				
				spe.z = 0;
		
				collResult = BoxCollisionWithObjects(self, spe.x, spe.y, spe.z, [Floor,Wall]);
				
				if(collResult != pointer_null)
				{
					if(collResult[4] == 0 and pos.x == collResult[0])
					{
						spe.x = 0;
		
						collResult = BoxCollisionWithObjects(self, spe.x, spe.y, spe.z, [Floor,Wall]);
					}
				}
			}
		}
	}
	else if(collResult[4] == 2 and pos.z == collResult[2])
	{
		if(spe.z > 0)
		{
			canJump = true;	
		}
				
		spe.z = 0;
		
		collResult = BoxCollisionWithObjects(self, spe.x, spe.y, spe.z, [Floor,Wall]);
		
		if(collResult != pointer_null)
		{
			if(collResult[4] == 0 and pos.x == collResult[0])
			{
				spe.x = 0;
		
				collResult = BoxCollisionWithObjects(self, spe.x, spe.y, spe.z, [Floor,Wall]);
				
				if(collResult != pointer_null)
				{
					if(collResult[4] == 1 and pos.y == collResult[1])
					{
						spe.y = 0;
		
						collResult = BoxCollisionWithObjects(self, spe.x, spe.y, spe.z, [Floor,Wall]);
					}
				}
			}
			else if(collResult[4] == 1 and pos.y == collResult[1])
			{
				spe.y = 0;
		
				collResult = BoxCollisionWithObjects(self, spe.x, spe.y, spe.z, [Floor,Wall]);
				
				if(collResult != pointer_null)
				{
					if(collResult[4] == 0 and pos.x == collResult[0])
					{
						spe.x = 0;
		
						collResult = BoxCollisionWithObjects(self, spe.x, spe.y, spe.z, [Floor,Wall]);
					}
				}
			}
		}
	}
	
	if(collResult != pointer_null)
	{
		show_debug_message("Wall: {0}", collResult)
		show_debug_message("Player_SPE WALL: {0}, {1}, {2}",spe.x, spe.y, spe.z)
		pos.x = collResult[0];
		pos.y = collResult[1];
		pos.z = collResult[2];
		
		if(collResult[4] == 2)
		{
			isJumping = false;
			alarm_set(0, -1)
			
			if(spe.z > 0)
			{
				canJump = true;	
			}
		}
	
		spe.x = 0;
		spe.y = 0;
		spe.z = 0;
	}
}