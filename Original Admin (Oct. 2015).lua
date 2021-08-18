--[[ 
	The first Admin commands script I ever wrote, originally written in October 2015.
	
	Most of the commands are still operational, but the methodology in use is fairly
	questionable and noticeably redundant. There is also a slightly unorthodox format.
--]]

function M(text,waittime)
local M=Instance.new("Message")
M.Parent=game.Workspace
M.Text=(text)
wait(tonumber(waittime))
M:remove()
end

function H(text,waittime)
local H=Instance.new("Hint")
H.Parent=game.Workspace
H.Text=(text)
wait(tonumber(waittime))
H:remove()
end

local Admin={["Player"] = true, ["Huminoidjoe"] = true, ["Moderkaka"] = true}

function onChatted(message,player)
    if message =="reset" and Admin[player.Name] then
        local a=Instance.new("Sound")
		a.SoundId="http://www.roblox.com/asset/?id=2691586"
		a.Name="Explode1"
		a.Parent=game.Workspace
		a:play()
		player.Character.Humanoid.Health=75
		M("Re-setting "..player.Name.."'s character..","3")
		a:play()
		player.Character.Humanoid.Health=50
		wait(2)
		a:play()
		player.Character.Humanoid.Health=25
		wait(2)
		a:play()
		player.Character.Humanoid.Health=0
		M("Respawning "..player.Name.."'s character..","4")
end end

game.Players.PlayerAdded:connect(function(player)
    player.Chatted:connect(function(message) onChatted(message, player) end)end)

function onChatted2(message,player)
	if message=="run" and Admin[player.Name] then
		local a=Instance.new("Sound")
		a.SoundId="rbxasset://sounds/bfsl-minifigfoots1.mp3"
		a.Name="Bounce1"
		a.Parent=game.Workspace
		a:play()
		player.Character.Humanoid.WalkSpeed=55
		M(""..player.Name.." can run really fast!","6")
		end end

game.Players.PlayerAdded:connect(function(player)
    player.Chatted:connect(function(message) onChatted2(message, player) end)end)

function onChatted3(message,player)
	if message=="highjump" and Admin[player.Name] then
		local a=Instance.new("Sound")
		a.SoundId="rbxasset://sounds//short spring sound.wav"
		a.Name="Bounce1"
		a.Parent=game.Workspace
		a:play()
		player.Character.Humanoid.JumpPower=100
		M(""..player.Name.." can jump really high!","6")
		end end

game.Players.PlayerAdded:connect(function(player)
    player.Chatted:connect(function(message) onChatted3(message, player) end)end)

function onChatted4(message,player)
	if message=="invulnerable" and Admin[player.Name] then
		while true do
		wait()
		local a=Instance.new("Sound")
		a.SoundId="http://www.roblox.com/asset/?id=12221976"
		a.Name="TheDrums"
		a.Parent=game.Workspace
		a.Pitch=0.1
		a:play()
		if player.Character.Humanoid.Health<100 then
		player.Character.Humanoid.Health=100
		end end end end

game.Players.PlayerAdded:connect(function(player)
    player.Chatted:connect(function(message) onChatted4(message, player) end)end) 

function onChatted5(message,player)
	if message=="invisible" and Admin[player.Name] then
		local a=Instance.new("Sound")
		a.SoundId="http://www.roblox.com/asset/?id=5985139"
		a.Name="Silence"
		a.Parent=game.Workspace
		a:play()
		player.Character.Head.Transparency=1
		player.Character.Head.face.Texture=""
		player.Character.Shirt.ShirtTemplate=""
		player.Character.Pants.PantsTemplate=""
		player.Character:findFirstChild("Right Arm").Transparency=1
		player.Character:findFirstChild("Left Arm").Transparency=1
		player.Character:findFirstChild("Right Leg").Transparency=1
		player.Character:findFirstChild("Left Leg").Transparency=1
		player.Character:findFirstChild("Torso").Transparency=1
		local d=player.Character:GetChildren()
		for i=1, #d do 
		if (d[i].className == "Hat") then 
			d[i]:remove()
	end end end end

game.Players.PlayerAdded:connect(function(player)
    player.Chatted:connect(function(message) onChatted5(message, player) end)end)

function onChatted6(message,player)
	if message=="shiny" and Admin[player.Name] then
		local a=Instance.new("Sound")
		a.SoundId="http://www.roblox.com/asset/?id=11415738"
		a.Name="Tingy"
		a.Parent=game.Workspace
		a:play()
		player.Character.Head.Reflectance=1
		player.Character.Head.face.Texture=""
		player.Character.Shirt.ShirtTemplate=""
		player.Character.Pants.PantsTemplate=""
		player.Character:findFirstChild("Right Arm").Reflectance=1
		player.Character:findFirstChild("Left Arm").Reflectance=1
		player.Character:findFirstChild("Right Leg").Reflectance=1
		player.Character:findFirstChild("Left Leg").Reflectance=1
		player.Character:findFirstChild("Torso").Reflectance=1
		local d=player.Character:GetChildren()
		for i=1, #d do 
		if (d[i].className == "Hat") then 
			d[i]:remove()
		end end end end

game.Players.PlayerAdded:connect(function(player)
    player.Chatted:connect(function(message) onChatted6(message, player) end)end) 

