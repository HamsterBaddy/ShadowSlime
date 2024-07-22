function BoxCollision(boxI_pos_sub_one, boxI_pos_main, boxI_pos_sub_two, boxI_speed_sub_one, boxI_speed_main, boxI_speed_sub_two, boxI_dim_sub_one, boxI_dim_main, boxI_dim_sub_two, boxII_pos_sub_one, boxII_pos_main, boxII_pos_sub_two, boxII_dim_sub_one, boxII_dim_main, boxII_dim_sub_two)
{
	var boxI_collPos_min_main = boxI_pos_main; 
	var boxI_collPos_max_main = boxI_pos_main + boxI_dim_main; 
	var boxII_collPos_min_main = boxII_pos_main;
	var boxII_collPos_max_main = boxII_pos_main + boxII_dim_main;
	
	var boxI_collSqu_min_one = boxI_pos_sub_one;                     
	var boxI_collSqu_max_one = boxI_pos_sub_one + boxI_dim_sub_one; 
	var boxI_collSqu_min_two = boxI_pos_sub_two - boxI_dim_sub_two;                    
	var boxI_collSqu_max_two = boxI_pos_sub_two;   
	
	var boxII_collSqu_min_one = boxII_pos_sub_one;                    
	var boxII_collSqu_max_one = boxII_pos_sub_one + boxII_dim_sub_one;
	var boxII_collSqu_min_two = boxII_pos_sub_two - boxII_dim_sub_two;                    
	var boxII_collSqu_max_two = boxII_pos_sub_two;
	
	var lineVar_sub_one = pointer_null; 
	var distance_sub_one = 0;
	
	var lineVar_main = pointer_null; 
	var distance_main = 0;
	
	var lineVar_sub_two = pointer_null; 
	var distance_sub_two = 0;
	
	if(boxI_speed_sub_one > 0)
	{
		lineVar_sub_one = (boxII_collSqu_min_one - boxI_collSqu_max_one) / boxI_speed_sub_one;  
		
		var scnittPoint_sub_one = boxI_collSqu_max_one + lineVar_sub_one * boxI_speed_sub_one;
		var scnittPoint_main = boxI_collPos_max_main + lineVar_sub_one * boxI_speed_main;      
		var scnittPoint_sub_two = boxI_collSqu_max_two + lineVar_sub_one * boxI_speed_sub_two;  
		
		var temp_distance_sub_one = scnittPoint_sub_one - boxI_collSqu_max_one;   //maybe change to just   lineVar_sub_one * boxI_speed_sub_one;
		var temp_distance_main = scnittPoint_main - boxI_collPos_max_main;
		var temp_distance_sub_two = scnittPoint_sub_two - boxI_collSqu_max_two;
		
		
		if(lineVar_sub_one >= 0 and lineVar_sub_one < 1)
		{
			if(boxI_collPos_min_main + temp_distance_main < boxII_collPos_max_main and boxI_collPos_max_main + temp_distance_main > boxII_collPos_min_main and
				boxI_collSqu_min_two + temp_distance_sub_two < boxII_collSqu_max_two and boxI_collSqu_max_two + temp_distance_sub_two > boxII_collSqu_min_two)
			{
				distance_sub_one = sqrt(sqr(temp_distance_sub_one) + sqr(temp_distance_main) + sqr(temp_distance_sub_two));
			}
			else
				lineVar_sub_one = pointer_null; 
		}
		else
			lineVar_sub_one = pointer_null; 
	}
	else if(boxI_speed_sub_one < 0)
	{
		lineVar_sub_one = (boxII_collSqu_max_one - boxI_collSqu_min_one) / boxI_speed_sub_one;  
		
		var scnittPoint_sub_one = boxI_collSqu_min_one + lineVar_sub_one * boxI_speed_sub_one;      
		var scnittPoint_main = boxI_collPos_min_main + lineVar_sub_one * boxI_speed_main;      
		var scnittPoint_sub_two = boxI_collSqu_min_two + lineVar_sub_one * boxI_speed_sub_two;         
	
		var temp_distance_sub_one = scnittPoint_sub_one - boxI_collSqu_min_one;
		var temp_distance_main = scnittPoint_main - boxI_collPos_min_main;
		var temp_distance_sub_two = scnittPoint_sub_two - boxI_collSqu_min_two;
		
		
		if(lineVar_sub_one >= 0 and lineVar_sub_one < 1)
		{
			if(boxI_collPos_min_main + temp_distance_main < boxII_collPos_max_main and boxI_collPos_max_main + temp_distance_main > boxII_collPos_min_main and
				boxI_collSqu_min_two + temp_distance_sub_two < boxII_collSqu_max_two and boxI_collSqu_max_two + temp_distance_sub_two > boxII_collSqu_min_two)
			{
				distance_sub_one = sqrt(sqr(temp_distance_sub_one) + sqr(temp_distance_main) + sqr(temp_distance_sub_two));
			}
			else
				lineVar_sub_one = pointer_null; 
		}
		else
			lineVar_sub_one = pointer_null; 
	}
	
	if(boxI_speed_main > 0)
	{
		lineVar_main = (boxII_collPos_min_main - boxI_collPos_max_main) / boxI_speed_main;  
		
		var scnittPoint_sub_one = boxI_collSqu_max_one + lineVar_main * boxI_speed_sub_one;
		var scnittPoint_main = boxI_collPos_max_main + lineVar_main * boxI_speed_main;      
		var scnittPoint_sub_two = boxI_collSqu_max_two + lineVar_main * boxI_speed_sub_two;  
		
		var temp_distance_sub_one = scnittPoint_sub_one - boxI_collSqu_max_one;
		var temp_distance_main = scnittPoint_main - boxI_collPos_max_main;
		var temp_distance_sub_two = scnittPoint_sub_two - boxI_collSqu_max_two;
		
		
		if(lineVar_main >= 0 and lineVar_main < 1)
		{
			if(boxI_collSqu_min_one + temp_distance_sub_one < boxII_collSqu_max_one and boxI_collSqu_max_one + temp_distance_sub_one > boxII_collSqu_min_one and
				boxI_collSqu_min_two + temp_distance_sub_two < boxII_collSqu_max_two and boxI_collSqu_max_two + temp_distance_sub_two > boxII_collSqu_min_two)
			{
				distance_main = sqrt(sqr(temp_distance_sub_one) + sqr(temp_distance_main) + sqr(temp_distance_sub_two));
			}
			else
				lineVar_main = pointer_null; 
		}
		else
			lineVar_main = pointer_null; 
	}
	else if(boxI_speed_main < 0)
	{
		lineVar_main = (boxII_collPos_max_main - boxI_collPos_min_main) / boxI_speed_main;  
		
		var scnittPoint_sub_one = boxI_collSqu_min_one + lineVar_main * boxI_speed_sub_one;      
		var scnittPoint_main = boxI_collPos_min_main + lineVar_main * boxI_speed_main;      
		var scnittPoint_sub_two = boxI_collSqu_min_two + lineVar_main * boxI_speed_sub_two;         
	
		var temp_distance_sub_one = scnittPoint_sub_one - boxI_collSqu_min_one;
		var temp_distance_main = scnittPoint_main - boxI_collPos_min_main;
		var temp_distance_sub_two = scnittPoint_sub_two - boxI_collSqu_min_two;
		
		if(lineVar_main >= 0 and lineVar_main < 1)
		{
			if(boxI_collSqu_min_one + temp_distance_sub_one < boxII_collSqu_max_one and boxI_collSqu_max_one + temp_distance_sub_one > boxII_collSqu_min_one and
				boxI_collSqu_min_two + temp_distance_sub_two < boxII_collSqu_max_two and boxI_collSqu_max_two + temp_distance_sub_two > boxII_collSqu_min_two)
			{
				distance_main = sqrt(sqr(temp_distance_sub_one) + sqr(temp_distance_main) + sqr(temp_distance_sub_two));
			}
			else
				lineVar_main = pointer_null; 
		}
		else
			lineVar_main = pointer_null; 
	}
	
	if(boxI_speed_sub_two > 0)
	{
		lineVar_sub_two = (boxII_collSqu_min_two - boxI_collSqu_max_two) / boxI_speed_sub_two;  
		
		var scnittPoint_sub_one = boxI_collSqu_max_one + lineVar_sub_two * boxI_speed_sub_one;
		var scnittPoint_main = boxI_collPos_max_main + lineVar_sub_two * boxI_speed_main;      
		var scnittPoint_sub_two = boxI_collSqu_max_two + lineVar_sub_two * boxI_speed_sub_two;  
		
		var temp_distance_sub_one = scnittPoint_sub_one - boxI_collSqu_max_one;
		var temp_distance_main = scnittPoint_main - boxI_collPos_max_main;
		var temp_distance_sub_two = scnittPoint_sub_two - boxI_collSqu_max_two;
		
		//show_debug_message("Coll: {0}, {1}, {2}, {3}", scnittPoint_sub_one, scnittPoint_main, scnittPoint_sub_two, lineVar_sub_two)

		//show_debug_message("Coll: {0} + {1} < {2} and {3} + {1} > {4} and    {5} + {6} < {7} and {8} + {6} > {9}", boxI_collSqu_min_one, temp_distance_sub_one, boxII_collSqu_max_one, boxI_collSqu_max_one, boxII_collSqu_min_one, boxI_collPos_min_main, temp_distance_main, boxII_collPos_max_main, boxI_collPos_max_main, boxII_collPos_min_main)
		
		if(lineVar_sub_two >= 0 and lineVar_sub_two < 1)
		{
			if(boxI_collSqu_min_one + temp_distance_sub_one < boxII_collSqu_max_one and boxI_collSqu_max_one + temp_distance_sub_one > boxII_collSqu_min_one and
				boxI_collPos_min_main + temp_distance_main < boxII_collPos_max_main and boxI_collPos_max_main + temp_distance_main > boxII_collPos_min_main)
			{
				distance_sub_two = sqrt(sqr(temp_distance_sub_one) + sqr(temp_distance_main) + sqr(temp_distance_sub_two));
			}
			else
				lineVar_sub_two = pointer_null; 
		}
		else
			lineVar_sub_two = pointer_null; 
	}
	else if(boxI_speed_sub_two < 0)
	{
		lineVar_sub_two = (boxII_collSqu_max_two - boxI_collSqu_min_two) / boxI_speed_sub_two;  
		
		var scnittPoint_sub_one = boxI_collSqu_min_one + lineVar_sub_two * boxI_speed_sub_one;      
		var scnittPoint_main = boxI_collPos_min_main + lineVar_sub_two * boxI_speed_main;      
		var scnittPoint_sub_two = boxI_collSqu_min_two + lineVar_sub_two * boxI_speed_sub_two;         
	
		var temp_distance_sub_one = scnittPoint_sub_one - boxI_collSqu_min_one;
		var temp_distance_main = scnittPoint_main - boxI_collPos_min_main;
		var temp_distance_sub_two = scnittPoint_sub_two - boxI_collSqu_min_two;
		
		
		if(lineVar_sub_two >= 0 and lineVar_sub_two < 1)
		{
			if(boxI_collSqu_min_one + temp_distance_sub_one < boxII_collSqu_max_one and boxI_collSqu_max_one + temp_distance_sub_one > boxII_collSqu_min_one and
				boxI_collPos_min_main + temp_distance_main < boxII_collPos_max_main and boxI_collPos_max_main + temp_distance_main > boxII_collPos_min_main)
			{
				distance_sub_two = sqrt(sqr(temp_distance_sub_one) + sqr(temp_distance_main) + sqr(temp_distance_sub_two));
			}
			else
				lineVar_sub_two = pointer_null;
		}
		else
			lineVar_sub_two = pointer_null;
	}
	
	
	if(lineVar_sub_one != pointer_null)
	{
		if(lineVar_main != pointer_null)
		{
			if(lineVar_sub_two != pointer_null)
			{
				if(distance_sub_one > distance_main and distance_sub_one > distance_sub_two)
				{
					return [boxI_collSqu_min_one + lineVar_sub_one * boxI_speed_sub_one,
							boxI_collPos_min_main + lineVar_sub_one * boxI_speed_main,
							boxI_collSqu_max_two + lineVar_sub_one * boxI_speed_sub_two,
							distance_sub_one, 0];
				}
				else if(distance_main > distance_sub_one and distance_main > distance_sub_two)
				{
					return [boxI_collSqu_min_one + lineVar_main * boxI_speed_sub_one,
							boxI_collPos_min_main + lineVar_main * boxI_speed_main,
							boxI_collSqu_max_two + lineVar_main * boxI_speed_sub_two,
							distance_main, 1];
				}
				else if(distance_sub_two > distance_main and distance_sub_two > distance_sub_one)
				{
					return [boxI_collSqu_min_one + lineVar_sub_two * boxI_speed_sub_one,
							boxI_collPos_min_main + lineVar_sub_two * boxI_speed_main,
							boxI_collSqu_max_two + lineVar_sub_two * boxI_speed_sub_two,
							distance_sub_two, 2];
				}
				else
				{
					return [boxI_collSqu_min_one + lineVar_sub_one * boxI_speed_sub_one,
							boxI_collPos_min_main + lineVar_sub_one * boxI_speed_main,
							boxI_collSqu_max_two + lineVar_sub_one * boxI_speed_sub_two,
							distance_sub_one, 0];
				}
			}
			else
			{
				if(distance_sub_one > distance_main)
				{
					return [boxI_collSqu_min_one + lineVar_sub_one * boxI_speed_sub_one,
							boxI_collPos_min_main + lineVar_sub_one * boxI_speed_main,
							boxI_collSqu_max_two + lineVar_sub_one * boxI_speed_sub_two,
							distance_sub_one, 0];
				}
				else if(distance_main > distance_sub_one)
				{
					return [boxI_collSqu_min_one + lineVar_main * boxI_speed_sub_one,
							boxI_collPos_min_main + lineVar_main * boxI_speed_main,
							boxI_collSqu_max_two + lineVar_main * boxI_speed_sub_two,
							distance_main, 1];
				}
				else
				{
					return [boxI_collSqu_min_one + lineVar_sub_one * boxI_speed_sub_one,
							boxI_collPos_min_main + lineVar_sub_one * boxI_speed_main,
							boxI_collSqu_max_two + lineVar_sub_one * boxI_speed_sub_two,
							distance_sub_one, 0];
				}
			}
		}
		else
		{
			if(lineVar_sub_two != pointer_null)
			{
				if(distance_sub_one > distance_sub_two)
				{
					return [boxI_collSqu_min_one + lineVar_sub_one * boxI_speed_sub_one,
							boxI_collPos_min_main + lineVar_sub_one * boxI_speed_main,
							boxI_collSqu_max_two + lineVar_sub_one * boxI_speed_sub_two,
							distance_sub_one, 0];
				}
				else if(distance_sub_two > distance_sub_one)
				{
					return [boxI_collSqu_min_one + lineVar_sub_two * boxI_speed_sub_one,
							boxI_collPos_min_main + lineVar_sub_two * boxI_speed_main,
							boxI_collSqu_max_two + lineVar_sub_two * boxI_speed_sub_two,
							distance_sub_two, 2];
				}
				else
				{
					return [boxI_collSqu_min_one + lineVar_sub_one * boxI_speed_sub_one,
							boxI_collPos_min_main + lineVar_sub_one * boxI_speed_main,
							boxI_collSqu_max_two + lineVar_sub_one * boxI_speed_sub_two,
							distance_sub_one, 0];
				}
			}
			else
			{
				return [boxI_collSqu_min_one + lineVar_sub_one * boxI_speed_sub_one,
						boxI_collPos_min_main + lineVar_sub_one * boxI_speed_main,
						boxI_collSqu_max_two + lineVar_sub_one * boxI_speed_sub_two,
						distance_sub_one, 0];
			}
		}
	}
	else
	{
		if(lineVar_main != pointer_null)
		{
			if(lineVar_sub_two != pointer_null)
			{
				if(distance_main > distance_sub_one and distance_main > distance_sub_two)
				{
					return [boxI_collSqu_min_one + lineVar_main * boxI_speed_sub_one,
							boxI_collPos_min_main + lineVar_main * boxI_speed_main,
							boxI_collSqu_max_two + lineVar_main * boxI_speed_sub_two,
							distance_main, 1];
				}
				else if(distance_sub_two > distance_main and distance_sub_two > distance_sub_one)
				{
					return [boxI_collSqu_min_one + lineVar_sub_two * boxI_speed_sub_one,
							boxI_collPos_min_main + lineVar_sub_two * boxI_speed_main,
							boxI_collSqu_max_two + lineVar_sub_two * boxI_speed_sub_two,
							distance_sub_two, 2];
				}
				else
				{
					return [boxI_collSqu_min_one + lineVar_main * boxI_speed_sub_one,
							boxI_collPos_min_main + lineVar_main * boxI_speed_main,
							boxI_collSqu_max_two + lineVar_main * boxI_speed_sub_two,
							distance_main, 1];
				}
			}
			else
			{
				return [boxI_collSqu_min_one + lineVar_main * boxI_speed_sub_one,
						boxI_collPos_min_main + lineVar_main * boxI_speed_main,
						boxI_collSqu_max_two + lineVar_main * boxI_speed_sub_two,
						distance_main, 1];
			}
		}
		else
		{
			if(lineVar_sub_two != pointer_null)
			{
				return [boxI_collSqu_min_one + lineVar_sub_two * boxI_speed_sub_one,
						boxI_collPos_min_main + lineVar_sub_two * boxI_speed_main,
						boxI_collSqu_max_two + lineVar_sub_two * boxI_speed_sub_two,
						distance_sub_two, 2];
			}
			else
			{
				return pointer_null;
			}
		}
	}
}

function BoxCollisionWithObjects(player_id, x_speed, y_speed, z_speed, object_id_array)
{
	var result = pointer_null;
	
	for(var i = 0; i < array_length(object_id_array); i += 1)
	{
		with(object_id_array[i])
		{
			var temp_result = BoxCollision(player_id.pos.x, player_id.pos.y, player_id.pos.z, x_speed, y_speed, z_speed, player_id.dim.x, player_id.dim.y, player_id.dim.z,
										self.pos.x, self.pos.y, self.pos.z, self.dim.x, self.dim.y, self.dim.z);
		
			if(temp_result != pointer_null)
			{
				show_debug_message("temp: {0}, current: {1}", temp_result, result)
				
				if(result == pointer_null)
				{
					result = array_concat(temp_result,[object_id_array[i]]);
				}
				else if(temp_result[3] < result[3])
				{
					result = array_concat(temp_result,[object_id_array[i]]);
				}
			}
		}
	}
	
	return result;
}