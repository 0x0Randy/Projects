local GlassPane = game.Workspace["Glass Bridge"].GlassPane

for _, Glass in ipairs(GlassPane:GetChildren()) do
    local Glass1 = Glass["1"]
    local Glass2 = Glass["2"]
    if not Glass1.CanCollide then
        Glass1.Color = Color3.new(1, 0, 0)
    else
        Glass1.Color = Color3.new(0, 1, 0)
    end
    if not Glass2.CanCollide then
        Glass2.Color = Color3.new(1, 0, 0)
    else
        Glass2.Color = Color3.new(0, 1, 0)
    end
end