function onChatted7(message,player)
	if message=="ethereal" and Admin[player.Name] then
		player.Character.Humanoid.WalkSpeed=55
		player.Character.Humanoid.JumpPower=120
		local a=Instance.new("Sound")
		a.SoundId="http://www.roblox.com/asset/?id=12229501"
		a.Name="Ghost"
		a.Parent=game.Workspace
		a:play()
		player.Character.Head.BrickColor=BrickColor.new("White")
		player.Character:findFirstChild("Right Arm").BrickColor=BrickColor.new("White")
		player.Character:findFirstChild("Left Arm").BrickColor=BrickColor.new("White")
		player.Character:findFirstChild("Right Leg").BrickColor=BrickColor.new("White")
		player.Character:findFirstChild("Left Leg").BrickColor=BrickColor.new("White")
		player.Character:findFirstChild("Torso").BrickColor=BrickColor.new("White")
		player.Character.Head.face.Texture="http://www.roblox.com/asset/?id=21721073"
		player.Character.Head.Transparency=0.7
		player.Character:findFirstChild("Right Arm").Transparency=0.7
		player.Character:findFirstChild("Left Arm").Transparency=0.7
		player.Character:findFirstChild("Right Leg").Transparency=0.7
		player.Character:findFirstChild("Left Leg").Transparency=0.7
		player.Character:findFirstChild("Torso").Transparency=0.7
		player.Character.Shirt.ShirtTemplate=""
		player.Character.Pants.PantsTemplate=""
		local d=player.Character:GetChildren()
		for i=1, #d do 
		if (d[i].className == "Hat") then 
			d[i]:remove()
		game.Lighting.TimeOfDay="22:00:00"
		M(""..player.Name.." is in ghost form!","5")
		end end end end

game.Players.PlayerAdded:connect(function(player)
    player.Chatted:connect(function(message) onChatted7(message, player) end)end)

function onChatted8(message,player)
	if message=="ff" and Admin[player.Name] then
		local a=Instance.new("Sound")
		a.SoundId="http://www.roblox.com/asset/?id=2101144"
		a.Name="Healer"
		a.Parent=game.Workspace
		a:play()
		local b=Instance.new("ForceField")
		b.Parent=player.Character
	end end

game.Players.PlayerAdded:connect(function(player)
    player.Chatted:connect(function(message) onChatted8(message, player) end)end)

function onChatted9(message,player)
	if message=="sparkles" and Admin[player.Name] then
		local a=Instance.new("Sound")
		a.SoundId="http://www.roblox.com/asset/?id=1089406"
		a.Name="Shiny"
		a.Parent=game.Workspace
		a:play()
		local b=Instance.new("Sparkles")
		b.Parent=player.Character.Torso
		b.SparkleColor=Color3.new("Deep orange")
	end end

game.Players.PlayerAdded:connect(function(player)
	player.Chatted:connect(function(message) onChatted9(message, player) end)end)

function onChatted10(message,player)
	if message=="explode" and Admin[player.Name] then
		local a=Instance.new("Sound")
		a.SoundId="http://www.roblox.com/asset/?id=2248511"
		a.Name="Bang"
		a.Parent=game.Workspace
		a:play()
		local b=Instance.new("Explosion")
		b.Parent=game.Workspace
		b.Position=player.Character.Torso.Position
		b.BlastPressure=1500
		b.BlastRadius=10
		M(""..player.Name.." just blew up!","5")
	end end

game.Players.PlayerAdded:connect(function(player)
    player.Chatted:connect(function(message) onChatted10(message, player) end)end)

function onChatted11(message,player)
	if message=="flame" and Admin[player.Name] then
		local a=Instance.new("Sound")
		a.SoundId="http://www.roblox.com/asset/?id=12222065"
		a.Name="Fire"
		a.Parent=game.Workspace
		a:play()
		local b=Instance.new("Fire")
		b.Parent=player.Character.Torso
		b.Parent=player.Character.Head
		b.Heat=14
		local c=Instance.new("Smoke")
		c.Parent=player.Character.Torso
		c.Parent=player.Character.Torso
		c.Opacity=1
		c.RiseVelocity=4
		c.Color=Color3.new("Really black")
	end end

game.Players.PlayerAdded:connect(function(player)
    player.Chatted:connect(function(message) onChatted11(message, player) end)end)

function onChatted12(message,player)
	if message=="particle" and Admin[player.Name] then
		local a=Instance.new("Sound")
		a.SoundId="rbxasset://sounds/Rocket whoosh 01.wav"
		a.Name="Allin"
		a.Parent=game.Workspace
		a:play()
		local b=Instance.new("ParticleEmitter")
		b.Parent=player.Character.Torso
		b.Color=Color3.new("Crimson")
		b.Speed=2
		b.Rate=10
	end end

game.Players.PlayerAdded:connect(function(player)
    player.Chatted:connect(function(message) onChatted12(message, player) end)end)

function onChatted13(message,player)
	if message=="dubstep" and Admin[player.Name] then
		local a=Instance.new("Sound")
		a.SoundId="http://www.roblox.com/asset/?id=132251996"
		a.Name="DubstepOne"
		a.Parent=game.Workspace
		local b=Instance.new("Sound")
		b.SoundId="http://www.roblox.com/asset/?id=130777688"
		b.Name="DubstepTwo"
		b.Parent=game.Workspace
		local d=Instance.new("Sound")
		d.SoundId="http://www.roblox.com/asset/?id=132251996"
		d.Name="DubstepFour"
		d.Parent=game.Workspace
		while true do
		wait()
		a:play()
		a.Looped=true
		wait(60)
		a.Looped=false
		a:stop()
		b:play()
		b.Looped=true
		wait(56)
		b.Looped=false
		b:stop()
		d:play()
		d.Looped=true
		wait(60)
		d.Looped=false
		d:stop()
		a:play()
	end end end

game.Players.PlayerAdded:connect(function(player)
    player.Chatted:connect(function(message) onChatted13(message, player) end)end) 

function onChatted14(message,player)
	if message=="rave" and Admin[player.Name] then
		local a=Instance.new("Sound")
		a.SoundId="http://www.roblox.com/asset/?id=134580833"
		a.Name="Rihanna"
		a.Parent=game.Workspace
		a:play()
		a.Looped=true
		local character = player.Character
		local animateScript = character.Animate
		animateScript.idle.Animation1.AnimationId = 'rbxassetid://33796059'
		animateScript.jump.JumpAnim.AnimationId = 'http://www.roblox.com/asset/?id=165167557'
		M("Use /e dance, or /e dance2, etc. to dance!","6")
		local clone1=game.Lighting.Disco:clone()
		clone1.Parent=game.Workspace.BasePlate
	end end

