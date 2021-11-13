local players = game:GetService("Players")
local input = game:GetService("UserInputService")

local remote = game.ReplicatedStorage.MapChange

local maps = {"2007-2009 Happy Home", "2009-2011 Happy Home", "2011-2013 Happy Home", "Haunted Mansion", "2012 Egg Hunt", "2013 Egg Hunt", "Classic: Crossroads"}
local models = {game.ServerStorage.Maps.Map_2007, game.ServerStorage.Maps.Map_2009, game.ServerStorage.Maps.Map_2011, game.ServerStorage.Maps.Map_Halloween, game.ServerStorage.Maps.Map_2012_Hunt, game.ServerStorage.Maps.Map_2013_Hunt, game.ServerStorage.Maps.Map_Crossroads}

players.CharacterAutoLoads = false
input.ModalEnabled = false

local loadTimer = 30

players.PlayerAdded:Connect(function (player)
	if game.Workspace:FindFirstChild("Map_Name").Value == "" then
		print("HERE??")
		local gui = game.ServerStorage.MapGui:Clone()
		gui.Parent = player.PlayerGui
		
		gui.Frame:TweenPosition(UDim2.new(0.025, 0, 0.05, 0))
		
		local voteGui = game.ServerStorage.VoteGui:Clone()
		voteGui.Parent = player.PlayerGui
		
		if #players:GetPlayers() == 1 then
			startTimer()
		end
	end
	print("here!")
	remote:FireAllClients("help", "Use command 'changemap' to call a map change vote.")
end)

