---> Nihility Hub | Rainbow Friends <---

---> Settings <---
local GameName = "Rainbow Friends"
local TabName = "Main"
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
getgenv().antiAFK = false
getgenv().FullBright = false
getgenv().NoClip = false
getgenv().PlayerESP = false
getgenv().AutoWin = false

---> Misc Settings <---
local AAFKToggle = true
local NCToggle = true
local FBToggle = true
local PESPToggle = true


---> Create The GUI <---
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()
local Window = Rayfield:CreateWindow({
   Name = "Nihility Hub | ".. GameName,
   LoadingTitle = "Nihility Hub",
   LoadingSubtitle = GameName,
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "Nihility Hub",
      FileName = GameName
   },
   Discord = {
      Enabled = true,
      Invite = "bRRdvBDhup",
      RememberJoins = true
   },
   KeySystem = false,
   KeySettings = {
      Title = "Sirius Hub",
      Subtitle = "Key System",
      Note = "Join the discord (discord.gg/sirius)",
      FileName = "SiriusKey",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = "Hello"
   }
})

local Tab = Window:CreateTab(TabName, 4483362458)
local Tab2 = Window:CreateTab("Misc", 4483362458)

---> Main Tab <---

---> Auto Win <---
local AutoWinToggle = Tab:CreateToggle({
    Name = "Auto Win",
    CurrentValue = false,
    Flag = "AutoWin",
    Callback = function(Value)
        AutoWin = Value
        spawn(function()
            while AutoWin do
                wait()
                for _, child in pairs(workspace:GetChildren()) do
                    if child.Name:match("Block") or child.Name:match("Food") or child.Name:match("Fuse") or child.Name:match("Battery") then
                        if child:FindFirstChild("TouchTrigger") then
                            firetouchinterest(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart, child.TouchTrigger, 1)
                            wait()
                            firetouchinterest(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart, child.TouchTrigger, 0)
                            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").GroupBuildStructures:GetChildren()[1].Trigger.CFrame
                        else
                            firetouchinterest(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart, child, 1)
                            wait()
                            firetouchinterest(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart, child, 0)
                            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").GroupBuildStructures:GetChildren()[1].Trigger.CFrame
                        end
                    end
                end
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").GroupBuildStructures:GetChildren()[1].Trigger.CFrame
            end
        end)
    end,
})

---> ESP Section <---
local Label = Tab:CreateLabel("ESP")

local MESPToggle = Tab:CreateToggle({
    Name = "Monster ESP",
    CurrentValue = false,
    Flag = "MESP",
    Callback = function(Value)
        MonsterESP = Value
        spawn(function()
            while MonsterESP do
                wait()
                for _, child in pairs(workspace.Monsters:GetChildren()) do
                    if not child:FindFirstChild("ESP") then
                        local ESP = Instance.new("Highlight")
                        ESP.Name = "ESP"
                        ESP.Parent = child
                    end
                end
            end
            for _, child in pairs(workspace.Monsters:GetChildren()) do
                if child:FindFirstChild("ESP") then
                    child:FindFirstChild("ESP"):Destroy()
                end
            end
        end)
    end,
})

local IESPToggle = Tab:CreateToggle({
    Name = "Item ESP",
    CurrentValue = false,
    Flag = "IESP",
    Callback = function(Value)
        ItemESP = Value
        spawn(function()
            while ItemESP do
                wait()
                for _, child in pairs(workspace:GetChildren()) do
                    if child.Name:match("Block") or child.Name:match("Food") or child.Name:match("Fuse") or child.Name:match("Battery") and not child:FindFirstChild("ESP") then
                        local ESP = Instance.new("Highlight")
                        ESP.Name = "ESP"
                        ESP.Parent = child
                        ESP.FillColor = Color3.new(0, 1, 0)
                    end
                end
            end
            for _, child in pairs(workspace.Monsters:GetChildren()) do
                if child:FindFirstChild("ESP") and child.Name:match("Block") or child.Name:match("Food") or child.Name:match("Fuse") or child.Name:match("Battery") then
                    child:FindFirstChild("ESP"):Destroy()
                end
            end
        end)
    end,
})

---> Misc tab <---

---> AntiAFK <---
if AAFKToggle then
    local antiAFKToggle = Tab2:CreateToggle({
        Name = "Anti AFK",
        CurrentValue = false,
        Flag = "AntiAFK",
        Callback = function(Value)
            antiAFK = Value
            game:GetService("Players").LocalPlayer.Idled:connect(function()
                if antiAFK then
                    vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
                    wait(0.5)
                    vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
                end
            end)
        end,
    })
end

---> FullBright <---
if FBToggle then
    local Bright
    local Clock
    local Fog
    local Shadows
    local Ambient
    local FullBrightToggle = Tab2:CreateToggle({
        Name = "Full Bright",
        CurrentValue = false,
        Flag = "FullBright",
        Callback = function(Value)
            FullBright = Value
            if FullBright then
                Bright = Lighting.Brightness
                Clock = Lighting.ClockTime
                Fog = Lighting.FogEnd
                Shadows = Lighting.GlobalShadows
                Ambient = Lighting.OutdoorAmbient
            	Lighting.Brightness = 2
            	Lighting.ClockTime = 14
            	Lighting.FogEnd = 100000
            	Lighting.GlobalShadows = false
            	Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
            else
            	Lighting.Brightness = Bright
            	Lighting.ClockTime = Clock
            	Lighting.FogEnd = Fog
            	Lighting.GlobalShadows = Shadows
            	Lighting.OutdoorAmbient = Ambient
            end
        end,
    })
end

