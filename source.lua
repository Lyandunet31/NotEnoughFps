-- Monstrum's Gui to Lua\n-- Version: 3.2

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local TextLabel_2 = Instance.new("TextLabel")
local UICorner = Instance.new("UICorner")
local TextLabel_3 = Instance.new("TextLabel")

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(255, 73, 49)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.316568047, 0, 0.313948095, 0)
Frame.Size = UDim2.new(0, 457, 0, 274)

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.280087531, 0, 0, 0)
TextLabel.Size = UDim2.new(0, 200, 0, 50)
TextLabel.Font = Enum.Font.SourceSansBold
TextLabel.Text = "NOT ENOUGH FPS"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true

TextLabel_2.Parent = Frame
TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.BackgroundTransparency = 1.000
TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_2.BorderSizePixel = 0
TextLabel_2.Position = UDim2.new(0.280087531, 0, 0.354014605, 0)
TextLabel_2.Size = UDim2.new(0, 200, 0, 50)
TextLabel_2.Font = Enum.Font.SourceSansBold
TextLabel_2.Text = "LOADING..."
TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.TextScaled = true
TextLabel_2.TextSize = 14.000
TextLabel_2.TextWrapped = true

UICorner.Parent = Frame

TextLabel_3.Parent = ScreenGui
TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_3.BackgroundTransparency = 1.000
TextLabel_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_3.BorderSizePixel = 0
TextLabel_3.Position = UDim2.new(0.406065077, 0, 0, 0)
TextLabel_3.Size = UDim2.new(0, 200, 0, 50)
TextLabel_3.Visible = false
TextLabel_3.Font = Enum.Font.SourceSansBold
TextLabel_3.Text = "FPS: "
TextLabel_3.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_3.TextScaled = true
TextLabel_3.TextSize = 14.000
TextLabel_3.TextWrapped = true

-- Scripts:

local function DGLL_script() -- Frame.LocalScript 
	local script = Instance.new('LocalScript', Frame)

	wait(2)
	script.Parent.Visible = false
	script.Parent.Parent.TextLabel.Visible = true
end
coroutine.wrap(DGLL_script)()
local function MGFBGYU_script() -- TextLabel_3.LocalScript 
	local script = Instance.new('LocalScript', TextLabel_3)

	local RunService = game:GetService("RunService")
	local textLabel = script.Parent
	
	local fps = 0
	local lastTime = tick()
	local frameCount = 0
	
	RunService.RenderStepped:Connect(function()
		frameCount += 1
		local now = tick()
		if now - lastTime >= 1 then
			fps = frameCount
			frameCount = 0
			lastTime = now
			textLabel.Text = "FPS: " .. tostring(fps)
		end
	end)
	
end
coroutine.wrap(MGFBGYU_script)()
local function VMMJ_script() -- ScreenGui.LocalScript 
	local script = Instance.new('LocalScript', ScreenGui)

	setfpscap(999999999999999999999999999999)
	local RunService = game:GetService("RunService")
	local Workspace = game:GetService("Workspace")
	
	-- SETTINGS
	local BATCH_SIZE = 25 -- number of instances processed per frame
	local deleteMeshes = true -- if true, will delete MeshParts
	
	-- Utility: optimize part
	local function optimizePart(part)
		if part:IsA("BasePart") then
			part.CastShadow = false
			part.Material = Enum.Material.Plastic
			part.Reflectance = 0
			part.TextureID = "" -- for SpecialMesh
		end
	end
	
	-- Async cleanup
	task.spawn(function()
		local allInstances = Workspace:GetDescendants()
		local index = 1
	
		while index <= #allInstances do
			for i = 1, BATCH_SIZE do
				local inst = allInstances[index]
				if not inst then break end
	
				if inst:IsA("MeshPart") and deleteMeshes then
					inst:Destroy()
				elseif inst:IsA("SpecialMesh") and inst.Parent then
					inst:Destroy()
				elseif inst:IsA("BasePart") then
					optimizePart(inst)
				end
	
				index += 1
			end
			RunService.RenderStepped:Wait()
		end
	end)
	
end
coroutine.wrap(VMMJ_script)()
