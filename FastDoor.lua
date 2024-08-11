--veryshmol i know
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService("Workspace")
local Triggers = Workspace.Level.Triggers

for _, drillTrigger in pairs(Triggers:GetChildren()) do
    local interactFolder = drillTrigger:FindFirstChild("Interact")
    if interactFolder then
        local inUseValue = interactFolder:FindFirstChild("InUse")
        local progressValue = interactFolder:FindFirstChild("Progress")
        
        if inUseValue and progressValue then
            inUseValue:GetPropertyChangedSignal("Value"):Connect(function()
                if inUseValue.Value == LocalPlayer.Name then
                    while inUseValue.Value == LocalPlayer.Name do
                        progressValue.Value = progressValue.Value + 1
                        wait(0.001) -- Wait for 1 millisecond
                    end
                end
            end)
        end
    end
end
