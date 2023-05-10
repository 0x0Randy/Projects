          --// Randy#0002 \\--
--// Don't Steal If You Plan On Skidding \\--

          --// Randy#0002 \\--
--// Don't Steal If You Plan On Skidding \\--

--[[local Settings = {
    AntiStomp = false,
    AntiKeybind = "X"
}]]--

local Connection = nil
local RespawnPos = nil

local function KOChecker()
    if not game.Players.LocalPlayer.Character then
        return
    end

    local BodyEffects = game.Players.LocalPlayer.Character:WaitForChild("BodyEffects")
    local KO = BodyEffects["K.O"]

    if Connection then
        Connection:Disconnect()
    end

    Connection = KO.Changed:Connect(function(Value)
        if Value == true and Settings.AntiStomp then
            RespawnPos = game.Players.LocalPlayer.Character:GetPrimaryPartCFrame()
            game.Players.LocalPlayer.Character:Destroy()
        end
    end)
end

KOChecker()

game.Players.LocalPlayer.CharacterAdded:Connect(function(character)
    KOChecker()
    if RespawnPos then
        character:SetPrimaryPartCFrame(RespawnPos)
        RespawnPos = nil
    end
end)

local Toggle = false
local UserInputService = game:GetService("UserInputService")

local function Notification(Message)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Frank Billington Anti-Stomp";
        Text = Message;
        Duration = 3;
    })
end

UserInputService.InputBegan:Connect(function(input, Typing)
    if Typing then return end
    if input.KeyCode == Enum.KeyCode[Settings.AntiKeybind:upper()] then
        Toggle = not Toggle
        Settings.AntiStomp = Toggle
        Notification(Toggle and "Enabled" or "Disabled")
    end
end)

Notification("Script Loaded")
