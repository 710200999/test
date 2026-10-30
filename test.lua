-- Place this script inside a Part or a Model
local workspace = workspace
local part = script.Parent -- The part containing the script

-- Create a invisible "aura" part that follows the player
local function clonePartWithAura(parent, child)
    local newPart = child:Clone()
    newPart.Name = child.Name .. "Aura"
    newPart.Transparency = 0.8
    newPart.Brightness = 1.5
    newPart.Color = Color3.fromRGB(0, 255, 255, 1) -- Cyan color
    parent:FindFirstChild("Aura"):Destroy()
    parent.Aura = newPart
    parent.Aura.Parent = newPart
end

-- Create the initial aura
local aura = clonePartWithAura(part, part)

local function onPlayerTouch(hit)
    -- Check if the thing touching it is a character
    local player = hit.Parent:FindFirstChild("Humanoid")
    
    if player then
        -- Optional: Flash the aura
        local flash = TweenService:Create(aura, TweenInfo.new(0.1), {Transparency = 0})
        flash:Play()
        task.wait(0.1)
        
        -- Optional: Move the aura slightly to the player
        local charPos = hit.Position
        local partPos = part.Position
        local tween = TweenService:Create(aura, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {Position = charPos})
        tween:Play()
        
        -- Highlight the player
        local highlight = Instance.new("TextLabel")
        highlight.Text = "PROX"
        highlight.Size = UDim2.new(1, 0, 1, 0)
        highlight.Font = Enum.Font.Gotham
        highlight.Parent = hit
        task.spawn(function()
            task.wait(1)
            highlight.Parent:Destroy()
        end)
    end
end

part.Parent:TouchConnection = part.Touched:Connect(onPlayerTouch)