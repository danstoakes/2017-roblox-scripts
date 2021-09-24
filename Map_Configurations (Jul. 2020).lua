--[[ 
	The config file for all of the maps and GUI information to be displayed.
--]]

local module = {
	timer = 60;
	
	maps = {
		[1] = {
			name = "2007-2009 Happy Home",
			description = [[
				A ROBLOX classic, Happy Home in Robloxia 
				existed as the default starter place for new users
				between 2007 and 2009. Featuring an iconic house, building
				blocks and tools, it allowed for users to begin their ROBLOX
				adventure by building together online in game servers.]],
			image = "http://www.roblox.com/asset/?id=4724546122",
			model = game.ServerStorage.Maps.Map_2007,
			skybox = {
				exists = true,
				resource = game.ServerStorage.Skyboxes.Sky_2007
			},
			tool = {
				exists = true,
				tools = {
					game.ServerStorage.Tools.Tools_2007.CloneTool,
					game.ServerStorage.Tools.Tools_2007.Hammer,
					game.ServerStorage.Tools.Tools_2007.GameTool
				}
			},
			sound = {
				exists = false,
				sounds = {
					
				}
			},
			voteFrameName = "Map1",
			votes = 0
		};
		
		[2] = {
			name = "2009-2011 Happy Home",
			description = [[
				A move away from ROBLOX's roots, 2009 saw a shift into a 
				less-blocky future. The updated Happy Home in Robloxia 
				introduced a massive map to explore, with lots of interesting 
				vehicles and numerous exciting locations scattered 
				across the richly detailed open space.]],
			image = "http://www.roblox.com/asset/?id=4724549599",
			model = game.ServerStorage.Maps.Map_2009,
			skybox = {
				exists = true,
				resource = game.ServerStorage.Skyboxes.Sky_2009
			},
			tool = {
				exists = true,
				tools = {
					game.ServerStorage.Tools.Tools_2009.Reset
				}
			},
			sound = {
				exists = false,
				sounds = {
					
				}
			},
			voteFrameName = "Map2",
			votes = 0
		};
		
		[3] = {
			name = "2011-2013 Happy Home",
			description = [[
				A look into ROBLOX's future plans, the new Happy Home in Robloxia 
				saw an expanded house which used different form-factor blocks. 
				This Happy Home was the last to exist on a baseplate rather than 
				terrain, and was one of the last Happy Home entries to ever be made.]],
			image = "http://www.roblox.com/asset/?id=4724553780",
			model = game.ServerStorage.Maps.Map_2011,
			skybox = {
				exists = true,
				resource = game.ServerStorage.Skyboxes.Sky_2011
			},
			tool = {
				exists = false,
				tools = {
					
				}
			},
			sound = {
				exists = false,
				sounds = {
					
				}
			},
			voteFrameName = "Map3",
			votes = 0
		};
		
		[4] = {
			name = "Haunted Mansion",
			description = [[
				A classic halloween map from 2007, the Haunted Mansion was a 
				favourite brickbattle map hosted on the ROBLOX account until 2010. 
				Designed by Telamon, the map features a huge, furnished mansion 
				and lots of hidden walkways and hiding places to battle in!]],
			image = "http://www.roblox.com/asset/?id=4741899947",
			model = game.ServerStorage.Maps.Map_Halloween,
			skybox = {
				exists = false,
				resource = nil
			},
			tool = {
				exists = false,
				tools = {
					
				}
			},
			sound = {
				exists = false,
				sounds = {
					
				}
			},
			voteFrameName = "Map4",
			votes = 0
		};
		
		[5] = {
			name = "2012 Egg Hunt",
			description = [[
				A very popular event, the 2012 Egg Hunt was the third egg hunt
				 in the series and broke numerous records. Featuring a single 
				map to hunt the eggs on, the 2012 Egg Hunt saw a shift away from
				 the classic theme - but was unfortunately plagued by the April Fools exploit.]],
			image = "http://www.roblox.com/asset/?id=4741901179",
			model = game.ServerStorage.Maps.Map_2012_Hunt,
			skybox = {
				exists = true,
				resource = game.ServerStorage.Skyboxes.Sky_2012
			},
			tool = {
				exists = false,
				tools = {
					
				}
			},
			sound = {
				exists = false,
				sounds = {
					
				}
			},
			voteFrameName = "Map5",
			votes = 0
		};
		
		[6] = {
			name = "2013 Egg Hunt",
			description = "A move-away from Egg Hunt past, the 2013 Egg Hunt was the first egg hunt to take place on an odd year. Featuring eggs with more sophisticated designs and gear for assisting for Egg finding, the 2013 Egg Hunt was the first game to reach 2 million place visits in a week.",
			image = "http://www.roblox.com/asset/?id=4741902595",
			model = game.ServerStorage.Maps.Map_2013_Hunt,
			skybox = {
				exists = true,
				resource = game.ServerStorage.Skyboxes.Sky_2013
			},
			tool = {
				exists = false,
				tools = {
					
				}
			},
			sound = {
				exists = true,
				sounds = {
					"http://www.roblox.com/asset/?id=110735374"
				}
			},
			voteFrameName = "Map6",
			votes = 0
		};
		
		[7] = {
			name = "Classic: Crossroads",
			description = "A classic ROBLOX brickbattle map, Crossroads was the first multiplayer map on ROBLOX. Inspired by Telamon's 'My First ROBLOX Game', it featured the classic ROBLOX brickbattle weapons and lots of map structures, such as the lost temple, the castle and the thieves' den.",
			image = "http://www.roblox.com/asset/?id=4742136120",
			model = game.ServerStorage.Maps.Map_Crossroads,
			skybox = {
				exists = true,
				resource = game.ServerStorage.Skyboxes.Sky_Crossroads
			},
			tool = {
				exists = false,
				tools = {
					
				}
			},
			sound = {
				exists = false,
				sounds = {
					
				}
			},
			voteFrameName = "Map7",
			votes = 0
		};
		
		[8] = {
			name = "ROBLOX HQ",
			description = "A timeless classic map designed by Telamon, the ROBLOX World Headquarters map played as another exciting brickbattle experience. Featured on Builderman's profile, players would be able to visit and destroy the ROBLOX HQ, and even kill admins such as Builderman and Matt Dusek.",
			image = "http://www.roblox.com/asset/?id=4748649326",
			model = game.ServerStorage.Maps.Map_HQ,
			skybox = {
				exists = true,
				resource = game.ServerStorage.Skyboxes.Sky_HQ
			},
			tool = {
				exists = false,
				tools = {
					
				}
			},
			sound = {
				exists = false,
				sounds = {
					
				}
			},
			voteFrameName = "Map8",
			votes = 0
		};
	}
}

return module