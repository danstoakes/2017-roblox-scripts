--[[ 
	The most recent revision of the original Admin commands, written in August 2021.
	
	This version features significantly less commands as it exists to represent a better
	and more suitable format. Furthermore, commands are not limited to a single target.
--]]

players = {
	["Dysgenics"] = true, 
	["Moderkaka"] = true,
	["Player"] = true
}
separator = ":"

function getPlayerByName(name)
	for _, player in ipairs(game.Players:GetPlayers()) do
		if string.lower(player.Name) == string.lower(name) then
			return player
		end 
	end
end

function findPlayers(name, playerName)
	local players = {}
	if name == "me" then
		players[1] = getPlayerByName(playerName)
	elseif name == "all" then
		players = game.Players:GetPlayers()
	else
		players[1] = getPlayerByName(name)
	end
	return players
end

function getCommand(message)
	local separatorIndex = string.find(message, ':')
	
	if separatorIndex then
		return string.sub(message, 1, separatorIndex - 1)
	end
	return message
end

function destroyEffect(name, children)
	for _, v in ipairs(children) do
		if v.Name == name then
			v:Destroy()
		end 
	end 
end

function constructJail(target)
	local Cell = Instance.new("Part", target.Character)
	Cell.Shape = "Ball" ; Cell.Size = Vector3.new(10,10,10)
	Cell.TopSurface = "Smooth"
	Cell.BottomSurface = "Smooth"
	Cell.BrickColor = BrickColor.new("Stone")
	Cell.Transparency = 0.3
	Cell.Name = "Jail"
	Cell.Position = target.Character:FindFirstChild("Torso").Position
	local Weld = Instance.new("Weld", target.Character:FindFirstChild("Torso"))
	Weld.Part1 = target.Character:FindFirstChild("Torso")
	Weld.Part0 = Cell
end

function handleCommand(command, target)
	local humanoid = target.Character:WaitForChild"Humanoid"
	
	if command == "kill" then
		target.Character:BreakJoints()
	elseif command == "heal" then
		humanoid.Health = 100
	elseif command == "ff" then
		local _ = Instance.new("ForceField", target.Character)
	elseif command == "unff" then
		destroyEffect("ForceField", target.Character:GetChildren())
	elseif command == "explosion" then
		local Explosion = Instance.new("Explosion", game.Workspace)
		Explosion.Position = target.Character:FindFirstChild"Torso".Position
	elseif command == "punish" then
		target.Character.Parent = game.Lighting
	elseif command == "unpunish" then
		target.Character.Parent = game.Workspace
	elseif command == "sparkles" then
		local _ = Instance.new("Sparkles", target.Character:FindFirstChild"Torso")
	elseif command == "unsparkles" then
		destroyEffect("Sparkles", target.Character:FindFirstChild"Torso":GetChildren())
	elseif command == "fire" then
		local _ = Instance.new("Fire", target.Character:FindFirstChild"Head")
	elseif command == "extinguish" then
		destroyEffect("Fire", target.Character:FindFirstChild"Head":GetChildren())
	elseif command == "jail" then
		constructJail(target)
		target.Character:FindFirstChild"Torso".Anchored = true
		humanoid.WalkSpeed = 0
	elseif command == "release" then
		if target.Character:FindFirstChild"Jail" then
			target.Character:FindFirstChild"Jail":Destroy()
		end
		target.Character:FindFirstChild"Torso".Anchored = false
		humanoid.WalkSpeed = 16
	end
end

game.Players.PlayerAdded:Connect(function(player)
	player.Chatted:Connect(function(message)
		message = string.lower(message)
		
		if players[player.Name] then
			local targets = nil
			local command = getCommand(message)
			
			if command == message then
				return
			else
				local commandWithSepIndex = string.len(command) + string.len(separator)
				
				targets = findPlayers(message:sub(commandWithSepIndex + 1), player.Name)
				for i = 1, #targets do
					handleCommand(command, targets[i])
				end
			end
		end
	end)
end)