local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local hrp = character:WaitForChild("HumanoidRootPart")

local Window = Rayfield:CreateWindow({
	Name = "Ink Game Script",
	LoadingTitle = "Ink Game Script",
	LoadingSubtitle = "от твоего бро",
	ConfigurationSaving = {
		Enabled = false,
	},
	KeySystem = false,
})

local function updateCharacter()
	character = player.Character or player.CharacterAdded:Wait()
	humanoid = character:WaitForChild("Humanoid")
	hrp = character:WaitForChild("HumanoidRootPart")
end

player.CharacterAdded:Connect(function()
	task.wait(1)
	updateCharacter()
end)

local Tab = Window:CreateTab("Игрок", 4483362458)

-- Буст скорости
local speedLoop = false
Tab:CreateToggle({
	Name = "Буст Скорости",
	CurrentValue = false,
	Callback = function(state)
		speedLoop = state
		if speedLoop then
			task.spawn(function()
				while speedLoop do
					pcall(function()
						humanoid.WalkSpeed = 60
					end)
					task.wait(0.1)
				end
			end)
		else
			pcall(function()
				humanoid.WalkSpeed = 16
			end)
		end
	end,
})

-- Noclip
local noclip = false
local noclipConnection
Tab:CreateToggle({
	Name = "Noclip",
	CurrentValue = false,
	Callback = function(state)
		noclip = state
		if noclip then
			noclipConnection = RunService.Stepped:Connect(function()
				pcall(function()
					for _, part in pairs(character:GetDescendants()) do
						if part:IsA("BasePart") then
							part.CanCollide = false
						end
					end
				end)
			end)
		else
			if noclipConnection then
				noclipConnection:Disconnect()
				noclipConnection = nil
			end
			pcall(function()
				humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
			end)
		end
	end,
})

-- Телепорт вверх
Tab:CreateButton({
	Name = "Телепорт на 100 вверх",
	Callback = function()
		pcall(function()
			hrp.CFrame = hrp.CFrame + Vector3.new(0, 100, 0)
		end)
	end,
})

-- Телепорт вниз
Tab:CreateButton({
	Name = "Телепорт на 40 вниз",
	Callback = function()
		pcall(function()
			hrp.CFrame = hrp.CFrame - Vector3.new(0, 40, 0)
		end)
	end,
})

-- Auto Skip
local skipLoop = false
Tab:CreateToggle({
	Name = "Auto Skip",
	CurrentValue = false,
	Callback = function(state)
		skipLoop = state
		if skipLoop then
			task.spawn(function()
				while skipLoop do
					pcall(function()
						game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("DialogueRemote"):FireServer("Skipped")
					end)
					task.wait(1)
				end
			end)
		end
	end,
})

-- Вкладка Green/Red Light
local RedTab = Window:CreateTab("Green/Red Light", 4483362458)
RedTab:CreateButton({
	Name = "TP To End",
	Callback = function()
		pcall(function()
			hrp.CFrame = CFrame.new(-47.2, 1024.7, 135.8)
		end)
	end,
})

-- Вкладка Dalgona
local DalgonaTab = Window:CreateTab("Dalgona", 4483362458)
DalgonaTab:CreateButton({
	Name = "Auto Cookie",
	Callback = function()
		pcall(function()
			local args = {{ Completed = true }}
			game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("DALGONATEMPREMPTE"):FireServer(unpack(args))
		end)
	end,
})
