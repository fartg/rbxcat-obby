local Events = game.ReplicatedStorage.Events.World;
local ClientEvents = game.ReplicatedStorage.Events.Client;

local EditPlayer = require(game.ServerStorage.rbxcat.Modules.Functions.EditPlayer);
local EditServer = require(game.ServerStorage.rbxcat.Modules.Functions.EditServer);

Events.ChangeStage.Event:Connect(function(player, stage_object)
    -- Let's grab the players current stage and the stage number they're at
    local player_stage = tonumber(EditPlayer.Return(player, nil, "stage"));
    local stage = tonumber(string.sub(stage_object.Name, 6));

    -- If the player's stage is more or equal to the current stage, who cares?
    if player_stage >= stage then return end 

    -- Let's edit the player now
    EditPlayer.Player(player, "stage", stage);

    -- Let's check the win conditions
    if stage == EditServer.Return("total_stages") then
        Events.Win:Fire(player);
        return
    end

    -- Change the team now that we know they aren't a winner
    player.Team = game.Teams:FindFirstChild("Stage " .. stage);
end)

Events.Win.Event:Connect(function(player)
    player.Team = game.Teams:FindFirstChild("Winners");
    ClientEvents.SystemMessage:FireAllClients(player.Name .. " has beaten the obby! Everyone say GG!", "system");
end)