game.Players.PlayerAdded:connect(function(player)
    player.Chatted:connect(function(message) onChatted14(message, player) end)end)

function onChatted15(message,player)
	if message=="morning" and Admin[player.Name] then
		local a=Instance.new("Sound")
		a.SoundId="http://www.roblox.com/asset/?id=19364276"
		a.Name="Daysoundwind"
		a.Parent=game.Workspace
		a:play()
		game.Lighting.TimeOfDay="11:00:00"
	elseif message=="noon" and Admin[player.Name] then
		local b=Instance.new("Sound")
		b.SoundId="http://www.roblox.com/asset/?id=11565378"
		b.Parent=game.Workspace
		b:play()
		game.Lighting.TimeOfDay="17:40:00"
	elseif message=="night" and Admin[player.Name] then
		local c=Instance.new("Sound")
		c.SoundId="http://www.roblox.com/asset/?id=11387922"
		c.Parent=game.Workspace
		c:play()
		game.Lighting.TimeOfDay="21:00:00"
	end end

game.Players.PlayerAdded:connect(function(player)
    player.Chatted:connect(function(message) onChatted15(message, player) end)end)

function onChatted16(message,player)
	if message=="residualclear" and Admin[player.Name] then
		M("Re-setting the basic properties for "..player.Name.."..","7")
		player.Character.Humanoid.WalkSpeed=16
		player.Character.Humanoid.JumpPower=50
		player.Character.Humanoid.Health=100
		game.Lighting.TimeOfDay="12:00:00"
		game.Lighting.FogStart=1
		game.Lighting.FogEnd=100000
		game.Lighting.FogColor=Color3.new("Medium stone grey")
		player.Character:findFirstChild("Right Arm").BrickColor=BrickColor.new("White")
		player.Character:findFirstChild("Left Arm").BrickColor=BrickColor.new("White")
		player.Character:findFirstChild("Right Leg").BrickColor=BrickColor.new("White")
		player.Character:findFirstChild("Left Leg").BrickColor=BrickColor.new("White")
		player.Character:findFirstChild("Torso").BrickColor=BrickColor.new("White")
		player.Character.Head.BrickColor=BrickColor.new("White")
		player.Character.Head.Transparency=0
		player.Character:findFirstChild("Right Arm").Transparency=0
		player.Character:findFirstChild("Left Arm").Transparency=0
		player.Character:findFirstChild("Right Leg").Transparency=0
		player.Character:findFirstChild("Left Leg").Transparency=0
		player.Character:findFirstChild("Torso").Transparency=0
		player.Character.Head.face.Texture="rbxasset://textures/face.png"
		player.Character.Shirt.ShirtTemplate="http://www.roblox.com/asset/?id=135696247"
		player.Character.Pants.PantsTemplate="http://www.roblox.com/asset/?id=144640910"
		local character = player.Character
		local animateScript = character.Animate
		animateScript.walk.WalkAnim.AnimationId='http://www.roblox.com/asset/?id=180426354'
		animateScript.idle.Animation1.AnimationId='http://www.roblox.com/asset/?id=180435571'
		animateScript.fall.FallAnim.AnimationId='http://www.roblox.com/asset/?id=180436148'
		animateScript.jump.JumpAnim.AnimationId='http://www.roblox.com/asset/?id=125750702'
		local d=player.Character:GetChildren()
		if player.Character:FindFirstChild("Humanoid") then
			if player.Character.Humanoid.Health>0 then
				for i,v in pairs(player.Character:GetChildren()) do
					if v.Name=="ForceField" then
					v:remove()
				end end end end end end

game.Players.PlayerAdded:connect(function(player)
    player.Chatted:connect(function(message) onChatted16(message, player) end)end)

function onChatted17(message,player)
	if message=="unff" and Admin[player.Name] then
		local a=Instance.new("Sound")
		a.SoundId="http://www.roblox.com/asset/?id=2101144"
		a.Name="Healer"
		a.Parent=game.Workspace
		a:play()
		if player.Character:FindFirstChild("Humanoid") then
			if player.Character.Humanoid.Health>0 then
				for i,v in pairs(player.Character:GetChildren()) do
					if v.Name=="ForceField" then
					v:remove()
					end end end end end end

game.Players.PlayerAdded:connect(function(player)
    player.Chatted:connect(function(message) onChatted17(message, player) end)end)

function onChatted18 (message,player)
	if message=="zombie" and Admin[player.Name] then
		local a=Instance.new("Sound")
		a.SoundId="http://www.roblox.com/asset/?id=25954407"
		a.Name="Moan"
		a.Parent=game.Workspace
		a:play()
		game.Lighting.Brightness=0.5
		game.Lighting.TimeOfDay="18:30:00"
		game.Lighting.FogStart=1
		game.Lighting.FogEnd=200
		game.Lighting.FogColor=Color3.new("Pastel green")
		player.Character.Humanoid.WalkSpeed=8
		player.Character.Humanoid.JumpPower=10
		player.Character.Humanoid.Health=10
		player.Character.Head.BrickColor=BrickColor.new("Hurricane grey")
		player.Character.Head.face.Texture="http://www.roblox.com/asset/?id=24690949"
		player.Character:findFirstChild("Right Arm").BrickColor=BrickColor.new("Hurricane grey")
		player.Character:findFirstChild("Left Arm").BrickColor=BrickColor.new("Hurricane grey")
		player.Character:findFirstChild("Right Leg").BrickColor=BrickColor.new("Reddish brown")
		player.Character:findFirstChild("Left Leg").BrickColor=BrickColor.new("Reddish brown")
		player.Character:findFirstChild("Torso").BrickColor=BrickColor.new("Reddish brown")
		player.Character.Shirt.ShirtTemplate=""
		player.Character.Pants.PantsTemplate=""
		local character = player.Character
		local animateScript = character.Animate
		animateScript.walk.WalkAnim.AnimationId = 'http://www.roblox.com/asset/?id=161210451'
		animateScript.idle.Animation1.AnimationId = 'http://www.roblox.com/asset/?id=161100084'
		animateScript.fall.FallAnim.AnimationId = 'http://www.roblox.com/asset/?id=165167632'
		animateScript.jump.JumpAnim.AnimationId = 'http://www.roblox.com/asset/?id=165167557'
		local d=player.Character:GetChildren()
		for i=1, #d do 
		if (d[i].className == "Hat") then 
			d[i]:remove() 
		M(""..player.Name.." is a zombie..","5")
		end end end end