remote.OnServerEvent:Connect(function(player, action, arg)
	if action == "load" then		
		if maps[arg] == "2007-2009 Happy Home" then
			game.ServerStorage.Maps.Map_2007.Map1_Votes.Value = game.ServerStorage.Maps.Map_2007.Map1_Votes.Value + 1
		elseif maps[arg] == "2009-2011 Happy Home" then
			game.ServerStorage.Maps.Map_2009.Map2_Votes.Value = game.ServerStorage.Maps.Map_2009.Map2_Votes.Value + 1
		elseif maps[arg] == "2011-2013 Happy Home" then
			game.ServerStorage.Maps.Map_2011.Map3_Votes.Value = game.ServerStorage.Maps.Map_2011.Map3_Votes.Value + 1
		elseif maps[arg] == "Haunted Mansion" then
			game.ServerStorage.Maps.Map_Halloween.Map4_Votes.Value = game.ServerStorage.Maps.Map_Halloween.Map4_Votes.Value + 1
		elseif maps[arg] == "2012 Egg Hunt" then
			game.ServerStorage.Maps.Map_2012_Hunt.Map5_Votes.Value = game.ServerStorage.Maps.Map_2012_Hunt.Map5_Votes.Value + 1
		elseif maps[arg] == "2013 Egg Hunt" then
			game.ServerStorage.Maps.Map_2013_Hunt.Map6_Votes.Value = game.ServerStorage.Maps.Map_2013_Hunt.Map6_Votes.Value + 1
		elseif maps[arg] == "Classic: Crossroads" then
			game.ServerStorage.Maps.Map_Crossroads.Map7_Votes.Value = game.ServerStorage.Maps.Map_Crossroads.Map7_Votes.Value + 1
		end
		
		if (#players:GetPlayers() > 1) then
			updateClient()
		
			remote:FireClient(player, "load")
		else
			remote:FireClient(player, "singlePlayerLoad")
		end
	elseif action == "vote" then
		for i,v in pairs(game.Players:GetChildren()) do
			v.PlayerGui.MapGui.Frame:TweenPosition(UDim2.new(0.025, 0, 0.05, 0))
			local sound = Instance.new("Sound", player.Character.Head)
			sound.SoundId = "rbxassetid://134012322"
			sound:Play()
		end
		loadTimer = 30
		
		startTimer()
	elseif action == "playSound" then
		print("received request..")
		local sound = Instance.new("Sound", player.PlayerGui)
		sound.SoundId = arg
		sound:Play()
		
		sound.Ended:Wait()
		sound:Destroy()
	end
end)

function startGame ()
	remote:FireAllClients("prepare")
	
	wait(3)
	
	remote:FireAllClients("hide")
	
	wait(1)
	
	if game.Workspace:FindFirstChild("Map_Name").Value ~= "" then
		for i,v in pairs(game.Players:GetChildren()) do
			v.Character:Remove()
		end
		
		game.Workspace:FindFirstChild(game.Workspace:FindFirstChild("Map_Name").Value):Destroy()
	end
	
	local map = getWinningMap():Clone()
	map.Parent = workspace
	
	if (game.Lighting:FindFirstChild("Sky")) then
		game.Lighting:FindFirstChild("Sky"):Destroy()
	end
	
	if (map:FindFirstChild("Resources"):FindFirstChild("Sky")) then
		map:FindFirstChild("Resources"):FindFirstChild("Sky"):Clone().Parent = game.Lighting
	end
	
	game.ServerStorage.Maps.Map_2007.Map1_Votes.Value = 0
	game.ServerStorage.Maps.Map_2009.Map2_Votes.Value = 0
	game.ServerStorage.Maps.Map_2011.Map3_Votes.Value = 0
	game.ServerStorage.Maps.Map_Halloween.Map4_Votes.Value = 0
	game.ServerStorage.Maps.Map_2012_Hunt.Map5_Votes.Value = 0
	game.ServerStorage.Maps.Map_2013_Hunt.Map6_Votes.Value = 0
	game.ServerStorage.Maps.Map_Crossroads.Map7_Votes.Value = 0
	
	print(game.ServerStorage.Maps.Map_2007.Map1_Votes.Value + game.ServerStorage.Maps.Map_2009.Map2_Votes.Value + game.ServerStorage.Maps.Map_2011.Map3_Votes.Value + game.ServerStorage.Maps.Map_Halloween.Map4_Votes.Value + game.ServerStorage.Maps.Map_2012_Hunt.Map5_Votes.Value + game.ServerStorage.Maps.Map_2013_Hunt.Map6_Votes.Value + game.ServerStorage.Maps.Map_Crossroads.Map7_Votes.Value)
	
	game.Workspace:FindFirstChild("Map_Name").Value = map.Name
	
	for i,v in pairs(game.Players:GetChildren()) do
		if v.PlayerGui:FindFirstChild("MapGui") then
			v.PlayerGui:FindFirstChild("MapGui"):Destroy()
		end
		
		if v.PlayerGui:FindFirstChild("VoteGui") then
			v.PlayerGui:FindFirstChild("VoteGui"):Destroy()
		end	
		v:LoadCharacter()
		
		if map.Name == "Map_2007" then
			--map:FindFirstChild("Hammer"):Clone().Parent = v.Backpack;
			--map:FindFirstChild("Clone"):Clone().Parent = v.Backpack;
			--map:FindFirstChild("GameTool"):Clone().Parent = v.Backpack;
		elseif map.Name == "Map_2009" then
			--map:FindFirstChild("Reset"):Clone().Parent = v.Backpack
		end
		--v.PlayerScripts.Button_Control.Disabled = true
		--v.PlayerScripts.Button_Control.Disabled = false
	end
	
	players.CharacterAutoLoads = true
	input.ModalEnabled = true
end

function startTimer ()
	for timer = 30, 0, -1 do
		loadTimer = timer
		updateClient()
		
		print(getTotal())
		
		if getTotal() == #players:GetPlayers() then
			break
		else
			wait(1)
			-- print("Counting " .. timer)
		end
	end
	startGame()
end

function getTotal ()
	return game.ServerStorage.Maps.Map_2007.Map1_Votes.Value + game.ServerStorage.Maps.Map_2009.Map2_Votes.Value + game.ServerStorage.Maps.Map_2011.Map3_Votes.Value + game.ServerStorage.Maps.Map_Halloween.Map4_Votes.Value + game.ServerStorage.Maps.Map_2012_Hunt.Map5_Votes.Value + game.ServerStorage.Maps.Map_2013_Hunt.Map6_Votes.Value + game.ServerStorage.Maps.Map_Crossroads.Map7_Votes.Value
end

function getWinningMap ()
	local values = {
		game.ServerStorage.Maps.Map_2007.Map1_Votes,
		game.ServerStorage.Maps.Map_2009.Map2_Votes,
		game.ServerStorage.Maps.Map_2011.Map3_Votes,
		game.ServerStorage.Maps.Map_Halloween.Map4_Votes,
		game.ServerStorage.Maps.Map_2012_Hunt.Map5_Votes,
		game.ServerStorage.Maps.Map_2013_Hunt.Map6_Votes,
		game.ServerStorage.Maps.Map_Crossroads.Map7_Votes
	}
	
	local highestMap = values[math.random(#maps)]
	local highest = 0
	
	for i,v in pairs(values)do
	    if v.Value > highest then
	        highestMap = v
			highest = v.Value
	    end
	end
	
	return highestMap.Parent
end

function updateClient ()
	remote:FireAllClients("update", 
		game.ServerStorage.Maps.Map_2007.Map1_Votes.Value,
		game.ServerStorage.Maps.Map_2009.Map2_Votes.Value,
		game.ServerStorage.Maps.Map_2011.Map3_Votes.Value,
		game.ServerStorage.Maps.Map_Halloween.Map4_Votes.Value,
		game.ServerStorage.Maps.Map_2012_Hunt.Map5_Votes.Value,
		game.ServerStorage.Maps.Map_2013_Hunt.Map6_Votes.Value,
		game.ServerStorage.Maps.Map_Crossroads.Map7_Votes.Value,
		loadTimer,
		#players:GetPlayers())
end