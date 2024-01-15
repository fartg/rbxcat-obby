local StageScript = game.ServerStorage.Storage.StageScript;
local StagesFolder = game.Workspace.Stages;

local EditServer = require(game.ServerStorage.rbxcat.Modules.Functions.EditServer);

-- Create the "Stage0Team" team
local Stage0Team = Instance.new("Team", game.Teams);
Stage0Team.Name = "Stage 0";

for _, stage in pairs(StagesFolder:GetChildren()) do
    -- Check if this is the last stage,
    if tonumber(string.sub(stage.Name, 6)) == #StagesFolder:GetChildren() then
        local Team = Instance.new("Team", game.Teams);
        Team.Name = "Winners"
        Team.TeamColor = BrickColor.random()

        StageScript:Clone().Parent = stage;
        continue
    end

    -- Create a team for each stage
    local Team = Instance.new("Team", game.Teams);
    Team.Name = "Stage " .. string.sub(stage.Name, 6);
    Team.TeamColor = BrickColor.random()

    -- Clone the stage script into the stage part!
    StageScript:Clone().Parent = stage;
end

EditServer.Self("total_stages", #StagesFolder:GetChildren())