game.Players.PlayerAdded:connect(function(player)
    player.Chatted:connect(function(message) onChatted18(message, player) end)end)

function onChatted19 (message,player)
	if message=="fog" and Admin[player.Name] then
		local a=Instance.new("Sound")
		a.SoundId="http://www.roblox.com/asset/?id=1369158"
		a.Name="Clouded"
		a.Parent=game.Workspace
		a:play()
		game.Lighting.FogStart=1
		game.Lighting.FogEnd=55
		game.Lighting.FogColor=Color3.new("Really black")
	end end

game.Players.PlayerAdded:connect(function(player)
    player.Chatted:connect(function(message) onChatted19(message, player) end)end)

function onChatted20 (message,player)
	if message=="noob" and Admin[player.Name] then
		local a=Instance.new("Sound")
		a.SoundId="http://www.roblox.com/asset/?id=4700455"
		a.Name="Noobified"
		a.Parent=game.Workspace
		a:Play()
		local h=Instance.new("Hint")
		h.Parent=game.Workspace
		h.Text="The owner thanks Huminoidjoe for his Admin commands."
		player.Character.Head.BrickColor=BrickColor.new("Bright yellow")
		player.Character:findFirstChild("Right Arm").BrickColor=BrickColor.new("Bright yellow")
		player.Character:findFirstChild("Left Arm").BrickColor=BrickColor.new("Bright yellow")
		player.Character:findFirstChild("Right Leg").BrickColor=BrickColor.new("Br. yellowish green")
		player.Character:findFirstChild("Left Leg").BrickColor=BrickColor.new("Br. yellowish green")
		player.Character:findFirstChild("Torso").BrickColor=BrickColor.new("Deep blue")
		player.Character.Shirt.ShirtTemplate=""
		player.Character.Pants.PantsTemplate=""
		local b=Instance.new("Decal")
		b.Texture="http://www.roblox.com/images/shirt.png"
		b.Name="RobloxLogo"
		b.Parent=player.Character:findFirstChild("Torso")
		local d=player.Character:GetChildren()	
			for i=1, #d do 
		if (d[i].className == "Hat") then 
			d[i]:remove() 
				end end end end

game.Players.PlayerAdded:connect(function(player)
    player.Chatted:connect(function(message) onChatted20(message, player) end)end)

function onChatted21(message,player)
	if message=="unhint" and Admin[player.Name] then
		local a=Instance.new("Sound")
		a.SoundId="http://www.roblox.com/asset/?id=2697432"
		a.Name="Shlop"
		a.Parent=game.Workspace
		a:play()
		local d=game.Workspace:GetChildren()	
			for i=1, #d do 
		if (d[i].className == "Hint") then 
			d[i]:remove()
		end end end end

game.Players.PlayerAdded:connect(function(player)
    player.Chatted:connect(function(message) onChatted21(message, player) end)end)

function onChatted22(message,player)
	if message=="clearsounds" and Admin[player.Name] then
		local a=Instance.new("Sound")
		a.SoundId="http://www.roblox.com/asset/?id=2920960"
		a.Name="Schlopp"
		a.Parent=game.Workspace
		a:play()
		wait(3)
		local d=game.Workspace:GetChildren()	
			for i=1, #d do 
		if (d[i].className == "Sound") then 
			d[i]:remove()
		end end end end

game.Players.PlayerAdded:connect(function(player)
    player.Chatted:connect(function(message) onChatted22(message, player) end)end)

function onChatted23(message,player)
	if message=="unmessage" and Admin[player.Name] then
		local a=Instance.new("Sound")
		a.SoundId="http://www.roblox.com/asset/?id=2920960"
		a.Name="Schloppp"
		a.Parent=game.Workspace
		a:play()
		local d=game.Workspace:GetChildren()	
			for i=1, #d do 
		if (d[i].className == "Message") then 
			d[i]:remove()
		end end end end

game.Players.PlayerAdded:connect(function(player)
    player.Chatted:connect(function(message) onChatted23(message, player) end)end)

function onChatted24(message,player)
	if message=="mariomode" and Admin[player.Name] then
		local a=Instance.new("Sound")
		a.SoundId="http://www.roblox.com/asset/?id=1280470"
		a.Name="ItsaMe"
		a.Parent=game.Workspace
		a:play()
		a.Looped=true
		player.Character.Shirt.ShirtTemplate="http://www.roblox.com/asset/?id=4422518"
		player.Character.Pants.PantsTemplate="http://www.roblox.com/asset/?id=4422559"
		player.Character.Head.BrickColor=BrickColor.new("Pastel brown")
		player.Character.Head.face.Texture="http://www.roblox.com/asset/?id=86157358"
		player.Character.Humanoid.WalkSpeed=35
		player.Character.Humanoid.JumpPower=200
		local b=Instance.new("Decal")
		b.Texture="http://www.roblox.com/asset/?version=1&id=1185297"
		b.Face="Top"
		local h=Instance.new("Hat") 
		h.Parent=player.Character
		h.AttachmentForward=Vector3.new(0,0,0) 
		h.AttachmentPos=Vector3.new(0,-0.23,0.18) 
		h.AttachmentRight=Vector3.new(1,0,0) 
		h.AttachmentUp=Vector3.new(0,1,0) 
		local a=Instance.new("Part") 
		a.Name="Handle" 
		a.Parent=player.Character.Hat
		local m=Instance.new("SpecialMesh") 
		m.Parent=player.Character.Hat.Handle 
		m.MeshId="http://www.roblox.com/asset/?id=1028604" 
		m.TextureId="http://www.roblox.com/asset/?id=159411097"
		b.Parent=game.Workspace.BasePlate
		local clone1=game.Lighting.mariograss:clone()
		clone1.Parent=game.Workspace
		clone1:MakeJoints()
		H("The owner thanks Huminoidjoe for his Admin commands.","100")
	end end

