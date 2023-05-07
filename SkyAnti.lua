           --// Randy#0002 \\--
--// Don't Steal If You Plan On Skidding \\--

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local Velocity = Vector3.new(200, 700, 200)

local VelocityChanger = false
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character
local RootPart = Character:WaitForChild("HumanoidRootPart")

local function sendNotification(message)
    game.StarterGui:SetCore("SendNotification", {
        Title = "Sky Anti - Randy#0002",
        Text = message,
        Icon = "rbxassetid://7215458251",
        Duration = 2,
    })
end

UIS.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode[getgenv().Settings.KeyBind] and not UIS:GetFocusedTextBox() then
        VelocityChanger = not VelocityChanger
        if VelocityChanger then
            sendNotification("Anti-Lock Enabled")
            while VelocityChanger do
                if RootPart then
                    local RVelocity = RootPart.Velocity
                    RootPart.Velocity = type(Velocity) == "vector" and Velocity or Velocity(RVelocity)
                    RunService.RenderStepped:Wait()
                    RootPart.Velocity = RVelocity
                end
                RunService.Heartbeat:Wait()
            end
        else
            sendNotification("Anti-Lock Disabled")
        end
    end
end)
