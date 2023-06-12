local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.Name = "BikespawnerGUI"
ScreenGui.ResetOnSpawn = false

local Frame = Instance.new("Frame")
Frame.Position = UDim2.new(0.5, -100, 0.5, -75)
Frame.Size = UDim2.new(0, 200, 0, 150)
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BorderSizePixel = 0
Frame.Active = true
Frame.Draggable = true
Frame.Parent = ScreenGui

local TextLabel = Instance.new("TextLabel")
TextLabel.Position = UDim2.new(0.5, -75, 0, 10)
TextLabel.Size = UDim2.new(0, 150, 0, 30)
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BorderSizePixel = 0
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "Select a bike:"
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextSize = 18
TextLabel.Parent = Frame

local Dropdown = Instance.new("TextButton")
Dropdown.Position = UDim2.new(0.5, -75, 0, 50)
Dropdown.Size = UDim2.new(0, 150, 0, 30)
Dropdown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Dropdown.BorderSizePixel = 0
Dropdown.Font = Enum.Font.SourceSans
Dropdown.Text = "Select"
Dropdown.TextColor3 = Color3.fromRGB(0, 0, 0)
Dropdown.TextSize = 18
Dropdown.Parent = Frame

local DropdownFrame = Instance.new("Frame")
DropdownFrame.Visible = false
DropdownFrame.Position = UDim2.new(0, 0, 1, 1)
DropdownFrame.Size = UDim2.new(1, 0, 0, 100)
DropdownFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
DropdownFrame.BorderSizePixel = 0
DropdownFrame.Parent = Dropdown

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Padding = UDim.new(0, 5)
UIListLayout.Parent = DropdownFrame

local Bikes = {
    "Kawalski Samurai 300",
    "YZF Dirtbike",
    "Harlon David Hardtail",
    "Yamura R6",
    "Donda NR750",
    "Harlon David Glide",
    "Yamura MT10",
    "Samurai ZX10R",
    "Donda CBR10000RR Fireblade",
    "Beamer S1000RR",
    "MV Agustus",
    "Dugatti PR",
    "Kawalski Samurai H2R"
}

for _, Name in ipairs(Bikes) do
    local Option = Instance.new("TextButton")
    Option.Size = UDim2.new(1, 0, 0, 20)
    Option.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Option.BorderSizePixel = 0
    Option.Font = Enum.Font.SourceSans
    Option.Text = Name
    Option.TextColor3 = Color3.fromRGB(0, 0, 0)
    Option.TextSize = 14
    Option.Parent = DropdownFrame

    Option.MouseButton1Click:Connect(function()
        Dropdown.Text = Name
        DropdownFrame.Visible = false
    end)
end

Dropdown.MouseButton1Click:Connect(function()
    DropdownFrame.Visible = not DropdownFrame.Visible
end)

local function Spawn()
    game:GetService("ReplicatedStorage").SpawnVeh:FireServer(Dropdown.Text)
end

local SpawnButton = Instance.new("TextButton")
SpawnButton.Position = UDim2.new(0.5, -50, 0, 100)
SpawnButton.Size = UDim2.new(0, 100, 0, 30)
SpawnButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SpawnButton.BorderSizePixel = 0
SpawnButton.Font = Enum.Font.SourceSans
SpawnButton.Text = "Spawn"
SpawnButton.TextColor3 = Color3.fromRGB(0, 0, 0)
SpawnButton.TextSize = 18
SpawnButton.Parent = Frame

SpawnButton.MouseButton1Click:Connect(Spawn)