game.Players.PlayerAdded:connect(function(player)
    player.Chatted:connect(function(message) onChatted24(message, player) end)end)

function onChatted25(message,player)
	if message=="red" and Admin[player.Name] then
		local a=Instance.new("Sound")
		a.SoundId="rbxasset://sounds//short spring sound.wav"
		a.Name="Red1"
		a.Parent=game.Workspace
		a:play()
		game.Lighting.Ambient=Color3.new(255,0,0)
		game.Lighting.ColorShift_Bottom=Color3.new(255,0,0)
		game.Lighting.ColorShift_Top=Color3.new(255,0,0)
		game.Lighting.OutdoorAmbient=Color3.new(255,0,0)
	elseif message=="green" and Admin[player.Name] then
		local b=Instance.new("Sound")
		b.SoundId="rbxasset://sounds//short spring sound.wav"
		b.Name="Green1"
		b.Parent=game.Workspace
		b:play()
		game.Lighting.Ambient=Color3.new(0,255,0) -- change first number to 255 for regae
		game.Lighting.ColorShift_Bottom=Color3.new(0,255,0)
		game.Lighting.ColorShift_Top=Color3.new(0,255,0)
		game.Lighting.OutdoorAmbient=Color3.new(0,255,0)
	elseif message=="blue" and Admin[player.Name] then
		local c=Instance.new("Sound")
		c.SoundId="rbxasset://sounds//short spring sound.wav"
		c.Name="Blue1"
		c.Parent=game.Workspace
		c:play()
		game.Lighting.Ambient=Color3.new(0,0,255)
		game.Lighting.ColorShift_Bottom=Color3.new(0,0,255)
		game.Lighting.ColorShift_Top=Color3.new(0,0,255)
		game.Lighting.OutdoorAmbient=Color3.new(0,0,255)
	elseif message=="normal" and Admin[player.Name] then
		local x=Instance.new("Sound")
		x.SoundId="rbxasset://sounds//short spring sound.wav"
		x.Name="Normal1"
		x.Parent=game.Workspace
		x:play()
		game.Lighting.Ambient=Color3.new(0,0,0)
		game.Lighting.ColorShift_Bottom=Color3.new(0,0,0)
		game.Lighting.ColorShift_Top=Color3.new(0,0,0)
		game.Lighting.OutdoorAmbient=Color3.new(135,135,128)
	elseif message=="pink" and Admin[player.Name] then
		local d=Instance.new("Sound")
		d.SoundId="rbxasset://sounds//short spring sound.wav"
		d.Name="Pink1"
		d.Parent=game.Workspace
		d:play()
		game.Lighting.Ambient=Color3.new(31,0,49)
		game.Lighting.ColorShift_Bottom=Color3.new(31,0,49)
		game.Lighting.ColorShift_Top=Color3.new(31,0,49)
		game.Lighting.OutdoorAmbient=Color3.new(31,0,49)
	elseif message=="orange" and Admin[player.Name] then
		local f=Instance.new("Sound")
		f.SoundId="rbxasset://sounds//short spring sound.wav"
		f.Name="Orange1"
		f.Parent=game.Workspace
		f:play()
		game.Lighting.Ambient=Color3.new(255,85,0)
		game.Lighting.ColorShift_Bottom=Color3.new(255,85,0)
		game.Lighting.ColorShift_Top=Color3.new(255,85,0)
		game.Lighting.OutdoorAmbient=Color3.new(255,85,0)
	elseif message=="influenced" and Admin[player.Name] then
		local e=Instance.new("Sound")
		e.SoundId="http://www.roblox.com/asset/?id=2691586"
		e.Name="TooManyDs1"
		e.Parent=game.Workspace
		e.Pitch=0.1
		local f=Instance.new("Sound")
		f.SoundId="http://www.roblox.com/asset/?id=2801263"
		f.Name="PainedEars"
		f.Parent=game.Workspace
		e:play()
		f:play()
		e.Looped=true
		f.Looped=true
		game.Lighting.Ambient=Color3.new(255,0,0)
		game.Lighting.ColorShift_Bottom=Color3.new(0,255,0)
		game.Lighting.ColorShift_Top=Color3.new(0,255,0)
		game.Lighting.OutdoorAmbient=Color3.new(0,255,0)
		while true do
		wait()
		player.Character.Humanoid.WalkSpeed=6
		game.Lighting.TimeOfDay="21:00:00"
		player.Character:MoveTo(player.Character.Torso.Position +Vector3.new(0,10,0))
		wait(3)
		game.Lighting.TimeOfDay="09:00:00"
		player.Character.Humanoid.WalkSpeed=50
		wait(3)
		player.Character.Humanoid.WalkSpeed=16
		wait(3)
		player.Character.Humanoid.WalkSpeed=120
		player.Character:MoveTo(player.Character.Torso.Position +Vector3.new(0,200,0))
		wait(1)
		game.Lighting.TimeOfDay="17:45:00"
		player.Character.Humanoid.WalkSpeed=10
		wait(1)
		player.Character:MoveTo(player.Character.Torso.Position +Vector3.new(0,100,0))
		player.Character.Humanoid.WalkSpeed=90
		wait(1)
		game.Lighting.TimeOfDay="16:00:00"
		player.Character.Humanoid.WalkSpeed=50
		end end end

