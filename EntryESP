--Yes this is doodoo but i made this a while back
local plr = game.Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local esp_Folder = Instance.new("Folder", workspace)
esp_Folder.Name = "ESP_Folder"

local actors = workspace:FindFirstChild("Level") and workspace.Level:FindFirstChild("Actors")
local geometry = workspace:FindFirstChild("Level") and workspace.Level:FindFirstChild("Geometry")

local mapId = tostring(game.PlaceId)
local map = {
    ["3200010305"] = "bs",
    ["2797881676"] = "finan",
    ["2625195454"] = "depo",
    ["3590667014"] = "lh",
    ["2951213182"] = "wd",
    ["4518266946"] = "sci",
    ["4661507759"] = "scrs",
    ["4768829954"] = "bd",
    ["2215221144"] = "kh",
    ["4134003540"] = "auc",
    ["3925577908"] = "gala",
    ["4388762338"] = "cac",
    ["5071816792"] = "set",
    ["5188855685"] = "lock",
    ["5862433299"] = "score",
    ["7799530284"] = "cc"
}
map = map[mapId]

local NPCs = {
    vip = {"Police Captain", "Falcon", "Manager", "Auctioneer", "Ryan", "SC Commander", "Agent Hemlock", "Agent Nightshade"},
    enemy = {"SWAT", "Aegis Unit", "ETF", "TRU", "SC Soldier", "SC Shredder", "Juggernaut", "Onyx Unit"},
    civilian = {"Civilian"},
    worker = {"Employee", "Staff", "Manager's Assistant", "Tech", "Analyst", "Programmer", "Workshop Tech", "Detective"}
}


local function getNPCColor(name)
    name = name:lower()
    for _, v in pairs(NPCs.vip) do
        if name == v:lower() then
            return Color3.fromRGB(0, 0, 255)  -- Blue for VIPs
        end
    end
    for _, v in pairs(NPCs.enemy) do
        if name == v:lower() then
            return Color3.fromRGB(255, 0, 0)  -- Red for enemies
        end
    end
    for _, v in pairs(NPCs.civilian) do
        if name == v:lower() then
            return Color3.fromRGB(255, 255, 255)  -- White for civilians
        end
    end
    for _, v in pairs(NPCs.worker) do
        if name == v:lower() then
            return Color3.fromRGB(0, 255, 0)  -- Green for workers
        end
    end
    return Color3.fromRGB(255, 255, 255)  -- Default to white if not found
end

local function createESP(part, color, transparency)
    local faces = {
        Enum.NormalId.Front,
        Enum.NormalId.Back,
        Enum.NormalId.Left,
        Enum.NormalId.Right,
        Enum.NormalId.Top,
        Enum.NormalId.Bottom
    }

    for _, face in pairs(faces) do
        local surfaceGui = Instance.new("SurfaceGui")
        surfaceGui.Adornee = part
        surfaceGui.Face = face
        surfaceGui.AlwaysOnTop = true

        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(1, 0, 1, 0)
        frame.BackgroundColor3 = color
        frame.BackgroundTransparency = transparency
        frame.BorderSizePixel = 0
        frame.Parent = surfaceGui

        surfaceGui.Parent = esp_Folder
    end
end

local function addESPToModel(model, color, transparency)
    if not model:IsA("Model") then return end

    for _, part in pairs(model:GetDescendants()) do
        if part:IsA("BasePart") then
            createESP(part, color, transparency)
        end
    end
end

local function enableNPCsESP()
    if actors then
        for _, actor in pairs(actors:GetChildren()) do
            local npcChar = actor:FindFirstChild("Character")
            if npcChar then
                local interact = npcChar:FindFirstChild("Interact")
                if interact then
                    local npcName = interact:FindFirstChild("ObjectName")
                    if npcName then
                        local color = getNPCColor(npcName.Value)
                        addESPToModel(npcChar, color, 0.25)
                    end
                end
            end
        end
    else
        print("Actors folder not found!")
    end
end


local function enableMapESP()
    if not geometry then return end

    if map == "bs" then
        for _, part in pairs(geometry:GetDescendants()) do
            if part.Name == "Screen" and part.Parent.Name == "Computer" then
                createESP(part, Color3.fromRGB(0, 255, 154), 0.25)
            end
        end
    elseif map == "finan" then
        for _, part in pairs(geometry:GetDescendants()) do
            if part.Name == "Union" and part.Parent.Name == "PowerDoor" then
                createESP(part, Color3.fromRGB(0, 255, 154), 0.25)
            end
        end
    elseif map == "depo" then
        for _, part in pairs(geometry:GetDescendants()) do
            if part.Name == "Base" and part.Parent.Name == "SafeDoor" then
                createESP(part, Color3.fromRGB(0, 255, 154), 0.25)
            end
        end
    elseif map == "lh" then
        for _, part in pairs(geometry:GetDescendants()) do
            if (part.Name == "Base" and part.Parent.Name == "FileFolder") or (part.Name == "Union" and part.Parent.Name == "PowerDoor") then
                createESP(part, Color3.fromRGB(0, 255, 154), 0.25)
            end
        end
    elseif map == "wd" then
        for _, part in pairs(geometry:GetDescendants()) do
            if part.Name == "Union" and part.Parent.Name == "PowerDoor" then
                local espColor = part.Parent:FindFirstChild("Color") and part.Parent.Color.Color or Color3.fromRGB(0, 255, 154)
                createESP(part, espColor, 0.25)
            elseif part.Name == "Center" and part.Parent.Name == "Computer" then
                createESP(part, Color3.fromRGB(0, 255, 154), 0.25)
            end
        end
    end
end

function enableESP()
    enableNPCsESP()
    enableMapESP()
end

print("Esp loaded, Have fun!")
enableESP()
