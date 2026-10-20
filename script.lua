-- ============================================
-- MANUL HUB - MOBILE EDITION v1.5
-- ============================================

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local playerGui = player:WaitForChild("PlayerGui")

local SETTINGS = {
    AIMBOT_ENABLED = false,
    AIMBOT_ACTIVE = false,
    AIMBOT_FOV = 150,
    AIMBOT_SMOOTH = 1.0,
    AIMBOT_TEAM_CHECK = true,
    AIMBOT_WALL_CHECK = true,
    AIMBOT_SHOW_FOV = false,
    
    ESP_ENABLED = false,
    ESP_ENEMIES = true,
    ESP_TEAM = false,
    ESP_NAMES = true,
    ESP_ENEMY_COLOR = Color3.fromRGB(255, 0, 0),
    ESP_TEAM_COLOR = Color3.fromRGB(0, 255, 0),
}

local gui = Instance.new("ScreenGui")
gui.Name = "ManulMobile"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.Parent = playerGui

local circleBtn = Instance.new("TextButton")
circleBtn.Size = UDim2.fromOffset(50, 50)
circleBtn.Position = UDim2.new(0, 15, 0, 100)
circleBtn.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
circleBtn.Text = "M"
circleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
circleBtn.Font = Enum.Font.GothamBold
circleBtn.TextSize = 22
circleBtn.AutoButtonColor = false
circleBtn.ZIndex = 10
circleBtn.Active = true
circleBtn.Draggable = true
circleBtn.Parent = gui

local circleCorner = Instance.new("UICorner")
circleCorner.CornerRadius = UDim.new(1, 0)
circleCorner.Parent = circleBtn

local circleStroke = Instance.new("UIStroke")
circleStroke.Color = Color3.fromRGB(0, 220, 90)
circleStroke.Thickness = 2
circleStroke.Parent = circleBtn

local menuFrame = Instance.new("Frame")
menuFrame.Size = UDim2.fromScale(0.4, 0.4)
menuFrame.Position = UDim2.fromScale(0.3, 0.3)
menuFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
menuFrame.BorderSizePixel = 0
menuFrame.Visible = false
menuFrame.Active = true
menuFrame.Draggable = true
menuFrame.ZIndex = 5
menuFrame.Parent = gui

local menuCorner = Instance.new("UICorner")
menuCorner.CornerRadius = UDim.new(0, 10)
menuCorner.Parent = menuFrame

local menuStroke = Instance.new("UIStroke")
menuStroke.Color = Color3.fromRGB(0, 220, 90)
menuStroke.Thickness = 2
menuStroke.Parent = menuFrame

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -100, 0, 30)
title.Position = UDim2.fromOffset(15, 10)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.Text = "Manul Hub"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 16
title.TextXAlignment = Enum.TextXAlignment.Left
title.ZIndex = 6
title.Parent = menuFrame

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.fromOffset(30, 30)
closeBtn.Position = UDim2.new(1, -40, 0, 10)
closeBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
closeBtn.Text = "×"
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 24
closeBtn.ZIndex = 20
closeBtn.Parent = menuFrame

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 6)
closeCorner.Parent = closeBtn

local resizeBtn = Instance.new("TextButton")
resizeBtn.Size = UDim2.fromOffset(20, 20)
resizeBtn.Position = UDim2.new(1, -20, 1, -20)
resizeBtn.BackgroundColor3 = Color3.fromRGB(0, 220, 90)
resizeBtn.Text = ""
resizeBtn.ZIndex = 9
resizeBtn.Parent = menuFrame

local resizeCorner = Instance.new("UICorner")
resizeCorner.CornerRadius = UDim.new(0, 4)
resizeCorner.Parent = resizeBtn

local sidebar = Instance.new("Frame")
sidebar.Size = UDim2.new(0, 100, 1, 0)
sidebar.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
sidebar.BorderSizePixel = 0
sidebar.ZIndex = 6
sidebar.Parent = menuFrame

local sideCorner = Instance.new("UICorner")
sideCorner.CornerRadius = UDim.new(0, 10)
sideCorner.Parent = sidebar

local aimTab = Instance.new("TextButton")
aimTab.Size = UDim2.new(1, -10, 0, 35)
aimTab.Position = UDim2.new(0, 5, 0, 50)
aimTab.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
aimTab.Text = "Aimbot"
aimTab.TextColor3 = Color3.fromRGB(255, 255, 255)
aimTab.Font = Enum.Font.GothamBold
aimTab.TextSize = 13
aimTab.ZIndex = 7
aimTab.Parent = sidebar

