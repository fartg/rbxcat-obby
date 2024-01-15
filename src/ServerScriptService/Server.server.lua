local server = game.ServerStorage.Server;

local config = require(game.ServerStorage.rbxcat.Config);

repeat task.wait() until game.ReplicatedStorage:FindFirstChild("Server") ~= nil;
