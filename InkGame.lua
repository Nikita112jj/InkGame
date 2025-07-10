-- ink game full script by Neked (with Tora Script + noclip + всё)
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "InkGameMenu"
gui.ResetOnSpawn = false

local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 220, 0, 280)
main.Position = UDim2.new(0.4,0,0.4,0)
main.BackgroundColor3 = Color3.fromRGB(20,20,20)
main.Active, main.Draggable = true, true
Instance.new("UICorner", main).CornerRadius = UDim.new(0,12)

local title = Instance.new("TextLabel", main)
title.Text = "ink game"
title.Size = UDim2.new(1,0,0,30)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.new(1,1,1)
title.Font = Enum.Font.GothamBold
title.TextSize = 16

local closeB = Instance.new("TextButton", main)
closeB.Text = "✖"
closeB.Size = UDim2.new(0,24,0,24)
closeB.Position = UDim2.new(1,-28,0,4)
closeB.BackgroundColor3 = Color3.fromRGB(50,50,50)
closeB.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", closeB).CornerRadius = UDim.new(1,0)

local minB = Instance.new("TextButton", main)
minB.Text = "_"
minB.Size = UDim2.new(0,24,0,24)
minB.Position = UDim2.new(1,-56,0,4)
minB.BackgroundColor3 = Color3.fromRGB(50,50,50)
minB.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", minB).CornerRadius = UDim.new(1,0)

local playerTab = Instance.new("TextButton", main)
playerTab.Text = "Player"
playerTab.Size = UDim2.new(0.5,0,0,24)
playerTab.Position = UDim2.new(0,0,0,30)
playerTab.BackgroundColor3 = Color3.fromRGB(40,40,40)
playerTab.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", playerTab).CornerRadius = UDim.new(0,6)

local settingsTab = Instance.new("TextButton", main)
settingsTab.Text = "Settings"
settingsTab.Size = UDim2.new(0.5,0,0,24)
settingsTab.Position = UDim2.new(0.5,0,0,30)
settingsTab.BackgroundColor3 = Color3.fromRGB(40,40,40)
settingsTab.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", settingsTab).CornerRadius = UDim.new(0,6)

local playerC = Instance.new("ScrollingFrame", main)
playerC.Size = UDim2.new(1,0,1,-54)
playerC.Position = UDim2.new(0,0,0,54)
playerC.BackgroundTransparency = 1
playerC.CanvasSize = UDim2.new(0,0,0,600)
playerC.ScrollBarThickness = 4

local settingsC = Instance.new("ScrollingFrame", main)
settingsC.Size = UDim2.new(1,0,1,-54)
settingsC.Position = UDim2.new(0,0,0,54)
settingsC.BackgroundTransparency = 1
settingsC.CanvasSize = UDim2.new(0,0,0,300)
settingsC.ScrollBarThickness = 4
settingsC.Visible = false

-- Player side кнопки
local espB = Instance.new("TextButton", playerC)
espB.Text = "ESP: OFF"
espB.Size = UDim2.new(1,-10,0,30)
espB.Position = UDim2.new(0,5,0,5)
espB.BackgroundColor3 = Color3.fromRGB(60,60,60)
espB.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", espB).CornerRadius = UDim.new(0,6)

local hoverB = Instance.new("TextButton", playerC)
hoverB.Text = "Hover: OFF"
hoverB.Position = UDim2.new(0,5,0,40)
hoverB.Size = UDim2.new(1,-10,0,30)
hoverB.BackgroundColor3 = Color3.fromRGB(60,60,60)
hoverB.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", hoverB).CornerRadius = UDim.new(0,6)

local infJumpB = Instance.new("TextButton", playerC)
infJumpB.Text = "Inf Jump: OFF"
infJumpB.Position = UDim2.new(0,5,0,75)
infJumpB.Size = UDim2.new(1,-10,0,30)
infJumpB.BackgroundColor3 = Color3.fromRGB(60,60,60)
infJumpB.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", infJumpB).CornerRadius = UDim.new(0,6)

local boostB = Instance.new("TextButton", playerC)
boostB.Text = "Boost: OFF"
boostB.Position = UDim2.new(0,5,0,110)
boostB.Size = UDim2.new(1,-10,0,30)
boostB.BackgroundColor3 = Color3.fromRGB(60,60,60)
boostB.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", boostB).CornerRadius = UDim.new(0,6)

local noclipB = Instance.new("TextButton", playerC)
noclipB.Text = "Noclip: OFF"
noclipB.Position = UDim2.new(0,5,0,145)
noclipB.Size = UDim2.new(1,-10,0,30)
noclipB.BackgroundColor3 = Color3.fromRGB(60,60,60)
noclipB.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", noclipB).CornerRadius = UDim.new(0,6)