local aimTabCorner = Instance.new("UICorner")
aimTabCorner.CornerRadius = UDim.new(0, 6)
aimTabCorner.Parent = aimTab

local espTab = Instance.new("TextButton")
espTab.Size = UDim2.new(1, -10, 0, 35)
espTab.Position = UDim2.new(0, 5, 0, 90)
espTab.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
espTab.Text = "ESP"
espTab.TextColor3 = Color3.fromRGB(255, 255, 255)
espTab.Font = Enum.Font.GothamBold
espTab.TextSize = 13
espTab.ZIndex = 7
espTab.Parent = sidebar

local espTabCorner = Instance.new("UICorner")
espTabCorner.CornerRadius = UDim.new(0, 6)
espTabCorner.Parent = espTab

local aimContent = Instance.new("Frame")
aimContent.Size = UDim2.new(1, -110, 1, -10)
aimContent.Position = UDim2.new(0, 105, 0, 5)
aimContent.BackgroundTransparency = 1
aimContent.ZIndex = 7
aimContent.Parent = menuFrame

local aimBtn = Instance.new("TextButton")
aimBtn.Size = UDim2.new(1, 0, 0, 35)
aimBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
aimBtn.Text = "Aimbot: OFF"
aimBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
aimBtn.Font = Enum.Font.GothamBold
aimBtn.TextSize = 12
aimBtn.ZIndex = 8
aimBtn.Parent = aimContent

local aimBtnCorner = Instance.new("UICorner")
aimBtnCorner.CornerRadius = UDim.new(0, 6)
aimBtnCorner.Parent = aimBtn

local fovLabel = Instance.new("TextLabel")
fovLabel.Size = UDim2.new(1, 0, 0, 20)
fovLabel.Position = UDim2.new(0, 0, 0, 45)
fovLabel.BackgroundTransparency = 1
fovLabel.Font = Enum.Font.GothamBold
fovLabel.Text = "FOV: " .. SETTINGS.AIMBOT_FOV
fovLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
fovLabel.TextSize = 12
fovLabel.TextXAlignment = Enum.TextXAlignment.Left
fovLabel.ZIndex = 8
fovLabel.Parent = aimContent

local fovSliderBg = Instance.new("Frame")
fovSliderBg.Size = UDim2.new(1, -10, 0, 6)
fovSliderBg.Position = UDim2.new(0, 5, 0, 70)
fovSliderBg.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
fovSliderBg.BorderSizePixel = 0
fovSliderBg.ZIndex = 8
fovSliderBg.Parent = aimContent

local fovSliderBgCorner = Instance.new("UICorner")
fovSliderBgCorner.CornerRadius = UDim.new(1, 0)
fovSliderBgCorner.Parent = fovSliderBg

local fovSliderFill = Instance.new("Frame")
fovSliderFill.Size = UDim2.new((SETTINGS.AIMBOT_FOV - 50) / 450, 0, 1, 0)
fovSliderFill.BackgroundColor3 = Color3.fromRGB(0, 220, 90)
fovSliderFill.BorderSizePixel = 0
fovSliderFill.ZIndex = 9
fovSliderFill.Parent = fovSliderBg

local fovSliderFillCorner = Instance.new("UICorner")
fovSliderFillCorner.CornerRadius = UDim.new(1, 0)
fovSliderFillCorner.Parent = fovSliderFill

local fovSliderBtn = Instance.new("TextButton")
fovSliderBtn.Size = UDim2.fromOffset(20, 20)
fovSliderBtn.Position = UDim2.new((SETTINGS.AIMBOT_FOV - 50) / 450, -10, 0.5, -10)
fovSliderBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
fovSliderBtn.Text = ""
fovSliderBtn.ZIndex = 10
fovSliderBtn.Parent = fovSliderBg

local fovSliderBtnCorner = Instance.new("UICorner")
fovSliderBtnCorner.CornerRadius = UDim.new(1, 0)
fovSliderBtnCorner.Parent = fovSliderBtn

local draggingFov = false
local sliderStart = nil
local startFov = nil

fovSliderBtn.MouseButton1Down:Connect(function()
    draggingFov = true
    sliderStart = UserInputService:GetMouseLocation().X
    startFov = (SETTINGS.AIMBOT_FOV - 50) / 450
end)

UserInputService.InputChanged:Connect(function(input)
    if draggingFov and (input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseMovement) then
        local delta = (input.Position.X - sliderStart) / (fovSliderBg.AbsoluteSize.X)
        local newPercent = math.clamp(startFov + delta, 0, 1)
        SETTINGS.AIMBOT_FOV = math.floor(50 + (newPercent * 450))
        
        fovSliderBtn.Position = UDim2.new(newPercent, -10, 0.5, -10)
        fovSliderFill.Size = UDim2.new(newPercent, 0, 1, 0)
        fovLabel.Text = "FOV: " .. SETTINGS.AIMBOT_FOV
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
        draggingFov = false
    end
end)

