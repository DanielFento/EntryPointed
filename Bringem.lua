-- made this a while back too so just wait till i update it

local ScreenGui = Instance.new("ScreenGui")
local TextBox = Instance.new("TextBox")
local StatusLabel = Instance.new("TextLabel")

ScreenGui.Name = "ControlGui"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

TextBox.Name = "InputBox"
TextBox.Parent = ScreenGui
TextBox.Visible = false
TextBox.Size = UDim2.new(0, 200, 0, 30)
TextBox.Position = UDim2.new(0.5, -100, 0.5, -15)
TextBox.Text = ""
TextBox.TextWrapped = true
TextBox.TextScaled = true

StatusLabel.Name = "StatusLabel"
StatusLabel.Parent = ScreenGui
StatusLabel.Text = "Press ']' to open text box and enter category (guard, worker, vip, rose, civilian, enemy, mixed)"
StatusLabel.Size = UDim2.new(0, 400, 0, 20)
StatusLabel.Position = UDim2.new(0.5, -200, 0.5, 100)
StatusLabel.TextColor3 = Color3.new(1, 1, 1)
StatusLabel.BackgroundTransparency = 1

local categories = {
    guard = {
        "Guard",
        "Base Security",
        "Elite Guard",
        "Security",
        "Bodyguard",
        "SC Guard",
        "Elite Operative",
        "Evidence Custodian",
        "Phoenix Operative",
        "Falcon"
 
    },
    worker = {"Employee", "Staff", "Manager's Assistant", "Tech", "Analyst", "Programmer", "Workshop Tech", "Detective"},
    vip = {
        "Police Captain",
        "Falcon",
        "Manager",
        "Auctioneer",
        "Ryan",
        "SC Commander",
        "Agent Hemlock",
        "Agent Nightshade"
    },
    rose = {"Rose", "Rivera", "Jade"},
    civilian = {"Civilian"},
    enemy = {"SWAT", "Aegis Unit", "ETF", "TRU", "SC Soldier", "SC Shredder", "Juggernaut", "Onyx Unit"},
    mixed = {"Police", "Janitor", "Halcyon Operative", "Elite Guard"}
}

local bringing = false
local targetCFrame = nil

local function bringCategory(category)
    for i, v in pairs(game.Workspace.Level.Actors:GetChildren()) do
        if v.Character and v.Character:FindFirstChild("Interact") and v.Character.Interact:FindFirstChild("ObjectName") then
            local objectName = v.Character.Interact.ObjectName.Value
            if table.find(category, objectName) then
                v.Character.HumanoidRootPart.CFrame = targetCFrame
            end
        end
    end
end

local function resetStatusLabel()
    wait(3)
    StatusLabel.Text =
        "Press ']' to open text box and enter category (guard, worker, vip, rose, civilian, enemy, mixed)"
end

game:GetService("UserInputService").InputBegan:Connect(
    function(input)
        if input.KeyCode == Enum.KeyCode.RightBracket then
            TextBox.Visible = true
            TextBox:CaptureFocus()
        end
    end
)

TextBox.FocusLost:Connect(
    function(enterPressed)
        if enterPressed then
            local inputText = TextBox.Text:lower()
            if categories[inputText] then
                targetCFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                bringing = true
                coroutine.wrap(function()
                    while bringing do
                        bringCategory(categories[inputText])
                        wait(0.1)
                    end
                end)()
                StatusLabel.Text = "Status: Bringing " .. inputText:gsub("^%l", string.upper)
            else
                StatusLabel.Text = "Invalid category: " .. inputText
                coroutine.wrap(resetStatusLabel)()
            end
        end
        TextBox.Visible = false
        TextBox.Text = ""
    end
)

game:GetService("UserInputService").InputBegan:Connect(
    function(input)
        if input.KeyCode == Enum.KeyCode.LeftBracket then
            bringing = false
            StatusLabel.Text = "Status: Stopped bringing"
            coroutine.wrap(resetStatusLabel)()
        end
    end
)