---> No Clip <---
if NCToggle then
    local NoClipToggle = Tab2:CreateToggle({
        Name = "No Clip",
        CurrentValue = false,
        Flag = "NoClip",
        Callback = function(Value)
            NoClip = Value
            local noclipping
            if NoClip then
                function NoClipLoop()
                    if game:GetService("Players").LocalPlayer.Character ~= nil then
                        if not NoClip then return end
                        for _, child in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
                            if child:IsA("BasePart") and child.CanCollide == true and child.Name ~= floatName then
                            	child.CanCollide = false
                            end
                        end
                    end
                end
                noclipping = RunService.Stepped:Connect(NoClipLoop)
            end
        end,
    })
end

---> Player Esp <---
if PESPToggle then
    local PESPColor = Color3.new(1, 0, 0)
    local PESPToggle = Tab2:CreateToggle({
        Name = "Player ESP",
        CurrentValue = false,
        Flag = "PESP",
        Callback = function(Value)
            PlayerESP = Value
        end,
    })
    local PESPColorPicker = Tab2:CreateColorPicker({
        Name = "Player ESP Color",
        Color = Color3.fromRGB(255,0,0),
        Flag = "PESPColor",
        Callback = function(Value)
            PESPColor = Value
        end
    })
    RunService.Stepped:Connect(function()
        if PlayerESP then
            for _, child in pairs(game:GetService("Players"):GetPlayers()) do
                if not child.Character:FindFirstChild("ESP") and child.Name ~= game:GetService("Players").LocalPlayer.Name and child.Character then
                    local ESP = Instance.new("Highlight")
                    ESP.Name = "ESP"
                    ESP.Parent = child.Character or child.CharacterAdded:Wait()
                    ESP.FillColor = PESPColor
                    ESP.FillTransparency = .2
                    local BillboardGui = Instance.new("BillboardGui")
                    local Frame = Instance.new("Frame")
                    local TextLabel = Instance.new("TextLabel")
                    local UICorner = Instance.new("UICorner")
                    
                    BillboardGui.Parent = child.Character:WaitForChild("Head")
                    BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                    BillboardGui.Active = true
                    BillboardGui.AlwaysOnTop = true
                    BillboardGui.ExtentsOffset = Vector3.new(0, 2.5, 0)
                    BillboardGui.LightInfluence = 1.000
                    BillboardGui.Size = UDim2.new(6, 0, 1.5, 0)
                    
                    Frame.Parent = BillboardGui
                    Frame.BackgroundColor3 = Color3.fromRGB(255, 0, 4)
                    Frame.BackgroundTransparency = 1.000
                    Frame.Size = UDim2.new(1, 0, 1, 0)
                    
                    TextLabel.Parent = Frame
                    TextLabel.BackgroundColor3 = PESPColor
                    TextLabel.BackgroundTransparency = 0.500
                    TextLabel.Size = UDim2.new(1, 0, 1, 0)
                    TextLabel.Font = Enum.Font.SourceSans
                    TextLabel.Text = "Name: ".. child.Name.. "\n".. "Distance: ".. (game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - child.Character:WaitForChild("HumanoidRootPart").Position).magnitude
                    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                    TextLabel.TextScaled = true
                    TextLabel.TextSize = 25.000
                    TextLabel.TextStrokeTransparency = 0.100
                    TextLabel.TextWrapped = true
                    
                    UICorner.Parent = TextLabel
                elseif child.Character:FindFirstChild("ESP") then
                    child.Character:FindFirstChild("ESP").FillColor = PESPColor
                    child.Character:FindFirstChild("ESP").OutlineColor = PESPColor
                    child.Character:WaitForChild("Head").BillboardGui.Frame.TextLabel.BackgroundColor3 = PESPColor
                    child.Character:WaitForChild("Head").BillboardGui.Frame.TextLabel.Text = "Name: ".. child.Name.. "\n".. "Distance: ".. math.floor((game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - child.Character:WaitForChild("HumanoidRootPart").Position).magnitude)
                end
            end
        else
            for _, child in pairs(game:GetService("Players"):GetPlayers()) do
                if child.Character:FindFirstChild("ESP") then
                    child.Character:FindFirstChild("ESP"):Destroy()
                    child.Character:WaitForChild("Head").BillboardGui:Destroy()
                end
            end
        end
    end)
end

---> Gravity <---
local Gravity = workspace.Gravity
local BrokenSliders = false
local Slider = Tab2:CreateSlider({
    Name = "Gravity",
    Range = {0, 1000},
    Increment = 1,
    Suffix = "",
    CurrentValue = Gravity,
    Flag = nil,
    Callback = function(Value)
        Gravity = Value
    end,
})

---> Speed And Jump <---
local Speed = game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed
local Jump = game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower
local Slider = Tab2:CreateSlider({
    Name = "Walk Speed",
    Range = {10, 500},
    Increment = 1,
    Suffix = "",
    CurrentValue = Speed,
    Flag = nil,
    Callback = function(Value)
        Speed = Value
    end,
})
local Slider = Tab2:CreateSlider({
    Name = "Jump Power",
    Range = {10, 750},
    Increment = 1,
    Suffix = "",
    CurrentValue = Jump,
    Flag = nil,
    Callback = function(Value)
        Jump = Value
    end,
})

function SlidersStart()
    spawn(function()
        while true do
            wait()
            if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid") then return end
            workspace.Gravity = Gravity
            game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = Speed
            game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = Jump
        end
    end)
end
SlidersStart()

---> Fix Sliders <---
local Fixer = Tab2:CreateButton({
    Name = "Fix Sliders",
    Callback = function()
        game.Players.LocalPlayer.Character.Humanoid:Destroy()
        wait(4)
        local Hum = Instance.new("Humanoid")
        Hum.Parent = game.Players.LocalPlayer.Character
        Hum.WalkSpeed = 16
        SlidersStart()
    end,
})