local showFovBtn = Instance.new("TextButton")
showFovBtn.Size = UDim2.new(1, 0, 0, 30)
showFovBtn.Position = UDim2.new(0, 0, 0, 90)
showFovBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
showFovBtn.Text = "Show FOV: OFF"
showFovBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
showFovBtn.Font = Enum.Font.GothamBold
showFovBtn.TextSize = 12
showFovBtn.ZIndex = 8
showFovBtn.Parent = aimContent

local showFovCorner = Instance.new("UICorner")
showFovCorner.CornerRadius = UDim.new(0, 6)
showFovCorner.Parent = showFovBtn

local teamCheckBtn = Instance.new("TextButton")
teamCheckBtn.Size = UDim2.new(1, 0, 0, 30)
teamCheckBtn.Position = UDim2.new(0, 0, 0, 125)
teamCheckBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
teamCheckBtn.Text = "Team Check: ON"
teamCheckBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
teamCheckBtn.Font = Enum.Font.GothamBold
teamCheckBtn.TextSize = 12
teamCheckBtn.ZIndex = 8
teamCheckBtn.Parent = aimContent

local teamCheckCorner = Instance.new("UICorner")
teamCheckCorner.CornerRadius = UDim.new(0, 6)
teamCheckCorner.Parent = teamCheckBtn

local wallCheckBtn = Instance.new("TextButton")
wallCheckBtn.Size = UDim2.new(1, 0, 0, 30)
wallCheckBtn.Position = UDim2.new(0, 0, 0, 160)
wallCheckBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
wallCheckBtn.Text = "Wall Check: ON"
wallCheckBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
wallCheckBtn.Font = Enum.Font.GothamBold
wallCheckBtn.TextSize = 12
wallCheckBtn.ZIndex = 8
wallCheckBtn.Parent = aimContent

local wallCheckCorner = Instance.new("UICorner")
wallCheckCorner.CornerRadius = UDim.new(0, 6)
wallCheckCorner.Parent = wallCheckBtn

local smoothBtn = Instance.new("TextButton")
smoothBtn.Size = UDim2.new(1, 0, 0, 30)
smoothBtn.Position = UDim2.new(0, 0, 0, 195)
smoothBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
smoothBtn.Text = "Smooth: 1.0 (Fast)" 
smoothBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
smoothBtn.Font = Enum.Font.GothamBold
smoothBtn.TextSize = 12
smoothBtn.ZIndex = 8
smoothBtn.Parent = aimContent

local smoothCorner = Instance.new("UICorner")
smoothCorner.CornerRadius = UDim.new(0, 6)
smoothCorner.Parent = smoothBtn

local espContent = Instance.new("Frame")
espContent.Size = UDim2.new(1, -110, 1, -10)
espContent.Position = UDim2.new(0, 105, 0, 5)
espContent.BackgroundTransparency = 1
espContent.Visible = false
espContent.ZIndex = 7
espContent.Parent = menuFrame

local espBtn = Instance.new("TextButton")
espBtn.Size = UDim2.new(1, 0, 0, 35)
espBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
espBtn.Text = "ESP: OFF"
espBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
espBtn.Font = Enum.Font.GothamBold
espBtn.TextSize = 12
espBtn.ZIndex = 8
espBtn.Parent = espContent

local espBtnCorner = Instance.new("UICorner")
espBtnCorner.CornerRadius = UDim.new(0, 6)
espBtnCorner.Parent = espBtn

local espEnemiesBtn = Instance.new("TextButton")
espEnemiesBtn.Size = UDim2.new(1, 0, 0, 30)
espEnemiesBtn.Position = UDim2.new(0, 0, 0, 45)
espEnemiesBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
espEnemiesBtn.Text = "ESP Enemies: ON"
espEnemiesBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
espEnemiesBtn.Font = Enum.Font.GothamBold
espEnemiesBtn.TextSize = 12
espEnemiesBtn.ZIndex = 8
espEnemiesBtn.Parent = espContent

local espEnemiesCorner = Instance.new("UICorner")
espEnemiesCorner.CornerRadius = UDim.new(0, 6)
espEnemiesCorner.Parent = espEnemiesBtn

