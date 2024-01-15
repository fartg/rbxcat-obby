local Players = game:GetService("Players");

local Variables = require(game.ServerStorage.rbxcat.Modules.Variables);
local PlayerFunctions = require(game.ServerStorage.rbxcat.Modules.Functions.PlayerFunctions);
local EditPlayer = require(game.ServerStorage.rbxcat.Modules.Functions.EditPlayer);
local Teleport = require(game.ServerStorage.rbxcat.Modules.Misc.Teleport);

local ready_event = game.ReplicatedStorage.Events.Info.PlayerReady;

Players.PlayerAdded:Connect(function(player)
	repeat wait() until Variables.Create(player);
	
	PlayerFunctions.Playtime(player);
	
	ready_event:FireClient(player);

	player.Team = game.Teams:WaitForChild("Stage 0");
	
	player.CharacterAdded:Connect(function(character)
		Teleport.to_stage(player, EditPlayer.Return(player, nil, "stage"));
	end)
end)

Players.PlayerRemoving:Connect(function(player)
	-- save data;
	
	Variables.Delete(player);
end)