local passB = Instance.new("TextButton", playerC)
passB.Text = "Pass red light green light"
passB.Position = UDim2.new(0,5,0,180)
passB.Size = UDim2.new(1,-10,0,30)
passB.BackgroundColor3 = Color3.fromRGB(60,60,60)
passB.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", passB).CornerRadius = UDim.new(0,6)

local speedBox = Instance.new("TextBox", playerC)
speedBox.Text = "16"
speedBox.Position = UDim2.new(0,5,0,215)
speedBox.Size = UDim2.new(0.6,-10,0,30)
speedBox.BackgroundColor3 = Color3.fromRGB(60,60,60)
speedBox.TextColor3 = Color3.new(1,1,1)
speedBox.Font = Enum.Font.SourceSans
speedBox.TextSize = 16
Instance.new("UICorner", speedBox).CornerRadius = UDim.new(0,6)

local speedConfirm = Instance.new("TextButton", playerC)
speedConfirm.Text = "Confirm"
speedConfirm.Position = UDim2.new(0.6+0.02,0,0,215)
speedConfirm.Size = UDim2.new(0.4,-5,0,30)
speedConfirm.BackgroundColor3 = Color3.fromRGB(0,170,0)
speedConfirm.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", speedConfirm).CornerRadius = UDim.new(0,6)

-- Settings side
local coordLabel = Instance.new("TextLabel", settingsC)
coordLabel.Text = "Coords: X:0 Y:0 Z:0"
coordLabel.Size = UDim2.new(1,-10,0,24)
coordLabel.Position = UDim2.new(0,5,0,5)
coordLabel.BackgroundTransparency = 1
coordLabel.TextColor3 = Color3.new(1,1,1)
coordLabel.Font = Enum.Font.SourceSans
coordLabel.TextSize = 14

local copyB = Instance.new("TextButton", settingsC)
copyB.Text = "Copy"
copyB.Position = UDim2.new(0,5,0,34)
copyB.Size = UDim2.new(1,-10,0,24)
copyB.BackgroundColor3 = Color3.fromRGB(60,60,60)
copyB.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", copyB).CornerRadius = UDim.new(0,6)

local toraB = Instance.new("TextButton", settingsC)
toraB.Text = "Sifi Script"
toraB.Position = UDim2.new(0,5,0,63)
toraB.Size = UDim2.new(1,-10,0,24)
toraB.BackgroundColor3 = Color3.fromRGB(60,60,60)
toraB.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", toraB).CornerRadius = UDim.new(0,6)

-- Надпись о создателе
local creditLabel = Instance.new("TextLabel", settingsC)
creditLabel.Text = "Maked by @neked10 (Username in telegram)"
creditLabel.Position = UDim2.new(0,5,0,93)
creditLabel.Size = UDim2.new(1,-10,0,24)
creditLabel.BackgroundTransparency = 1
creditLabel.TextColor3 = Color3.new(1,1,1)
creditLabel.Font = Enum.Font.SourceSans
creditLabel.TextSize = 14

-- Перевод на русский
local ruB = Instance.new("TextButton", settingsC)
ruB.Text="RU"
ruB.Position=UDim2.new(0,5,0,122)
ruB.Size=UDim2.new(0.5,-7,0,24)
ruB.BackgroundColor3=Color3.fromRGB(60,60,60)
ruB.TextColor3=Color3.new(1,1,1)
Instance.new("UICorner", ruB).CornerRadius=UDim.new(0,6)

local enB = Instance.new("TextButton", settingsC)
enB.Text="EN"
enB.Position=UDim2.new(0.5+0.015,0,0,122)
enB.Size=UDim2.new(0.5,-7,0,24)
enB.BackgroundColor3=Color3.fromRGB(60,60,60)
enB.TextColor3=Color3.new(1,1,1)
Instance.new("UICorner", enB).CornerRadius=UDim.new(0,6)

ruB.MouseButton1Click:Connect(function()
    title.Text="инк игра"
    creditLabel.Text="Сделано @neked10 (юзернейм в телеграмме)"
end)

enB.MouseButton1Click:Connect(function()
    title.Text="ink game"
    creditLabel.Text="Maked by @neked10 (Username in telegram)"
end)

-- Переменные для логики
local collapsed = false
local currentTab = "player"
local espOn, hoverOn, infJumpOn, boostOn, noclipOn = false, false, false, false, false
local espBoxes = {}
local infConn, hoverConn, noclipConn = nil, nil, nil
local lastSpeed = 16

-- Координаты
RunService.RenderStepped:Connect(function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local pos = LocalPlayer.Character.HumanoidRootPart.Position
        coordLabel.Text = ("Coords: X:%.1f Y:%.1f Z:%.1f"):format(pos.X,pos.Y,pos.Z)
    end
end)