local espTeamBtn = Instance.new("TextButton")
espTeamBtn.Size = UDim2.new(1, 0, 0, 30)
espTeamBtn.Position = UDim2.new(0, 0, 0, 80)
espTeamBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
espTeamBtn.Text = "ESP Team: OFF"
espTeamBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
espTeamBtn.Font = Enum.Font.GothamBold
espTeamBtn.TextSize = 12
espTeamBtn.ZIndex = 8
espTeamBtn.Parent = espContent

local espTeamCorner = Instance.new("UICorner")
espTeamCorner.CornerRadius = UDim.new(0, 6)
espTeamCorner.Parent = espTeamBtn

local espNamesBtn = Instance.new("TextButton")
espNamesBtn.Size = UDim2.new(1, 0, 0, 30)
espNamesBtn.Position = UDim2.new(0, 0, 0, 115)
espNamesBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
espNamesBtn.Text = "Names & Dist: ON"
espNamesBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
espNamesBtn.Font = Enum.Font.GothamBold
espNamesBtn.TextSize = 12
espNamesBtn.ZIndex = 8
espNamesBtn.Parent = espContent

local espNamesCorner = Instance.new("UICorner")
espNamesCorner.CornerRadius = UDim.new(0, 6)
espNamesCorner.Parent = espNamesBtn

local enemyColorBtn = Instance.new("TextButton")
enemyColorBtn.Size = UDim2.new(1, 0, 0, 30)
enemyColorBtn.Position = UDim2.new(0, 0, 0, 150)
enemyColorBtn.BackgroundColor3 = SETTINGS.ESP_ENEMY_COLOR
enemyColorBtn.Text = "Enemies Color"
enemyColorBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
enemyColorBtn.Font = Enum.Font.GothamBold
enemyColorBtn.TextSize = 12
enemyColorBtn.ZIndex = 8
enemyColorBtn.Parent = espContent

local enemyColorCorner = Instance.new("UICorner")
enemyColorCorner.CornerRadius = UDim.new(0, 6)
enemyColorCorner.Parent = enemyColorBtn

local teamColorBtn = Instance.new("TextButton")
teamColorBtn.Size = UDim2.new(1, 0, 0, 30)
teamColorBtn.Position = UDim2.new(0, 0, 0, 185)
teamColorBtn.BackgroundColor3 = SETTINGS.ESP_TEAM_COLOR
teamColorBtn.Text = "Team Color"
teamColorBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
teamColorBtn.Font = Enum.Font.GothamBold
teamColorBtn.TextSize = 12
teamColorBtn.ZIndex = 8
teamColorBtn.Parent = espContent

local teamColorCorner = Instance.new("UICorner")
teamColorCorner.CornerRadius = UDim.new(0, 6)
teamColorCorner.Parent = teamColorBtn

local fovCircle = Instance.new("Frame")
fovCircle.Size = UDim2.fromOffset(SETTINGS.AIMBOT_FOV, SETTINGS.AIMBOT_FOV)
fovCircle.Position = UDim2.new(0.5, -SETTINGS.AIMBOT_FOV/2, 0.5, -SETTINGS.AIMBOT_FOV/2)
fovCircle.BackgroundTransparency = 1
fovCircle.BorderSizePixel = 0
fovCircle.Visible = false
fovCircle.ZIndex = 1
fovCircle.Parent = gui

local fovCircleCorner = Instance.new("UICorner")
fovCircleCorner.CornerRadius = UDim.new(1, 0)
fovCircleCorner.Parent = fovCircle

local fovCircleStroke = Instance.new("UIStroke")
fovCircleStroke.Color = Color3.fromRGB(255, 255, 255)
fovCircleStroke.Thickness = 2
fovCircleStroke.Transparency = 0.5
fovCircleStroke.Parent = fovCircle

local aimHoldBtn = Instance.new("TextButton")
aimHoldBtn.Size = UDim2.fromOffset(60, 60)
aimHoldBtn.Position = UDim2.new(1, -80, 0.5, -30)
aimHoldBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
aimHoldBtn.Text = "🎯"
aimHoldBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
aimHoldBtn.Font = Enum.Font.GothamBold
aimHoldBtn.TextSize = 30
aimHoldBtn.AutoButtonColor = false
aimHoldBtn.ZIndex = 20
aimHoldBtn.Active = true
aimHoldBtn.Draggable = true
aimHoldBtn.Visible = false
aimHoldBtn.Parent = gui

local aimBtnCorner = Instance.new("UICorner")
aimBtnCorner.CornerRadius = UDim.new(1, 0)
aimBtnCorner.Parent = aimHoldBtn

local aimStroke = Instance.new("UIStroke")
aimStroke.Color = Color3.fromRGB(255, 255, 255)
aimStroke.Thickness = 2
aimStroke.Parent = aimHoldBtn

