repeat
    wait()
until game.Workspace:FindFirstChild("CurrentMap")
local lowest = 999999
local done = false
for _,v in pairs(game.Workspace.CurrentMap:GetChildren()) do
    if string.sub(v.Name,1,11) == "Checkpoint_" then
        if tonumber(string.sub(v.Name,12,#v.Name)) < lowest then
            lowest = tonumber(string.sub(v.Name,12,#v.Name))
        end
    end
end
local lastdone = lowest-1
while done==false do
    if game.Workspace.CurrentMap:FindFirstChild("Checkpoint_"..lastdone+1) then
        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,game.Workspace.CurrentMap:FindFirstChild("Checkpoint_"..lastdone+1).Checkpoint,0)
        wait()
        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,game.Workspace.CurrentMap:FindFirstChild("Checkpoint_"..lastdone+1).Checkpoint,1)
        lastdone = lastdone+1
        wait(2.5)
    else
        if game.Workspace.CurrentMap:FindFirstChild("Goal") then
            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,game.Workspace.CurrentMap:FindFirstChild("Goal").Goal,0)
            wait()
            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,game.Workspace.CurrentMap:FindFirstChild("Goal").Goal,0)
            done = true
        else
            done = true
        end
    end
end
game:GetService("Players").LocalPlayer.OnTeleport:Connect(function(State)
    if State == Enum.TeleportState.Started then
        syn.queue_on_teleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/FrostedFlakes67/obbyrun/main/fixed.lua',true))()")
    end
end)
game:GetService("TeleportService"):Teleport(5434921173)