game.Players.PlayerAdded:connect(function(player)
    player.Chatted:connect(function(message) onChatted25(message, player) end)end)

function onChatted26(message,player)
	if message=="freeze" and Admin[player.Name] then
		local a=Instance.new("Sound")
		a.SoundId="http://www.roblox.com/asset/?id=11415738"
		a.Name="Frozen"
		a.Parent=game.Workspace
		a:play()
		player.Character.Head.Reflectance=1
		player.Character:findFirstChild("Right Arm").Reflectance=1
		player.Character:findFirstChild("Left Arm").Reflectance=1
		player.Character:findFirstChild("Right Leg").Reflectance=1
		player.Character:findFirstChild("Left Leg").Reflectance=1
		player.Character:findFirstChild("Torso").Reflectance=1
		player.Character.Humanoid.WalkSpeed=0
		player.Character.Humanoid.JumpPower=0
		local character = player.Character
		local animateScript = character.Animate
		animateScript.walk.WalkAnim.AnimationId='http://www.roblox.com/asset/?id=161210451'
		animateScript.idle.Animation1.AnimationId='http://www.roblox.com/asset/?id=161100084'
		animateScript.fall.FallAnim.AnimationId='http://www.roblox.com/asset/?id=165167632'
		animateScript.jump.JumpAnim.AnimationId='http://www.roblox.com/asset/?id=165167557'
	elseif message=="unfreeze" and Admin[player.Name] then
		local b=Instance.new("Sound")
		b.SoundId="http://www.roblox.com/asset/?id=11415738"
		b.Name="FrozenOhWait"
		b.Parent=game.Workspace
		b:play()
		player.Character.Head.Reflectance=0
		player.Character:findFirstChild("Right Arm").Reflectance=0
		player.Character:findFirstChild("Left Arm").Reflectance=0
		player.Character:findFirstChild("Right Leg").Reflectance=0
		player.Character:findFirstChild("Left Leg").Reflectance=0
		player.Character:findFirstChild("Torso").Reflectance=0
		player.Character.Humanoid.WalkSpeed=16
		player.Character.Humanoid.JumpPower=50
		local character=player.Character
		local animateScript=character.Animate
		animateScript.walk.WalkAnim.AnimationId='http://www.roblox.com/asset/?id=180426354'
		animateScript.idle.Animation1.AnimationId='http://www.roblox.com/asset/?id=180435571'
		animateScript.fall.FallAnim.AnimationId='http://www.roblox.com/asset/?id=180436148'
		animateScript.jump.JumpAnim.AnimationId='http://www.roblox.com/asset/?id=125750702'
	end end

game.Players.PlayerAdded:connect(function(player)
    player.Chatted:connect(function(message) onChatted26(message, player) end)end)

function onChatted27(message,player)
	if message=="vampire" and Admin[player.Name] then
		local a=Instance.new("Sound")
		a.SoundId="http://www.roblox.com/asset/?id=94893733"
		a.Name="Vampire"
		a.Parent=game.Workspace
		a:play()
		game.Lighting.TimeOfDay="18:20:00"
		game.Lighting.FogStart=1
		game.Lighting.FogEnd=100
		game.Lighting.FogColor=Color3.new("Crimson")
		player.Character.Humanoid.WalkSpeed=60
		player.Character.Head.BrickColor=BrickColor.new("White")
		player.Character.Head.face.Texture="http://www.roblox.com/asset/?id=20792192"
		player.Character.Shirt.ShirtTemplate="http://www.roblox.com/asset/?id=4718295"
		player.Character.Pants.PantsTemplate="http://www.roblox.com/asset/?id=4700932"
		local a=Instance.new("Fire")
		a.Parent=player.Character.Torso
		a.Color=Color3.new("Really black")
		a.SecondaryColor=Color3.new("Really black")
		a.Size=12
	end end

game.Players.PlayerAdded:connect(function(player)
    player.Chatted:connect(function(message) onChatted27(message, player) end)end)

function onChatted28(message,player)
	if message=="skyrim" and Admin[player.Name] then
		local a=Instance.new("Sound")
		a.SoundId="http://www.roblox.com/asset/?id=131122727"
		a.Name="WarriorsField"
		a.Parent=game.Workspace
		a:play()
		a.Looped=true
		local d=player.Character:GetChildren()	
			for i=1, #d do 
		if (d[i].className == "Hat") then 
			d[i]:remove() 
		if player.Name=="Huminoidjoe" then
		player.Character.Shirt.ShirtTemplate="http://www.roblox.com/asset/?id=118906115"
		player.Character.Pants.PantsTemplate="http://www.roblox.com/asset/?id=118906253"
		local h=Instance.new("Hat") 
		h.Parent=player.Character
		h.AttachmentForward=Vector3.new(0,0,-1) 
		h.AttachmentPos=Vector3.new(0,0.2,0.26) 
		h.AttachmentRight=Vector3.new(1,0,0) 
		h.AttachmentUp=Vector3.new(0,1,0) 
		local a=Instance.new("Part") 
		a.Name="Handle" 
		a.Parent=player.Character.Hat
		local m=Instance.new("SpecialMesh") 
		m.Parent=player.Character.Hat.Handle
		m.Scale=Vector3.new(0.45,0.35,0.35) 
		m.MeshId="http://www.roblox.com/asset/?id=71484385"
		m.TextureId="http://www.roblox.com/asset/?id=71484369"
		M("Captain Huminoid is on the battlefield","6")
	elseif player.Name=="Moderkaka" then
		player.Character.Shirt.ShirtTemplate="http://www.roblox.com/asset/?id=244062697"
		player.Character.Pants.PantsTemplate="http://www.roblox.com/asset/?id=244063420"
		local h=Instance.new("Hat") 
		h.Parent=player.Character
		h.AttachmentForward=Vector3.new(0,0,-1) 
		h.AttachmentPos=Vector3.new(0,0.2,0.26) 
		h.AttachmentRight=Vector3.new(1,0,0) 
		h.AttachmentUp=Vector3.new(0,1,0) 
		local a=Instance.new("Part") 
		a.Name="Handle" 
		a.Parent=player.Character.Hat
		local m=Instance.new("SpecialMesh") 
		m.Parent=player.Character.Hat.Handle 
		m.MeshId="http://www.roblox.com/asset/?id=71484385"
		m.TextureId="http://www.roblox.com/asset/?id=71484369"
		M("Commander Moderkaka is on the battlefield!","6")
	elseif player.Name~="Huminoidjoe" or "Moderkaka" then
		player.Character.Shirt.ShirtTemplate="http://www.roblox.com/asset/?id=256974770"
		player.Character.Pants.PantsTemplate="http://www.roblox.com/asset/?id=256992742"
		local h=Instance.new("Hat") 
		h.Parent=player.Character
		h.AttachmentForward=Vector3.new(0,0,-1) 
		h.AttachmentPos=Vector3.new(0,0.2,0.26) 
		h.AttachmentRight=Vector3.new(1,0,0) 
		h.AttachmentUp=Vector3.new(0,1,0) 
		local a=Instance.new("Part") 
		a.Name="Handle" 
		a.Parent=player.Character.Hat
		local m=Instance.new("SpecialMesh") 
		m.Parent=player.Character.Hat.Handle 
		m.MeshId="http://www.roblox.com/asset/?id=71484385"
		m.TextureId="http://www.roblox.com/asset/?id=71484369"
		M("One of Huminoidjoe's soldiers is on the battlefield!","7")
	end end end end end 

