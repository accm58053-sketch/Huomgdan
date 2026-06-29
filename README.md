-- =====================================================
-- MENU ĐIỀU KHIỂN HACK BLOX FRUITS (TOÀN MÀN HÌNH)
-- PHIÊN BẢN 3.0.1 - TÍCH HỢP TẤT CẢ CHỨC NĂNG
-- =====================================================

-- KHỞI TẠO BIẾN TOÀN CỤC CHO CÁC CHỨC NĂNG
_G.BloxSettings = {
    AutoFarm = false,
    AutoCollect = false,
    AutoTeleport = false,
    AutoClick = false,
    AutoEatFruit = false,
    AutoBuyItem = false,
    FruitCheck = false,
    BossFarm = false,
}

-- =====================================================
-- TẠO MENU GIAO DIỆN
-- =====================================================
local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "BloxMenu"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- FRAME CHÍNH (NỀN MENU)
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 350, 0, 450)
mainFrame.Position = UDim2.new(0, 20, 0, 50)
mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
mainFrame.BackgroundTransparency = 0.1
mainFrame.BorderSizePixel = 2
mainFrame.BorderColor3 = Color3.fromRGB(255, 200, 0)
mainFrame.ClipsDescendants = true
mainFrame.Parent = gui

-- TIÊU ĐỀ
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 40)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
title.BorderSizePixel = 0
title.Text = "BLOX FRUITS HACK MENU"
title.TextColor3 = Color3.fromRGB(255, 215, 0)
title.TextScaled = true
title.Font = Enum.Font.SourceSansBold
title.Parent = mainFrame

-- NÚT ĐÓNG MENU
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -35, 0, 5)
closeBtn.BackgroundColor3 = Color3.fromRGB(200, 40, 40)
closeBtn.Text = "X"
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.TextScaled = true
closeBtn.Font = Enum.Font.SourceSansBold
closeBtn.Parent = mainFrame
closeBtn.MouseButton1Click:Connect(function()
    gui.Enabled = not gui.Enabled
end)

-- CUỘN NỘI DUNG
local scroll = Instance.new("ScrollingFrame")
scroll.Size = UDim2.new(1, -10, 1, -50)
scroll.Position = UDim2.new(0, 5, 0, 45)
scroll.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
scroll.BackgroundTransparency = 0.5
scroll.BorderSizePixel = 0
scroll.CanvasSize = UDim2.new(0, 0, 0, 420)
scroll.ScrollBarThickness = 8
scroll.Parent = mainFrame

local layout = Instance.new("UIListLayout")
layout.Padding = UDim.new(0, 5)
layout.SortOrder = Enum.SortOrder.LayoutOrder
layout.Parent = scroll

-- =====================================================
-- HÀM TẠO NÚT TOGGLE
-- =====================================================
local function createToggle(text, settingKey, color)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, -10, 0, 40)
    frame.BackgroundColor3 = Color3.fromRGB(40, 40, 55)
    frame.BorderSizePixel = 1
    frame.BorderColor3 = Color3.fromRGB(100, 100, 120)
    frame.Parent = scroll

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.7, 0, 1, 0)
    label.Position = UDim2.new(0, 5, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.TextScaled = true
    label.Font = Enum.Font.SourceSans
    label.Parent = frame

    local status = Instance.new("TextLabel")
    status.Size = UDim2.new(0, 60, 1, 0)
    status.Position = UDim2.new(0.75, 0, 0, 0)
    status.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    status.Text = "TẮT"
    status.TextColor3 = Color3.fromRGB(255, 255, 255)
    status.TextScaled = true
    status.Font = Enum.Font.SourceSansBold
    status.Parent = frame

    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 1, 0)
    btn.BackgroundTransparency = 1
    btn.Text = ""
    btn.Parent = frame

    -- HÀM CẬP NHẬT TRẠNG THÁI
    local function updateUI()
        local state = _G.BloxSettings[settingKey]
        status.BackgroundColor3 = state and Color3.fromRGB(50, 200, 50) or Color3.fromRGB(200, 50, 50)
        status.Text = state and "BẬT" or "TẮT"
    end
    updateUI()

    btn.MouseButton1Click:Connect(function()
        _G.BloxSettings[settingKey] = not _G.BloxSettings[settingKey]
        updateUI()
        print("[Menu] " .. text .. " -> " .. tostring(_G.BloxSettings[settingKey]))
    end)

    return frame
