--[[
	A revised version of the original Admin commands script which was written in January 2017.
	
	Compared to the fragmented format of the original, this version instead features an equally
	obscure "block format". The lack of indentation is also an interesting choice.
--]]

List = {["Dysgenics"] = true, ["Moderkaka"] = true, ["Player1"] = true}
Prefix = "["
Prefix2 = "]"
Banned = {""}
Target = nil

local Swoosh = Instance.new("Sound", game.Workspace)
Swoosh.SoundId = "rbxassetid://134012322"
Swoosh.Looped = false

function FindPlayer(userName)
for _, Player in ipairs(game.Players:GetPlayers()) do
if string.lower(Player.Name) == string.lower(userName) then
return Player
end end end

function AllowAccess(userAdded)
List[userAdded.Name] = userAdded.Name
end

function BanPlayer(userBanned)
userBanned.Parent = nil
Banned[userBanned.Name] = userBanned.Name
end

function CheckBannedList(userJoined)
for _, v in ipairs(Banned) do
if v:lower() == userJoined.Name:lower() then
print("The user "..userJoined.Name.." is banned")
userJoined.Character.Parent = game.Lighting
end end end

game.Players.PlayerAdded:connect(function(userJoined)
userJoined.Chatted:connect(function(Message)
local OriginalCase = Message
Message = string.lower(Message)
if Message:sub(1,6) == Prefix.."kill"..Prefix2 and List[userJoined.Name] then
if Message:sub(7) == "me" then Target = userJoined
else Target = FindPlayer(Message:sub(7))
end
if Target and Target.Character then
if not Target.Character:FindFirstChild("Invincible") then
Target.Character:BreakJoints()
end end
elseif Message:sub(1,4) == Prefix.."ff"..Prefix2 and List[userJoined.Name] then
if Message:sub(5) == "me" then Target = userJoined
else Target = FindPlayer(Message:sub(5))
end
if Target and Target.Character then
local ForceField = Instance.new("ForceField")
ForceField.Parent = Target.Character
end
elseif Message:sub(1,6) == Prefix.."unff"..Prefix2 and List[userJoined.Name] then
if Message:sub(7) == "me" then Target = userJoined
else Target = FindPlayer(Message:sub(7))
end
if Target and Target.Character then
for _, v in ipairs(Target.Character:GetChildren()) do
if v.Name == "ForceField" then
v:Destroy()
end end end
elseif Message:sub(1,6) == Prefix.."heal"..Prefix2 and List[userJoined.Name] then
if Message:sub(7) == "me" then Target = userJoined
else Target = FindPlayer(Message:sub(7))
end
if Target and Target.Character then
Target.Character:FindFirstChild("Humanoid").Health = Target.Character:FindFirstChild("Humanoid").MaxHealth
wait()
end
elseif Message:sub(1,3) == Prefix.."h"..Prefix2 and List[userJoined.Name] then
local Hint = Instance.new("Hint")
Hint.Parent = game.Workspace
Hint.Text = Message:sub(4)
wait(string.len(Message:sub(4))/2)
Hint:Destroy()
elseif Message:sub(1,3) == Prefix.."m"..Prefix2 and List[userJoined.Name] then
local message = Instance.new("Message")
message.Parent = game.Workspace
message.Text = Message:sub(4)
wait(string.len(Message:sub(4))/2)
message:Destroy()
elseif Message:sub(1,9) == Prefix.."explode"..Prefix2 and List[userJoined.Name] then
if Message:sub(10) == "me" then Target = userJoined
else Target = FindPlayer(Message:sub(10))
end
if Target and Target.Character then
local Explosion = Instance.new("Explosion")
Explosion.Parent = game.Workspace
Explosion.Position = Target.Character:FindFirstChild("Torso").Position
Explosion.BlastRadius = 40 ; Explosion.BlastPressure = 60
end
elseif Message:sub(1,8) == Prefix.."punish"..Prefix2 and List[userJoined.Name] then
if Message:sub(9) == "me" then Target = userJoined
else Target = FindPlayer(Message:sub(9))
end
if Target and Target.Character then
Target.Character.Parent = game.Lighting
end
elseif Message:sub(1,10) == Prefix.."unpunish"..Prefix2 and List[userJoined.Name] then
if Message:sub(11) == "me" then Target = userJoined
else Target = FindPlayer(Message:sub(11))
end
if Target and Target.Character then
Target.Character.Parent = game.Workspace
end
elseif Message:sub(1,11) == Prefix.."givetools"..Prefix2 and List[userJoined.Name] then
if Message:sub(12) == "me" then Target = userJoined
else Target = FindPlayer(Message:sub(12))
end
if Target and Target.Character then
local MagicWand = Instance.new("HopperBin", Target.Backpack)
MagicWand.BinType = "Clone"
local Hammer = Instance.new("HopperBin", Target.Backpack)
Hammer.BinType = "Hammer"
end
elseif Message:sub(1,6) == Prefix.."give"..Prefix2 and List[userJoined.Name] then
Target = userJoined
if Target and Target.Character then
local AssetId = Message:sub(7)
local Item = game:GetService("InsertService"):LoadAsset(AssetId)
for _, v in ipairs(Item:GetChildren()) do
v.Parent = Target.Backpack
end end
elseif Message:sub(1,6) == Prefix.."play"..Prefix2 and List[userJoined.Name] then
local AssetId = Message:sub(7)
local Sound = Instance.new("Sound", game.Workspace)
Sound.SoundId = "rbxassetid://"..AssetId
Sound:Play()
elseif Message:sub(1,5) == Prefix.."move" and List[userJoined.Name] then
Target = userJoined
local Move = Message:sub(6,6)
local Axis = {["x"] = true, ["y"] = true, ["z"] = true}
if Axis[Move] then
local Position = Message:sub(8)
if Move == "x" then
Target.Character:MoveTo(Target.Character.Torso.Position + Vector3.new(Position, 0, 0))
elseif Move == "y" then
Target.Character:MoveTo(Target.Character.Torso.Position + Vector3.new(0, Position, 0))
elseif Move == "z" then
Target.Character:MoveTo(Target.Character.Torso.Position + Vector3.new(0, 0, Position))
end 
elseif Move == "]" then
local userTarget = FindPlayer(Message:sub(7))
Target.Character:MoveTo(userTarget.Character.Torso.Position + Vector3.new(0, 10, 0))
end
elseif Message:sub(1,5) == Prefix.."wear" and List[userJoined.Name] then
Target = userJoined
if Target and Target.Character then
local ObjectId = Message:sub(7)
local Item = game:GetService("InsertService"):LoadAsset(ObjectId)
for _, v in ipairs(Item:GetChildren()) do
if v:IsA("Accessory") then
for _, v in ipairs(Target.Character:GetChildren()) do
if v.ClassName == "Accessory" then
v:Destroy()
end end
elseif v:IsA("Shirt") then
for _, v in ipairs(Target.Character:GetChildren()) do
if v.ClassName == "Shirt" then
v:Destroy()
end end
elseif v:IsA("Pants") then
for _, v in ipairs(Target.Character:GetChildren()) do
if v.ClassName == "Pants" then
v:Destroy()
end end end
v.Parent = Target.Character
end end
elseif Message:sub(1,8) == Prefix.."rocket"..Prefix2 and List[userJoined.Name] then
if Message:sub(9) == "me" then Target = userJoined
else Target = FindPlayer(Message:sub(9))
end
if Target and Target.Character then
local Torso = Target.Character:FindFirstChild("Torso")
if Torso then
local Rocket = Instance.new("Part")
Rocket.Size = Vector3.new(1,6,1)
local Weld = Instance.new("Weld")
Weld.Part1 = Torso
Weld.Part0 = Rocket
Weld.C0 = CFrame.new(0,0,-1)
Rocket.Parent = Target.Character
Weld.Parent = Torso
local Mesh = Instance.new("SpecialMesh", Rocket)
Mesh.MeshId = "http://www.roblox.com/asset/?id=101837213"
Mesh.Scale = Vector3.new(2,2,2)
local Force = Instance.new("BodyVelocity", Torso)
Force.P = 8000
Force.Velocity = Vector3.new(0,1000,0)
Force.MaxForce = Vector3.new(6000,6000,6000)
local Flame = Instance.new("Fire", Rocket)
Flame.Size = 20
local BlastAway = Instance.new("Sound", Rocket)
BlastAway.SoundId = "rbxassetid://12222095"
BlastAway.Looped = true
BlastAway:Play()
wait(39)
BlastAway:Destroy() ; Flame:Destroy() ;
local Smoke = Instance.new("Smoke", Rocket)
Smoke.Opacity = 1 ; Smoke.Size = 5 ; Smoke.RiseVelocity = 10 ; Smoke.Color = Color3.new("Really black")
Force:Destroy()
wait(17)
Smoke:Destroy() ; Weld:Destroy() ; Rocket:Destroy() ;
end end
elseif Message:sub(1,7) == Prefix.."admin"..Prefix2 and List[userJoined.Name] then
if Message:sub(8) == "me" then Target = userJoined
else Target = FindPlayer(Message:sub(8))
end
if Target and Target.Character then
AllowAccess(Target)
end
elseif Message:sub(1,10) == Prefix.."sparkles"..Prefix2 and List[userJoined.Name] then
if Message:sub(11) == "me" then Target = userJoined
else Target = FindPlayer(Message:sub(11))
end
if Target and Target.Character then
local Sparkles = Instance.new("Sparkles", Target.Character:FindFirstChild("Torso"))
end
elseif OriginalCase:sub(1,8) == Prefix.."script"..Prefix2 and List[userJoined.Name] then
local Line = OriginalCase:sub(9) -- or string.sub(Message, 9)
local NewScript = script.Script:Clone()
NewScript.Code.Value = Line
NewScript.Disabled = false ; NewScript.Parent = game.Workspace ;
elseif Message:sub(1,9) == Prefix.."notools"..Prefix2 and List[userJoined.Name] then
if Message:sub(10) == "me" then Target = userJoined
else Target = FindPlayer(Message:sub(9))
end
if Target and Target.Character then
for _, v in ipairs(Target.Backpack:GetChildren()) do
if v.ClassName == "HopperBin" then
v:Destroy()
end end end
elseif Message:sub(1,8) == Prefix.."nogear"..Prefix2 and List[userJoined.Name] then
if Message:sub(9) == "me" then Target = userJoined
else Target = FindPlayer(Message:sub(9))
end
if Target and Target.Character then
for _, v in ipairs(Target.Backpack:GetChildren()) do
if v.ClassName == "Tool" then
v:Destroy()
end end end
elseif Message:sub(1,10) == Prefix.."increase"..Prefix2 and List[userJoined.Name] then
if Message:sub(11) == "me" then Target = userJoined
else Target = FindPlayer(Message:sub(11))
end
if Target and Target.Character then
local Leaderstats = Target:FindFirstChild("leaderstats")
if Leaderstats then
for _, v in ipairs(Leaderstats:GetChildren()) do
v.Value = v.Value + 1000
end end end
elseif Message:sub(1,11) == Prefix.."invisible"..Prefix2 and List[userJoined.Name] then
if Message:sub(12) == "me" then Target = userJoined
else Target = FindPlayer(Message:sub(12))
end
if Target and Target.Character then
local Objects = {["Head"] = true, ["Left Arm"] = true, ["Right Arm"] = true, ["Torso"] = true, ["Left Leg"] = true, ["Right Leg"] = true}
for _, v in ipairs(Target.Character:GetChildren()) do
if Objects[v.Name] then
if v.Name == "Head" then
v:FindFirstChild("face").Transparency = 1
end
v.Transparency = 1
elseif v.ClassName == "Accessory" then
v:FindFirstChild("Handle").Transparency = 1
end end end
elseif Message:sub(1,9) == Prefix.."visible"..Prefix2 and List[userJoined.Name] then
if Message:sub(10) == "me" then Target = userJoined
else Target = FindPlayer(Message:sub(10))
end
if Target and Target.Character then
local Objects = {["Head"] = true, ["Left Arm"] = true, ["Right Arm"] = true, ["Torso"] = true, ["Left Leg"] = true, ["Right Leg"] = true}
for _, v in ipairs(Target.Character:GetChildren()) do
if Objects[v.Name] then
if v.Name == "Head" then
v:FindFirstChild("face").Transparency = 0
end
v.Transparency = 0
elseif v.ClassName == "Accessory" then
v:FindFirstChild("Handle").Transparency = 0
end end end
elseif Message:sub(1,7) == Prefix.."shiny"..Prefix2 and List[userJoined.Name] then
if Message:sub(8) == "me" then Target = userJoined
else Target = FindPlayer(Message:sub(8))
end
if Target and Target.Character then
local Objects = {["Head"] = true, ["Left Arm"] = true, ["Right Arm"] = true, ["Torso"] = true, ["Left Leg"] = true, ["Right Leg"] = true}
for _, v in ipairs(Target.Character:GetChildren()) do
if Objects[v.Name] then
v.Reflectance = 1
elseif v.Name == "Shirt" then
ShirtId = v.ShirtTemplate
v.ShirtTemplate = ""
elseif v.Name == "Pants" then
PantsId = v.PantsTemplate
v.PantsTemplate = ""
end end end
elseif Message:sub(1,9) == Prefix.."unshiny"..Prefix2 and List[userJoined.Name] then
if Message:sub(10) == "me" then Target = userJoined
else Target = FindPlayer(Message:sub(10))
end
if Target and Target.Character then
local Objects = {["Head"] = true, ["Left Arm"] = true, ["Right Arm"] = true, ["Torso"] = true, ["Left Leg"] = true, ["Right Leg"] = true}
for _, v in ipairs(Target.Character:GetChildren()) do
if Objects[v.Name] then
v.Reflectance = 0
elseif v.Name == "Shirt" then
v.ShirtTemplate = ShirtId
elseif v.Name == "Pants" then
v.PantsTemplate = PantsId
end end end
elseif Message:sub(1,8) == Prefix.."freeze"..Prefix2 and List[userJoined.Name] then
if Message:sub(9) == "me" then Target = userJoined
else Target = FindPlayer(Message:sub(9))
end
if Target and Target.Character then
Target.Character:FindFirstChild("Animate").Disabled = true
local Humanoid = Target.Character:FindFirstChild("Humanoid")
Humanoid.WalkSpeed = 0 ; Humanoid.JumpPower = 0 ;
end
elseif Message:sub(1,6) == Prefix.."thaw"..Prefix2 and List[userJoined.Name] then
if Message:sub(7) == "me" then Target = userJoined
else Target = FindPlayer(Message:sub(7))
end
if Target and Target.Character then
Target.Character:FindFirstChild("Animate").Disabled = false
local Humanoid = Target.Character:FindFirstChild("Humanoid")
Humanoid.WalkSpeed = 16 ; Humanoid.JumpPower = 50 ;
end
elseif Message:sub(1,6) == Prefix.."kick"..Prefix2 and List[userJoined.Name] then
if Message:sub(7) == "me" then Target = userJoined
else Target = FindPlayer(Message:sub(7))
end
if Target and Target.Character then
Target.CameraMode = "LockFirstPerson"
Target.Character.Parent = nil
end
elseif Message:sub(1,7) == Prefix.."speed"..Prefix2 and List[userJoined.Name] then
Target = userJoined
if Target and Target.Character then
local Speed = Message:sub(8)
Target.Character:FindFirstChild("Humanoid").WalkSpeed = Speed
end
elseif Message:sub(1,6) == Prefix.."jump"..Prefix2 and List[userJoined.Name] then
Target = userJoined
if Target and Target.Character then
local Power = Message:sub(7)
Target.Character:FindFirstChild("Humanoid").JumpPower = Power
end
elseif Message:sub(1,5) == Prefix.."god"..Prefix2 and List[userJoined.Name] then
if Message:sub(6) == "me" then Target = userJoined
else Target = FindPlayer(Message:sub(6))
end
if Target and Target.Character then
Target.Character:FindFirstChild("Humanoid").MaxHealth = math.huge
Target.Character:FindFirstChild("Humanoid").Health = Target.Character:FindFirstChild("Humanoid").MaxHealth
Target.Character:FindFirstChild("Humanoid").WalkSpeed = 40
local PreventBreak = Instance.new("BoolValue", Target.Character)
PreventBreak.Name = "Invincible"
local Tool = game:GetService("InsertService"):LoadAsset(596912927)
for _, v in ipairs(Tool:GetChildren()) do
v.Parent = Target.Backpack
end
while true do
wait()
if Target.Character:FindFirstChild("Humanoid").Health ~= Target.Character:FindFirstChild("Humanoid").MaxHealth then
Target.Character:FindFirstChild("Humanoid").Health = Target.Character:FindFirstChild("Humanoid").MaxHealth
end end end
elseif Message:sub(1,6) == Prefix.."jail"..Prefix2 and List[userJoined.Name] then
if Message:sub(7) == "me" then Target = userJoined
else Target = FindPlayer(Message:sub(7))
end
if Target and Target.Character then
local Cell = Instance.new("Part")
Cell.Shape = "Ball" ; Cell.Size = Vector3.new(10,10,10) ; Cell.TopSurface = "Smooth" ; Cell.BottomSurface = "Smooth" ; Cell.BrickColor = BrickColor.new("Stone") ;
Cell.Transparency = 0.3 ; Cell.Name = "Jail"
Cell.Position = Target.Character:FindFirstChild("Torso").Position
Cell.Parent = Target.Character
local Weld = Instance.new("Weld")
Weld.Part1 = Target.Character:FindFirstChild("Torso")
Weld.Part0 = Cell
Weld.Parent = Target.Character:FindFirstChild("Torso")
Target.Character:FindFirstChild("Humanoid").WalkSpeed = 0
for _, v in ipairs(Target.Backpack:GetChildren()) do
if v.ClassName == "Tool" then
v:Destroy()
end end end
elseif Message:sub(1,9) == Prefix.."release"..Prefix2 and List[userJoined.Name] then
if Message:sub(10) == "me" then Target = userJoined
else Target = FindPlayer(Message:sub(10))
end
if Target and Target.Character then
if Target.Character:FindFirstChild("Jail") then
Target.Character:FindFirstChild("Jail"):Destroy()
Target.Character:FindFirstChild("Humanoid").WalkSpeed = 16
end end
elseif Message:sub(1,5) == Prefix.."sit"..Prefix2 and List[userJoined.Name] then
if Message:sub(6) == "me" then Target = userJoined
else Target = FindPlayer(Message:sub(7))
end
if Target and Target.Character then
Target.Character:FindFirstChild("Humanoid").Sit = true
end
end end)end)