game.Players.PlayerAdded:connect(function(player)
    player.Chatted:connect(function(message) onChatted28(message, player) end)end)

function onChatted29(message,player)
	if message=="ultimaterecall" and Admin[player.Name] then
		local a=Instance.new("Sound")
		a.SoundId="http://www.roblox.com/asset/?id=11415738"
		a.Name="Tingy"
		a.Parent=game.Workspace
		a:play()
		player.Character:findFirstChild("Right Arm").Reflectance=1
		player.Character:findFirstChild("Left Arm").Reflectance=1
		player.Character:findFirstChild("Right Leg").Reflectance=1
		player.Character:findFirstChild("Left Leg").Reflectance=1
		player.Character:findFirstChild("Torso").Reflectance=1
		player.Character.Head.Reflectance=1
		player.Character.Shirt.ShirtTemplate=""
		player.Character.Pants.PantsTemplate=""
		wait(5)
		player:destroy()
	end end

game.Players.PlayerAdded:connect(function(player)
    player.Chatted:connect(function(message) onChatted29(message, player) end)end)

function onChatted30(message,player)
	if message=="info" and Admin[player.Name] then
		M("Thanks for using Huminoidjoe's Admin commands!","6")
		M("These commands will be updated regularly.","5")
		M("Current commands: reset, run, highjump, invisible, shiny, ethereal, ff..","10")
		M("..sparkles, explode, flame, particle, dubstep, rave, morning, night, noon","13")
		M("..zombie, fog, noob, unhint, clearsounds, unmessage, mariomode..","9")
		M("..red, green, blue, normal, pink, influenced, freeze, unfreeze, vampire..","10")
		M("..skyrim, ultimaterecall, info, residualclear, unff, orange, huminmode..","") -- UPDATE PER NEW ITEM
	end end

game.Players.PlayerAdded:connect(function(player)
    player.Chatted:connect(function(message) onChatted30(message, player) end)end)

function onChatted31(message,player)
	if message=="huminmode" and Admin[player.Name] then
		local a=Instance.new("Sound")
		a.SoundId="http://www.roblox.com/asset/?id=1369159"
		a.Name="DingDing"
		a.Parent=game.Workspace
		a:play()
		player.Character.Head.BrickColor=BrickColor.new("Institutional white")
		player.Character:findFirstChild("Right Arm").BrickColor=BrickColor.new("Institutional white")
		player.Character:findFirstChild("Left Arm").BrickColor=BrickColor.new("Institutional white")
		player.Character:findFirstChild("Right Leg").BrickColor=BrickColor.new("Medium blue")
		player.Character:findFirstChild("Left Leg").BrickColor=BrickColor.new("Medium blue")
		player.Character:findFirstChild("Torso").BrickColor=BrickColor.new("Really red")
		player.Character.Shirt.ShirtTemplate=""
		player.Character.Pants.PantsTemplate=""
		local b=Instance.new("Decal")
		b.Texture="http://www.roblox.com/images/shirt.png"
		b.Name="RobloxLogo2"
		b.Parent=player.Character:findFirstChild("Torso")
		local d=player.Character:GetChildren()	
			for i=1, #d do 
		if (d[i].className == "Hat") then 
			d[i]:remove() 
		local h1=Instance.new("Hat")
		h1.Parent=player.Character
		h1.AttachmentForward=Vector3.new(0,0,-1)
		h1.AttachmentPos=Vector3.new(0,-0.1,0.05)
		h1.AttachmentRight=Vector3.new(1,0,0)
		h1.AttachmentUp=Vector3.new(0,1,0)
		local a1=Instance.new("Part")
		a1.Name="Handle"
		a1.Parent=player.Character.Hat
		local m1=Instance.new("SpecialMesh")
		m1.Parent=player.Character.Hat.Handle
		m1.MeshId="http://www.roblox.com/asset/?id=1029012"
		m1.TextureId="http://www.roblox.com/asset/?id=1028814"
			end end end end 

game.Players.PlayerAdded:connect(function(player)
    player.Chatted:connect(function(message) onChatted31(message, player) end)end)

function onChatted32(message,player)
	if message=="hatremove" and Admin[player.Name] then
		local a=Instance.new("Sound")
		a.SoundId="http://www.roblox.com/asset/?id=10721950"
		a.Name="BangBang"
		a.Parent=game.Workspace
		local d=player.Character:GetChildren()	
			for i=1, #d do 
		if (d[i].className == "Hat") then 
			d[i]:remove() 
			M("Hats removed.","4")
