-- Place this on a button or use a RemoteEvent
local teleporter = script.Parent
local targetPart = {} -- Array to store targets

-- Connect to the event
teleporter.Parent = workspace

local function teleport joueursn, targetTable 
    if #targetTable == 0 then return end
    
    local character = j Bourg:FindFirstChild("Humanoid")
    
    -- Tween the character to the average position of the targets
    local finalPos = {}
    
    for i, obj in ipairs(targetTable) do
        table.insert(finalPos, obj.CFrame.Position)
    end
    
    local finalCFrame = CFrame.new(finalPos) -- Simplified math for 3 targets
    
    -- The actual movement
    local tween = Instance.new("Vector3ToPartCFrame") -- Requires a library or standard usage
    -- Simpler method:
    local newCFrame = CFrame.new(finalPos[1], finalPos[2], finalPos[3]) 
    
    character:ApplyCFrame(newCFrame)
end

-- Event listener (Replaces the list above in newer iterations)
teleporter.Touched:Connect(function(hit)
    local player = hit.Parent:FindFirstChild("Humanoid")
    if player then
        -- Get the position of the part touching the player
        local targetPos = hit.CFrame.Position
        player:ApplyCFrame(hit.CFrame * CFrame.new(0, 0.5, 0)) -- Snap to top
    end
end)