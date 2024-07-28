if(!global.depthSetup)
{
	global.depthSetup = true;
	
	var objects	= ds_list_create();
	with(CollisionObject)
	{
		//show_debug_message("Begin List: {0}", self.id)
		
		if(ds_list_size(objects) < 1)
		{
			ds_list_add(objects, self.id);	
		}
		else
		{
			var inserted = false;
			
			for(var i = 0; i < ds_list_size(objects); i++)
			{	
				var object = ds_list_find_value(objects, i);
				
				if(self.pos.orientation == ORIENTATIONS.UPRIGHT)
				{
					if(object.pos.orientation == ORIENTATIONS.UPRIGHT)
					{
						if(self.pos.z - self.dim.z < object.pos.z and self.pos.z > object.pos.z - object.dim.z)
						{
							if(self.pos.y + self.dim.y < object.pos.y + object.dim.y)
							{
								ds_list_insert(objects, i, self.id);
								inserted = true;
								break;
							}
							else if(self.pos.y + self.dim.y == object.pos.y + object.dim.y)
							{
								if(self.depthPriority <= object.depthPriority)
								{
									ds_list_insert(objects, i, self.id);
									inserted = true;
									break;
								}
							}
						}
						else if(self.pos.z - self.dim.z >= object.pos.z)
						{
							ds_list_insert(objects, i, self.id);
							inserted = true;
							break;
						}
					}
					else if(object.pos.orientation == ORIENTATIONS.FLAT)
					{
						if(!(self.pos.y + self.dim.y > object.pos.y + object.dim.y or self.pos.z < object.pos.z - object.dim.z))
						{
							if(self.pos.y + self.dim.y < object.pos.y + object.dim.y and self.pos.z > object.pos.z - object.dim.z)
							{
								ds_list_insert(objects, i, self.id);
								inserted = true;
								break;
							}
							else
							{
								if(self.depthPriority <= object.depthPriority)
								{
									ds_list_insert(objects, i, self.id);
									inserted = true;
									break;
								}
							}
						}
					}
				}
				else if(self.pos.orientation == ORIENTATIONS.FLAT)
				{
					if(object.pos.orientation == ORIENTATIONS.UPRIGHT)
					{
						if(self.pos.y + self.dim.y < object.pos.y + object.dim.y or self.pos.z - self.dim.z > object.pos.z)
						{
							ds_list_insert(objects, i, self.id);
							inserted = true;
							break;
						}
						else if(!(self.pos.y + self.dim.y > object.pos.y + object.dim.y and self.pos.z - self.dim.z < object.pos.z))
						{
							if(self.depthPriority <= object.depthPriority)
							{
								ds_list_insert(objects, i, self.id);
								inserted = true;
								break;
							}
						}
					}
					else if(object.pos.orientation == ORIENTATIONS.FLAT)
					{
						if(self.pos.y < object.pos.y + object.dim.y and self.pos.y + self.dim.y > object.pos.y)
						{
							if(self.pos.z - self.dim.z > object.pos.z - object.dim.z)
							{
								ds_list_insert(objects, i, self.id);
								inserted = true;
								break;
							}
							else if(self.pos.z - self.dim.z == object.pos.z - object.dim.z)
							{
								if(self.depthPriority <= object.depthPriority)
								{
									ds_list_insert(objects, i, self.id);
									inserted = true;
									break;
								}
							}
						}
						else if(self.pos.y + self.dim.y <= object.pos.y)
						{
							ds_list_insert(objects, i, self.id);
							inserted = true;
							break;
						}
					}
				}
			}
			
			if(!inserted)
			{
				ds_list_add(objects, self.id);	
			}
		}
	}
	
	
	for(var o = 0; o < ds_list_size(objects); o++)
	{
		//show_debug_message("End List: {0}", ds_list_find_value(objects, o))
		ds_list_find_value(objects, o).depth = -o;
	}
}