--[[ 
	The local/client-side of the Map Changer which handles the GUI aspects
	and communication with the server-side script.
--]]

repeat wait() until game.Players.LocalPlayer.PlayerGui:FindFirstChild("MapGui")

local players = game:GetService("Players")
local starterGui = game:GetService("StarterGui")

local player = players.LocalPlayer

-- starterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, false)

repeat wait() until player:FindFirstChild("PlayerGui")

local gui = script.Parent

local voteFrame = gui.VoteFrame
local loadFrame = gui.LoadFrame
local waitFrame = gui.WaitFrame
local gameFrame = gui.GameFrame

local buttonFrame = voteFrame.ContentFrame.TextFrame.ButtonFrame
local targetFrame = nil

local remote = game.ReplicatedStorage.MapChange;

local selectedMap = 1

local voteEnded = false

function resetMapRotation ()
	local numberOfMaps = workspace:WaitForChild("Map_Number").Value
	
	if selectedMap == numberOfMaps then 
		selectedMap = 1 
	else 
		selectedMap = selectedMap + 1 
	end
end

function updateMap (values, timer, votes)
	local content = voteFrame.ContentFrame
	local waitContent = waitFrame.TitleFrame
	
	if values ~= nil then
		content.ImageFrame.ImageLabel.Image = values.image
	
		content.TextFrame.MainFrame.DescriptionLabel.Text = values.description
		content.TextFrame.MainFrame.PlaceLabel.Text = values.name
	end
	
	if votes ~= nil then
		for i, v in ipairs(waitFrame.ContentFrame:GetChildren()) do
			if v:IsA("Frame") then
				v.TextLabel.Text = "Votes: " .. votes[tonumber(v.Name:sub(#v.Name))]
			end
		end
	end
	
	content.TextFrame.ButtonFrame.TimeLabel.Text = "Time remaining: " .. timer
	waitContent.WaitingLabel.Text = "Time remaining: " .. timer
end

remote.OnClientEvent:Connect(function (action, arg, timer, votes, name, image)
	if action == "show" then
		if gameFrame.Position == UDim2.new(0, 0, 0, 0) then
			gameFrame:TweenPosition(UDim2.new(0, 0, 2, 0))
			
			repeat wait() until gameFrame.Position == UDim2.new(0, 0, 2, 0)
		end
		voteFrame:TweenPosition(UDim2.new(0.025, 0, 0.05, 0))
		
		repeat wait() until voteFrame.Position == UDim2.new(0.025, 0, 0.05, 0)
	elseif action == "update" then
		updateMap(arg, timer, votes)
	elseif action == "load" then
		updateMap(arg, timer, votes)
		
		loadFrame.ContentFrame.ImageFrame.ImageLabel.Image = image
		loadFrame.ContentFrame.TextFrame.MainFrame.PlaceLabel.Text = name
		
		if targetFrame == waitFrame then
			targetFrame:TweenPosition(UDim2.new(2, 0, 0.05, 0))
			
			repeat wait() until voteFrame.Position == UDim2.new(2, 0, 0.05, 0)
			
			loadFrame:TweenPosition(UDim2.new(0.025, 0, 0.05, 0))
		end
	elseif action == "voteEnded" then
		voteEnded = true
	elseif action == "gameLoaded" then
		local frames = {voteFrame, loadFrame, waitFrame}
		
		for i = 1, #frames do
			frames[i]:TweenPosition(UDim2.new(2, 0, 0.05, 0))
			
			repeat wait() until frames[i].Position == UDim2.new(2, 0, 0.05, 0)
		end
		
		selectedMap = 1
		voteEnded = false
	elseif action == "updateGameTimer" then
		local hours = string.format("%02.f", math.floor(timer/3600));
    	local minutes = string.format("%02.f", math.floor(timer/60 - (hours*60)));
    	local seconds = string.format("%02.f", math.floor(timer - hours*3600 - minutes *60));

		gameFrame.TimeLabel.Text = minutes .. ":" .. seconds
		
		gameFrame:TweenPosition(UDim2.new(0, 0, 0, 0))
		
		repeat wait() until gameFrame.Position == UDim2.new(0, 0, 0, 0)
	end
end)

buttonFrame.LoadButton.MouseButton1Click:Connect(function ()
	remote:FireServer("vote", selectedMap)
	
	voteFrame:TweenPosition(UDim2.new(2, 0, 0.05, 0))
	
	repeat wait() until voteFrame.Position == UDim2.new(2, 0, 0.05, 0)
	
	targetFrame = waitFrame
	if #players:GetPlayers() == 1 or voteEnded then
		targetFrame = loadFrame
	end
	
	targetFrame:TweenPosition(UDim2.new(0.025, 0, 0.05, 0))
end)

buttonFrame.NextButton.MouseButton1Click:Connect(function ()
	voteFrame:TweenPosition(UDim2.new(2, 0, 0.05, 0))
	
	repeat wait() until voteFrame.Position == UDim2.new(2, 0, 0.05, 0)
	
	resetMapRotation()
	
	remote:FireServer("update", selectedMap) -- method, maptoload
	
	repeat wait() until voteFrame.Position == UDim2.new(2, 0, 0.05, 0)
	
	voteFrame:TweenPosition(UDim2.new(0.025, 0, 0.05, 0))
end)