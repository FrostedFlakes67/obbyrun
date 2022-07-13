local lowest = 999999
local done = false
repeat
    wait()
until game.Workspace:FindFirstChild("CurrentMap")
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
        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,game.Workspace.CurrentMap:FindFirstChild("Goal").Goal,0)
        wait()
        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,game.Workspace.CurrentMap:FindFirstChild("Goal").Goal,0)
        done = true
    end
end
game:GetService("TeleportService"):Teleport(5434921173)
syn.queue_on_teleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/FrostedFlakes67/obbyrun/main/load.lua',true))()")