end

-- TẠO CÁC NÚT CHO TỪNG CHỨC NĂNG
createToggle("🤖 Auto Farm", "AutoFarm")
createToggle("📦 Auto Collect", "AutoCollect")
createToggle("🚀 Auto Teleport", "AutoTeleport")
createToggle("⚔️ Auto Click", "AutoClick")
createToggle("🍎 Auto Eat Fruit", "AutoEatFruit")
createToggle("💰 Auto Buy Item", "AutoBuyItem")
createToggle("🔍 Fruit Check (Map)", "FruitCheck")
createToggle("👹 Boss Farm", "BossFarm")

-- NÚT TẮT TẤT CẢ (RESET)
local resetBtn = Instance.new("TextButton")
resetBtn.Size = UDim2.new(1, -10, 0, 35)
resetBtn.BackgroundColor3 = Color3.fromRGB(150, 30, 30)
resetBtn.Text = "TẮT TẤT CẢ"
resetBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
resetBtn.TextScaled = true
resetBtn.Font = Enum.Font.SourceSansBold
resetBtn.Parent = scroll
resetBtn.MouseButton1Click:Connect(function()
    for key, _ in pairs(_G.BloxSettings) do
        _G.BloxSettings[key] = false
    end
    -- CẬP NHẬT LẠI UI BẰNG CÁCH LÀM MỚI CÁC NÚT (ĐƠN GIẢN LÀ XÓA RỒI TẠO LẠI)
    -- CÁCH KHÁC: TA CÓ THỂ LƯU TRỮ THAM CHIẾU, NHƯNG Ở ĐÂY TA SẼ TẠO LẠI TOÀN BỘ
    -- ĐỂ ĐƠN GIẢN, TA SẼ KÍCH HOẠT LẠI TẤT CẢ CÁC NÚT BẰNG CÁCH GỌI LẠI HÀM TẠO
    -- NHƯNG TA ĐÃ TẠO RỒI, NÊN TA CẦN CẬP NHẬT TỪNG NÚT (DÙNG VÒNG LẶP)
    for _, child in pairs(scroll:GetChildren()) do
        if child:IsA("Frame") and child:FindFirstChild("TextLabel") and child:FindFirstChild("TextButton") then
            -- TÌM NÚT TRẠNG THÁI (CON THỨ 2 LÀ STATUS)
            local statusLabel = child:FindFirstChildOfClass("TextLabel")
            if statusLabel and statusLabel.Text == "TẮT" or statusLabel.Text == "BẬT" then
                -- ĐẶT LẠI VỀ TẮT
                statusLabel.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
                statusLabel.Text = "TẮT"
            end
        end
    end
    print("[Menu] Đã tắt tất cả chức năng")
end)

-- =====================================================
-- KẾT HỢP VỚI SCRIPT CHÍNH (GỌI KHI BẬT)
-- =====================================================
-- LƯU Ý: ĐOẠN SCRIPT CHÍNH (FARM LOOP) PHẢI ĐƯỢC ĐẶT RIÊNG
-- VÀ KIỂM TRA CÁC BIẾN _G.BloxSettings TƯƠNG ỨNG.
-- VÍ DỤ: while wait() do if _G.BloxSettings.AutoFarm then ... end end

-- =====================================================
-- HƯỚNG DẪN HIỂN THỊ
-- =====================================================
local info = Instance.new("TextLabel")
info.Size = UDim2.new(1, 0, 0, 25)
info.Position = UDim2.new(0, 0, 1, -25)
info.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
info.Text = "Nhấn 'X' để ẩn/hiện menu | F4 để đóng"
info.TextColor3 = Color3.fromRGB(200, 200, 200)
info.TextScaled = true
info.Font = Enum.Font.SourceSans
info.Parent = mainFrame

-- PHÍM TẮT TOGGLE MENU (F4)
game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.F4 then
        gui.Enabled = not gui.Enabled
    end
end)

print("[Blox Menu] Đã tải menu thành công. Nhấn F4 để ẩn/hiện.")