-- Copy coords
copyB.MouseButton1Click:Connect(function()
    setclipboard(coordLabel.Text)
end)

-- Вкладки
playerTab.MouseButton1Click:Connect(function()
    currentTab = "player"
    playerC.Visible = true
    settingsC.Visible = false
end)
settingsTab.MouseButton1Click:Connect(function()
    currentTab = "settings"
    playerC.Visible = false
    settingsC.Visible = true
end)

-- Сворачивание
minB.MouseButton1Click:Connect(function()
    collapsed = not collapsed
    if collapsed then
        TweenService:Create(main, TweenInfo.new(0.3), {Size=UDim2.new(0,220,0,30)}):Play()
        playerC.Visible = false
        settingsC.Visible = false
        playerTab.Visible = false
        settingsTab.Visible = false
    else
        TweenService:Create(main, TweenInfo.new(0.3), {Size=UDim2.new(0,220,0,280)}):Play()
        wait(0.3)
        playerTab.Visible = true
        settingsTab.Visible = true
        if currentTab=="player" then
            playerC.Visible=true settingsC.Visible=false
        else
            playerC.Visible=false settingsC.Visible=true
        end
    end
end)

-- Закрыть
closeB.MouseButton1Click:Connect(function() gui.Enabled=false end)

-- ESP логика
espB.MouseButton1Click:Connect(function()
    espOn = not espOn
    espB.Text = espOn and "ESP: ON" or "ESP: OFF"
    for _,p in pairs(Players:GetPlayers()) do
        if p~=LocalPlayer then
            if not espBoxes[p] and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                local box = Instance.new("BoxHandleAdornment", p.Character)
                box.Name="ESPBox"
                box.Adornee=p.Character.HumanoidRootPart
                box.AlwaysOnTop=true
                box.ZIndex=1
                box.Size=Vector3.new(2,3,1)
                box.Color3=Color3.new(1,0,0)
                espBoxes[p]=box
            end
            if espBoxes[p] then
                espBoxes[p].Transparency = espOn and 0 or 1
            end
        end
    end
end)

-- Hover логика
hoverB.MouseButton1Click:Connect(function()
    hoverOn = not hoverOn
    hoverB.Text = hoverOn and "Hover: ON" or "Hover: OFF"
    if hoverOn then
        hoverConn = RunService.Heartbeat:Connect(function()
            local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if hrp then hrp.Velocity = Vector3.new(hrp.Velocity.X,0,hrp.Velocity.Z) end
        end)
    elseif hoverConn then
        hoverConn:Disconnect() hoverConn=nil
    end
end)

-- Inf Jump логика
infJumpB.MouseButton1Click:Connect(function()
    infJumpOn = not infJumpOn
    infJumpB.Text = infJumpOn and "Inf Jump: ON" or "Inf Jump: OFF"
    if infJumpOn then
        infConn = UserInputService.JumpRequest:Connect(function()
            local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if hum then hum:ChangeState(Enum.HumanoidStateType.Jumping) end
        end)
    elseif infConn then
        infConn:Disconnect() infConn=nil
    end
end)

-- Boost (loop speed)
boostB.MouseButton1Click:Connect(function()
    boostOn = not boostOn
    boostB.Text = boostOn and "Boost: ON" or "Boost: OFF"
    if boostOn then
        lastSpeed=60
    else
        lastSpeed=16
    end
end)

-- Speed confirm
speedConfirm.MouseButton1Click:Connect(function()
    local n=tonumber(speedBox.Text)
    if n then
        if n<10 then n=10 elseif n>500 then n=500 end
        lastSpeed=n
    end
end)

-- Loop для WalkSpeed
RunService.Heartbeat:Connect(function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
        LocalPlayer.Character.Humanoid.WalkSpeed=lastSpeed
    end
end)

-- Noclip
noclipB.MouseButton1Click:Connect(function()
    noclipOn = not noclipOn
    noclipB.Text = noclipOn and "Noclip: ON" or "Noclip: OFF"
    if noclipOn then
        noclipConn=RunService.Stepped:Connect(function()
            local char=LocalPlayer.Character
            if char then
                for _,v in pairs(char:GetDescendants()) do
                    if v:IsA("BasePart") then v.CanCollide=false end
                end
            end
        end)
    elseif noclipConn then
        noclipConn:Disconnect() noclipConn=nil
        local char=LocalPlayer.Character
        if char then
            for _,v in pairs(char:GetDescendants()) do
                if v:IsA("BasePart") then v.CanCollide=true end
            end
        end
    end
end)

-- Pass teleport
passB.MouseButton1Click:Connect(function()
    local hrp=LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if hrp then hrp.CFrame=CFrame.new(-49,1024,84) end
end)

-- Sifi Script exec
toraB.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/NysaDanielle/games/refs/heads/main/inkgame.lua"))()
end)
