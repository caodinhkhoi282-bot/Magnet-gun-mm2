--// MAGNET GUN V2 (ULTRA FAST) - BY DINH_KHOI28215

local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart")

-- GUI MINI
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "MagnetGunV2"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0,140,0,80)
frame.Position = UDim2.new(0.4,0,0.4,0)
frame.BackgroundColor3 = Color3.fromRGB(10,10,10)
frame.Active = true
frame.Draggable = true
Instance.new("UICorner", frame)

local stroke = Instance.new("UIStroke", frame)
stroke.Color = Color3.fromRGB(0,170,255)

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1,0,0,20)
title.Text = "Teleport gun"
title.BackgroundTransparency = 1
title.TextColor3 = Color3.fromRGB(0,170,255)
title.TextScaled = true

local btn = Instance.new("TextButton", frame)
btn.Size = UDim2.new(0.9,0,0,30)
btn.Position = UDim2.new(0.05,0,0.35,0)
btn.Text = "Magnet"
btn.BackgroundColor3 = Color3.fromRGB(0,80,255)
btn.TextColor3 = Color3.new(1,1,1)
btn.TextScaled = true
Instance.new("UICorner", btn)

local credit = Instance.new("TextLabel", frame)
credit.Size = UDim2.new(1,0,0,15)
credit.Position = UDim2.new(0,0,1,-15)
credit.Text = "By DINH_KHOI28215"
credit.BackgroundTransparency = 1
credit.TextScaled = true

-- 🔍 FIND GUN (tối ưu)
function findGun()
    for _,v in pairs(workspace:GetDescendants()) do
        if v:IsA("Tool") and (v.Name:lower():find("gun") or v.Name:lower():find("revolver")) then
            local handle = v:FindFirstChild("Handle")
            if handle then return handle end
        end

        if v.Name == "GunDrop" and v:IsA("BasePart") then
            return v
        end
    end
end

-- ⚡ MAGNET ULTRA
local running = false

btn.MouseButton1Click:Connect(function()
    running = not running
    btn.Text = running and "ON" or "OFF"

    while running do
        local gun = findGun()

        if gun then
            -- spam kéo cực nhanh
            for i = 1,10 do
                gun.CFrame = hrp.CFrame
            end
        end

        task.wait() -- nhanh nhất (1 frame)
    end
end)