aimHoldBtn.MouseButton1Click:Connect(function()
    SETTINGS.AIMBOT_ACTIVE = not SETTINGS.AIMBOT_ACTIVE
    if SETTINGS.AIMBOT_ACTIVE then
        aimHoldBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    else
        aimHoldBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
    end
end)

local function getTeamStatus(p)
    if not p.Team or not player.Team then return "enemy" end
    if p.Team == player.Team then return "team" end
    return "enemy"
end

local function isVisible(p)
    if not SETTINGS.AIMBOT_WALL_CHECK then return true end
    local char = p.Character
    if not char then return false end
    local head = char:FindFirstChild("Head")
    if not head then return false end
    local origin = Camera.CFrame.Position
    local direction = (head.Position - origin).Unit
    local ray = Ray.new(origin, direction * (head.Position - origin).Magnitude)
    local hit = workspace:FindPartOnRayWithIgnoreList(ray, {player.Character, Camera})
    return hit and (hit == head or hit.Parent == char)
end

local function getClosestTarget()
    local closest = nil
    local shortestDist = SETTINGS.AIMBOT_FOV
    local screenCenter = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
    
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= player and p.Character and p.Character:FindFirstChild("Head") then
            local teamStatus = getTeamStatus(p)
            if teamStatus == "team" and SETTINGS.AIMBOT_TEAM_CHECK then continue end

            if isVisible(p) then
                local screenPos, onScreen = Camera:WorldToScreenPoint(p.Character.Head.Position)
                if onScreen then
                    local dist = (Vector2.new(screenPos.X, screenPos.Y) - screenCenter).Magnitude
                    if dist < shortestDist then
                        shortestDist = dist
                        closest = p
                    end
                end
            end
        end
    end
    return closest
end

local espObjects = {}

local function createESP(character, color, pName)
    if not character or not character:FindFirstChild("HumanoidRootPart") then return end
    if espObjects[character] then espObjects[character]:Destroy() end
    
    local box = Instance.new("BoxHandleAdornment")
    box.Name = "ESP_Box"
    box.Size = Vector3.new(4, 6, 2)
    box.Adornee = character.HumanoidRootPart
    box.AlwaysOnTop = true
    box.ZIndex = 5
    box.Transparency = 0.5
    box.Color3 = color
    box.Parent = character.HumanoidRootPart
    
    local bGui = Instance.new("BillboardGui")
    bGui.Name = "ESP_Name"
    bGui.Size = UDim2.new(0, 100, 0, 30)
    bGui.StudsOffset = Vector3.new(0, 3, 0)
    bGui.AlwaysOnTop = true
    bGui.Adornee = character.Head
    bGui.Parent = character.Head
    
    local text = Instance.new("TextLabel")
    text.Size = UDim2.new(1, 0, 1, 0)
    text.BackgroundTransparency = 1
    text.TextColor3 = color
    text.TextStrokeTransparency = 0
    text.Font = Enum.Font.GothamBold
    text.TextSize = 12
    text.Parent = bGui
    
    espObjects[character] = {box = box, gui = bGui, label = text, playerName = pName}
end

local function updateESP()
    if not SETTINGS.ESP_ENABLED then
        for _, obj in pairs(espObjects) do 
            if obj.box then obj.box:Destroy() end
            if obj.gui then obj.gui:Destroy() end
        end
        espObjects = {}
        return
    end
    
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= player and p.Character then
            local teamStatus = getTeamStatus(p)
            local show = false
            local color = SETTINGS.ESP_ENEMY_COLOR
            
            if teamStatus == "team" and SETTINGS.ESP_TEAM then
                show = true
                color = SETTINGS.ESP_TEAM_COLOR
            elseif teamStatus == "enemy" and SETTINGS.ESP_ENEMIES then
                show = true
                color = SETTINGS.ESP_ENEMY_COLOR
            end

            if show then
                if not espObjects[p.Character] then
                    createESP(p.Character, color, p.Name)
                else
                    espObjects[p.Character].box.Color3 = color
                    espObjects[p.Character].label.TextColor3 = color
                end
                
                local obj = espObjects[p.Character]
                if obj and obj.label then
                    if SETTINGS.ESP_NAMES then
                        local dist = math.floor((player.Character.HumanoidRootPart.Position - p.Character.HumanoidRootPart.Position).Magnitude)
                        obj.label.Text = p.Name .. " [" .. dist .. "m]"
                        obj.gui.Enabled = true
                    else
                        obj.gui.Enabled = false
                    end
       