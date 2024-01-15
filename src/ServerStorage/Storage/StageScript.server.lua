local brick = script.Parent;
local Events = game.ReplicatedStorage.Events.World;

brick.Touched:Connect(function(part)
    if part.Name ~= "HumanoidRootPart" then return end;
    
    local player = game.Players:GetPlayerFromCharacter(part.Parent);

    Events.ChangeStage:Fire(player, brick);
end)