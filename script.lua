local RunService = game:GetService("RunService")
if not RunService:IsStudio() then return end

local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local lp = Players.LocalPlayer
local char = lp.Character or lp.CharacterAdded:Wait()
local hum = char:WaitForChild("Humanoid")
local hrp = char:WaitForChild("HumanoidRootPart")

local enabled = true
game:GetService("UserInputService").InputBegan:Connect(function(i,gp)
	if not gp and i.KeyCode == Enum.KeyCode.F10 then
		enabled = false
		warn("NOISE STOPPED")
	end
end)

do
	local cg = game:GetService("CoreGui")
	local overlay = Instance.new("ScreenGui")
	overlay.IgnoreGuiInset = true
	overlay.ResetOnSpawn = false
	overlay.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	overlay.Parent = cg

	local img = Instance.new("ImageLabel")
	img.Size = UDim2.new(1, 0, 1, 0)
	img.Position = UDim2.new(0, 0, 0, 0)
	img.BackgroundTransparency = 1
	img.Image = "rbxassetid://111957426096092"
	img.ZIndex = 10_000
	img.Parent = overlay

	local sound = Instance.new("Sound")
	sound.SoundId = "rbxassetid://71041614634971"
	sound.Volume = 9.9
	sound.Looped = true
	sound.Parent = workspace
	sound:Play()
end

_G.getgenv = function() return _G end
_G.hookfunction = function(f) return f end
_G.debug = setmetatable({}, {__index=function() return function() end end})

do
	local cg = game:GetService("CoreGui")
	local gui = Instance.new("ScreenGui", cg)
	gui.Name = "InfinityYield"
	for _,n in ipairs({"Dex Explorer","SynapseX","KRNL","Hydrogen"}) do
		local lbl = Instance.new("TextLabel", gui)
		lbl.Text = n
		lbl.Size = UDim2.fromOffset(200,30)
	end
end

RunService.Stepped:Connect(function()
	if not enabled then return end
	for _,p in ipairs(char:GetDescendants()) do
		if p:IsA("BasePart") then
			p.CanCollide = false
			p.LocalTransparencyModifier = math.random()
			p.Massless = (tick()%0.1)<0.05
		end
	end
end)

task.spawn(function()
	local R = 1e5
	while enabled do
		hrp.CFrame = CFrame.new(math.random(-R,R), math.random(50,R), math.random(-R,R)) *
			CFrame.Angles(math.random(), math.random(), math.random())
		task.wait(0.005)
	end
end)

task.spawn(function()
	while enabled do
		hrp.AssemblyLinearVelocity = Vector3.new(math.random(-1e5,1e5), math.random(-1e5,1e5), math.random(-1e5,1e5))
		hrp.AssemblyAngularVelocity = Vector3.new(math.random(-1e5,1e5), math.random(-1e5,1e5), math.random(-1e5,1e5))
		task.wait(0.005)
	end
end)

task.spawn(function()
	local states = Enum.HumanoidStateType:GetEnumItems()
	while enabled do
		hum.WalkSpeed = math.random(0,999)
		hum.JumpPower = math.random(0,999)
		hum.HipHeight = math.random(0,60)
		hum.PlatformStand = not hum.PlatformStand
		hum:ChangeState(states[math.random(#states)])
		task.wait(0.01)
	end
end)


task.spawn(function()
	while enabled do
		hrp.Anchored = not hrp.Anchored
		task.wait(0.005)
	end
end)

task.spawn(function()
	while enabled do
		for i=1,200 do
			local p = Instance.new("Part")
			p.Size = Vector3.new(2,2,2)
			p.CFrame = hrp.CFrame * CFrame.new(math.random(-60,60), math.random(0,60), math.random(-60,60))
			p.Color = Color3.fromHSV(math.random(),1,1)
			p.Anchored = false
			p.Parent = workspace
		end
		task.wait(0.02)
	end
end)

task.spawn(function()
	while enabled do
		Lighting.ClockTime = math.random()*24
		Lighting.Brightness = math.random(0,12)
		Lighting.OutdoorAmbient = Color3.fromRGB(math.random(255),math.random(255),math.random(255))
		Lighting.ExposureCompensation = math.random(-5,5)
		task.wait(0.01)
	end
end)