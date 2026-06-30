local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local DamageButton = Instance.new("TextButton")
local DamageLabel = Instance.new("TextLabel")

local player = game.Players.LocalPlayer
local damage = 10

ScreenGui.Parent = player:WaitForChild("PlayerGui")

Frame.Parent = ScreenGui
Frame.Size = UDim2.new(0, 300, 0, 200)
Frame.Position = UDim2.new(0.5, -150, 0.5, -100)

DamageLabel.Parent = Frame
DamageLabel.Size = UDim2.new(1, 0, 0, 50)
DamageLabel.Text = "Damage: " .. damage

DamageButton.Parent = Frame
DamageButton.Size = UDim2.new(0.8, 0, 0, 50)
DamageButton.Position = UDim2.new(0.1, 0, 0.5, 0)
DamageButton.Text = "Tăng Dame +10"

DamageButton.MouseButton1Click:Connect(function()
	damage = damage + 10
	DamageLabel.Text = "Damage: " .. damage
end)