end end end end

game.Players.PlayerAdded:connect(function(player)
    player.Chatted:connect(function(message) onChatted32(message, player) end)end)

function onChatted33(message,player)
	if message=="givetophat" and Admin[player.Name] then
		local h=Instance.new("Hat") 
		h.Parent=player.Character
		h.AttachmentForward=Vector3.new(0,0,-1) 
		h.AttachmentPos=Vector3.new(0,-0.27,0) 
		h.AttachmentRight=Vector3.new(1,0,0) 
		h.AttachmentUp=Vector3.new(0,1,0) 
		local a=Instance.new("Part") 
		a.Name="Handle" 
		a.Parent=player.Character.Hat
		local m=Instance.new("SpecialMesh") 
		m.Parent=player.Character.Hat.Handle 
		m.MeshId="http://www.roblox.com/asset/?id=1028713" 
		m.TextureId="http://www.roblox.com/asset/?id=92287391"
	elseif message=="givefedora" and Admin[player.Name] then
		local h1=Instance.new("Hat")
		h1.Parent=player.Character
		h1.AttachmentForward=Vector3.new(0,0,-1)
		h1.AttachmentPos=Vector3.new(0,-0.1,0.05)
		h1.AttachmentRight=Vector3.new(1,0,0)
		h1.AttachmentUp=Vector3.new(0,1,0)
		local a1=Instance.new("Part")
		a1.Name="Handle"
		a1.Parent=player.Character.Hat
		local m1=Instance.new("SpecialMesh")
		m1.Parent=player.Character.Hat.Handle
		m1.MeshId="http://www.roblox.com/asset/?id=1029012"
		m1.TextureId="http://www.roblox.com/asset/?id=31472131"
		end end

game.Players.PlayerAdded:connect(function(player)
    player.Chatted:connect(function(message) onChatted33(message, player) end)end)

function onChatted34(message,player)
	if message=="heal" and Admin[player.Name] then
		player.Character.Humanoid.Health=100
end end

game.Players.PlayerAdded:connect(function(player)
    player.Chatted:connect(function(message) onChatted34(message, player) end)end)

function onChatted35(message,player)
	if message=="newpart" and Admin[player.Name] then
		local a=Instance.new("Sound")
		a.SoundId="rbxasset://sounds\\electronicpingshort.wav"
		a.Name="PewPeww"
		a.Parent=game.Workspace
		a:play()
		local b=Instance.new("Part")
		b.Size=Vector3.new(4,1,2)
		b.Name="Block"
		b.Parent=game.Workspace
		b.Position=player.Character.Head.Position
	end end

game.Players.PlayerAdded:connect(function(player)
    player.Chatted:connect(function(message) onChatted35(message, player) end)end)

function onChatted36(message,player)
	if message=="damage" and Admin[player.Name] then
		player.Character.Humanoid.Health=50
end end

game.Players.PlayerAdded:connect(function(player)
    player.Chatted:connect(function(message) onChatted36(message, player) end)end)

function onChatted37(message,player)
	if message=="blooddeath" and Admin[player.Name] then
		player.Character.Humanoid.Health=50
		wait(0.25)
		player.Character.Humanoid.Health=25
		wait(0.25)
		player.Character.Humanoid.Health=0
		wait(0.15)
		local a=Instance.new("Part")
		a.Size=Vector3.new(0.5,1,1)
		a.Name="Blood1"
		a.Parent=game.Workspace
		a.Position=player.Character.Torso.Position
		a.BrickColor=BrickColor.new(255,0,0)
		wait(0.15)
		local b=Instance.new("Part")
		b.Size=Vector3.new(1,1,1)
		b.Name="Blood2"
		b.Parent=game.Workspace
		b.Position=player.Character.Head.Position
		b.BrickColor=BrickColor.new(255,0,0)
		wait(0.15)
		local c=Instance.new("Part")
		c.Size=Vector3.new(1,1,1)
		c.Name="Blood3"
		c.Parent=game.Workspace
		c.Position=player.Character.Torso.Position
		c.BrickColor=BrickColor.new(255,0,0)
		wait(0.15)
		local d=Instance.new("Part")
		d.Size=Vector3.new(1,1,1)
		d.Name="Blood4"
		d.Parent=game.Workspace
		d.Position=player.Character.Head.Position
		d.BrickColor=BrickColor.new(255,0,0)
		wait(0.15)
		local a1=Instance.new("Part")
		a1.Size=Vector3.new(0.5,1,1)
		a1.Name="Blood1"
		a1.Parent=game.Workspace
		a1.Position=player.Character.Torso.Position
		a1.BrickColor=BrickColor.new(255,0,0)
		wait(0.15)
		local b1=Instance.new("Part")
		b1.Size=Vector3.new(1,1,1)
		b1.Name="Blood2"
		b1.Parent=game.Workspace
		b1.Position=player.Character.Head.Position
		b1.BrickColor=BrickColor.new(255,0,0)
		wait(0.15)
		local c1=Instance.new("Part")
		c1.Size=Vector3.new(1,1,1)
		c1.Name="Blood3"
		c1.Parent=game.Workspace
		c1.Position=player.Character.Torso.Position
		c1.BrickColor=BrickColor.new(255,0,0)
		wait(0.15)
		local d1=Instance.new("Part")
		d1.Size=Vector3.new(1,1,1)
		d1.Name="Blood4"
		d1.Parent=game.Workspace
		d1.Position=player.Character.Head.Position
		d1.BrickColor=BrickColor.new(255,0,0)
		wait(5)
		a:remove()
		b:remove()
		c:remove()
		d:remove()
		a1:remove()
		b1:remove()
		c1:remove()
		d1:remove()
	end
end

game.Players.PlayerAdded:connect(function(player)
    player.Chatted:connect(function(message) onChatted37(message, player) end)end)


