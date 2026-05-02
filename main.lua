--// GET GUN FINAL (NO BUG + NO PULL PLAYER) - BY DINH_KHOI28215

local player = game.Players.LocalPlayer

-- 🔄 luôn lấy lại nhân vật
function getHRP()
    local char = player.Character or player.CharacterAdded:Wait()
    return char:WaitForChild("HumanoidRootPart")
end

-- 🔍 tìm súng chuẩn (không lấy của player)
function findGun()
    for _,v in pairs(workspace:GetDescendants()) do

        -- ✅ GunDrop (chuẩn nhất)
        if v.Name == "GunDrop" and v:IsA("BasePart") then
            return v
        end

        -- ✅ Tool nằm dưới đất (không thuộc player)
        if v:IsA("Tool") and v.Parent == workspace then
            if v.Name:lower():find("gun") then
                local handle = v:FindFirstChild("Handle")
                if handle then
                    return handle
                end
            end
        end
    end
end

-- 🎮 GUI MINI ĐÚNG GU
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "GetGunGUI"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0,120,0,60)
frame.Position = UDim2.new(0.4,0,0.4,0)
frame.BackgroundColor3 = Color3.fromRGB(10,10,10)
frame.Active = true
frame.Draggable = true
Instance.new("UICorner", frame)

local stroke = Instance.new("UIStroke", frame)
stroke.Color = Color3.fromRGB(0,170,255)

local btn = Instance.new("TextButton", frame)
btn.Size = UDim2.new(0.9,0,0,30)
btn.Position = UDim2.new(0.05,0,0.25,0)
btn.Text = "Get gun"
btn.BackgroundColor3 = Color3.fromRGB(0,100,255)
btn.TextColor3 = Color3.new(1,1,1)
btn.TextScaled = true
Instance.new("UICorner", btn)

-- 🚀 BẤM = LẤY SÚNG
btn.MouseButton1Click:Connect(function()
    local hrp = getHRP()
    local gun = findGun()

    if gun then
        local oldPos = hrp.CFrame

        -- 🔥 thử hút trước (không kéo người)
        for i = 1,5 do
            gun.CFrame = hrp.CFrame
        end

        task.wait()

        -- ⚠️ nếu chưa nhặt -> TP backup
        if (hrp.Position - gun.Position).Magnitude > 5 then
            hrp.CFrame = gun.CFrame + Vector3.new(0,2,0)
            task.wait(0.25)

            -- 🔙 quay lại chắc chắn
            for i = 1,2 do
                hrp.CFrame = oldPos
                task.wait()
            end
        end
    else
        warn("Chưa có súng rơi!")
    end
end)
