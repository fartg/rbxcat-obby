local module = {};

module.to_stage = function(player, stage)
    local workspace_player = player.Character;
    local workspace_stage = game.Workspace.Stages:FindFirstChild("Stage" .. stage);

    -- if the stage doesn't exist, let's teleport them to spawn
    if not workspace_stage then return end;

    local stage_pivot = workspace_stage:GetPivot();

    workspace_player:PivotTo(stage_pivot * CFrame.new(0, 10, 0));
end

return module;