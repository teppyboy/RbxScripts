--[[
local KleavCfg = {
	Width = 640,
	Height = 480,
	Font = Enum.Font.Ubuntu
}
]]
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local KleaverUI = {}
KleaverUI.CreateWindow = function(WindowName, KleavConfig)
	local Kleaver = {}
	local KEvents = {}
	local KleaverGUI = Instance.new("ScreenGui")
	if RunService:IsStudio() then
		KleaverGUI.Parent = LocalPlayer.PlayerGui
		print("Studio mode!")
	else
		KleaverGUI.Parent = game:GetService("CoreGui")
	end
	KleaverGUI.Name = WindowName
	KleaverGUI.ResetOnSpawn = false

	local KWin = Instance.new("Frame",KleaverGUI)
	KWin.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	KWin.Size = UDim2.new(0,KleavConfig.Width,0,KleavConfig.Height)
	KWin.BorderSizePixel = 0
	KWin.AnchorPoint = Vector2.new(0.5,0.5)
	KWin.Position = UDim2.new(0.5,0,0.5,0)
	KWin.Position = UDim2.new(0,KWin.AbsolutePosition.X,0,KWin.AbsolutePosition.Y)
	KWin.AnchorPoint = Vector2.new(0,0)
	KWin.Name = "KleaverWindow"

	local KWUiLL = Instance.new("UIListLayout", KWin)
	KWUiLL.SortOrder = Enum.SortOrder.LayoutOrder

	local HoveringTopbar, Dragging, MouseOffset = false, false, nil
	local KTitle = Instance.new("TextLabel", KWin)
	KTitle.LayoutOrder = 0
	KTitle.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	KTitle.Text = WindowName
	KTitle.Font = KleavConfig.Font
	KTitle.TextSize = 14
	KTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
	KTitle.BorderSizePixel = 0
	KTitle.Size = UDim2.new(0,KleavConfig.Width,0,20)
	KTitle.Name = "KleaverTitle"
	table.insert(KEvents,KTitle.MouseEnter:Connect(function()
		HoveringTopbar = true
	end))
	table.insert(KEvents,KTitle.MouseLeave:Connect(function()
		HoveringTopbar = false
	end))

	local CloseBtn = Instance.new("ImageButton", KTitle)
	CloseBtn.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
	CloseBtn.BorderSizePixel = 0
	CloseBtn.Position = UDim2.new(0, KleavConfig.Width - 20, 0, 0)
	CloseBtn.Size = UDim2.new(0, 20, 0, 20)
	table.insert(KEvents,CloseBtn.MouseButton1Click:Connect(function()
		-- Unregister events
		while Dragging and MouseOffset do
			wait()
		end
		wait()
		for i, v in pairs(KEvents) do
			v:Disconnect()
		end
		KleaverGUI:Destroy()
	end))

	local MinMaxBtn = Instance.new("ImageButton", KTitle)
	MinMaxBtn.BackgroundColor3 = Color3.fromRGB(193, 0, 199)
	MinMaxBtn.BorderSizePixel = 0
	MinMaxBtn.Position = UDim2.new(0, KleavConfig.Width - 40, 0, 0)
	MinMaxBtn.Size = UDim2.new(0, 20, 0, 20)
	local MMisWorking = false
	MinMaxBtn.MouseButton1Click:Connect(function()
		if not MMisWorking then
			MMisWorking = true
			if KWin.Size.Y.Offset == KleavConfig.Height then
				for i,v in pairs(KWin:GetChildren()) do
					if v.ClassName == "Frame" then
						v.Visible = false
					end
				end
				KWin:TweenSize(UDim2.new(0,KleavConfig.Width,0,20), "Out", "Sine", 0.1, true, function()
					MMisWorking = false
				end)
			else
				KWin:TweenSize(UDim2.new(0,KleavConfig.Width,0,KleavConfig.Height), "Out", "Sine", 0.1, true, function()
					for i,v in pairs(KWin:GetChildren()) do
						if v.ClassName == "Frame" then
							v.Visible = true
						end
					end
					MMisWorking = false
				end)
			end
		end
	end)

	-- Dragging
	local function DragWindow()
		spawn(function()
			while Dragging and MouseOffset do
				if KleaverGUI then
					KWin:TweenPosition(UDim2.new(0, Mouse.X - MouseOffset.X, 0, Mouse.Y - MouseOffset.Y), "Out", "Sine", 0.1, true)
				end
				wait()
			end

			if KleaverGUI then
				KWin:TweenPosition(UDim2.new(0, Mouse.X - MouseOffset.X, 0, Mouse.Y - MouseOffset.Y), "Out", "Sine", 0.1, true)
			end
			MouseOffset = nil
		end)
	end
	table.insert(KEvents,UserInputService.InputBegan:Connect(function(Input)
		if Input.UserInputType == Enum.UserInputType.MouseButton1 then
			if HoveringTopbar then
				MouseOffset = {
					X = Mouse.X - KTitle.AbsolutePosition.X,
					Y = Mouse.Y - KTitle.AbsolutePosition.Y
				}
				Dragging = true
				DragWindow()
			end
		end
	end))

	table.insert(KEvents,UserInputService.InputEnded:Connect(function(Input)
		if Input.UserInputType == Enum.UserInputType.MouseButton1 then
			Dragging = false
		end
	end))

	local KTabManager = Instance.new("Frame",KWin)
	KTabManager.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	KTabManager.BorderSizePixel = 0
	KTabManager.LayoutOrder = 1
	KTabManager.Size = UDim2.new(0, KleavConfig.Width, 0, 20)

	local KTabMgrUILL = Instance.new("UIListLayout", KTabManager)
	KTabMgrUILL.FillDirection = Enum.FillDirection.Horizontal
	KTabMgrUILL.SortOrder = Enum.SortOrder.LayoutOrder

	local KTabs = Instance.new("Frame",KWin)
	KTabs.Name = "KleaverTabs"
	KTabs.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	KTabs.BorderSizePixel = 0
	KTabs.LayoutOrder = 2
	KTabs.Size = UDim2.new(0, KleavConfig.Width, 0, KleavConfig.Height - 40)

	-- Functions
	Kleaver.AddTab = function(TabName)
		local KleaverTab = {}

		local KTab = Instance.new("Frame",KTabs)
		KTab.Name = TabName
		KTab.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
		KTab.BorderSizePixel = 0
		KTab.Size = UDim2.new(1,0,1,0)

		local KTabULL = Instance.new("UIListLayout", KTab)
		KTabULL.HorizontalAlignment = Enum.HorizontalAlignment.Center
		KTabULL.SortOrder = Enum.SortOrder.LayoutOrder

		local KTabBtn = Instance.new("TextButton", KTabManager)
		KTabBtn.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
		KTabBtn.LayoutOrder = #KTabs:GetChildren() - 1
		KTabBtn.BorderSizePixel = 0
		KTabBtn.TextSize = 14
		KTabBtn.Text = TabName
		KTabBtn.Size = UDim2.new(0, KTabBtn.TextBounds.X , 0, 20)
		KTabBtn.Font = KleavConfig.Font
		KTabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
		table.insert(KEvents, KTabBtn.MouseButton1Click:Connect(function()
			for i, v in pairs(KTabs:GetChildren()) do
				if v.Visible and v ~= KTab then
					v.Visible = false
				end
			end
			KTabs[TabName].Visible = true
		end))
		-- Functions
		KleaverTab.AddWhitespace = function()
			local KOFrame = Instance.new("Frame", KTab)
			KOFrame.BackgroundColor3 = Color3.fromRGB(40,40,40)
			KOFrame.BackgroundTransparency = 1
			KOFrame.Size = UDim2.new(0, KleavConfig.Width, 0, 5)
			KOFrame.LayoutOrder = #KTab:GetChildren() - 1
			KOFrame.BorderSizePixel = 0
			return KOFrame
		end

		KleaverTab.AddLabel = function(Text)
			local KLabel = Instance.new("TextLabel", KTab)
			KLabel.LayoutOrder = #KTab:GetChildren() - 1
			KLabel.BackgroundTransparency = 1
			KLabel.BorderSizePixel = 0
			KLabel.Size = UDim2.new(0, KleavConfig.Width - 10, 0, 20)
			KLabel.Font = KleavConfig.Font
			KLabel.Text = Text
			KLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			KLabel.TextSize = 14
			KLabel.TextXAlignment = Enum.TextXAlignment.Left
			KLabel.TextYAlignment = Enum.TextYAlignment.Center
			KleaverTab.AddWhitespace()
			return KLabel
		end

		KleaverTab.AddButton = function(Text, Callback)
			local KBtn = Instance.new("TextButton", KTab)
			KBtn.LayoutOrder = #KTab:GetChildren() - 1
			KBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
			KBtn.BorderColor3 = Color3.fromRGB(100,100,100)
			KBtn.BackgroundTransparency = 0
			KBtn.Size = UDim2.new(0, KleavConfig.Width - 10, 0, 20)
			KBtn.Font = KleavConfig.Font
			KBtn.Text = Text
			KBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
			KBtn.TextSize = 14
			KBtn.TextXAlignment = Enum.TextXAlignment.Center
			KBtn.TextYAlignment = Enum.TextYAlignment.Center
			if Callback then
				KBtn.MouseButton1Click:Connect(Callback)
			end
			KleaverTab.AddWhitespace()
			return KBtn
		end

		KleaverTab.AddOption = function(Text, StringOptions, Callback)
			local KOptionBtn = {}
			local KOFrame = Instance.new("Frame", KTab)
			KOFrame.BackgroundColor3 = Color3.fromRGB(40,40,40)
			KOFrame.BackgroundTransparency = 1
			KOFrame.Size = UDim2.new(0, KleavConfig.Width - 10, 0, 20)
			KOFrame.LayoutOrder = #KTab:GetChildren() - 1
			KOFrame.BorderSizePixel = 0
			local KOFrameULL = Instance.new("UIListLayout", KOFrame)
			KOFrameULL.FillDirection = Enum.FillDirection.Horizontal
			KOFrameULL.SortOrder = Enum.SortOrder.LayoutOrder
			local KOTxtX = 0
			if Text then
				local KOLabel = Instance.new("TextLabel", KOFrame)
				KOLabel.LayoutOrder = #KOFrame:GetChildren() - 1
				KOLabel.BackgroundTransparency = 1
				KOLabel.BorderSizePixel = 0
				KOLabel.TextSize = 14
				KOLabel.Text = Text
				KOLabel.Size = UDim2.new(0, KOFrame.Size.X.Offset, 0, 20)
				KOLabel.Font = KleavConfig.Font
				KOLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
				KOLabel.TextXAlignment = Enum.TextXAlignment.Left
				KOLabel.TextYAlignment = Enum.TextYAlignment.Center
				KOptionBtn.Label = KOLabel
			end
			local KOBtn = Instance.new("TextButton", KOFrame)
			if KOptionBtn.Label then -- Workaround
				KOptionBtn.Label.Size = UDim2.new(0, KOptionBtn.Label.TextBounds.X + 5, 0, 20) 
				KOTxtX = KOptionBtn.Label.Size.X.Offset
			end
			KOBtn.LayoutOrder = #KOFrame:GetChildren() - 1
			KOBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
			KOBtn.BorderColor3 = Color3.fromRGB(100,100,100)
			KOBtn.BackgroundTransparency = 0
			KOBtn.Size = UDim2.new(0, KOFrame.Size.X.Offset - KOTxtX, 0, 20)
			KOBtn.Font = KleavConfig.Font
			KOBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
			KOBtn.TextSize = 14
			KOBtn.TextXAlignment = Enum.TextXAlignment.Center
			KOBtn.TextYAlignment = Enum.TextYAlignment.Center
			local intOption = 1
			KOptionBtn.Selected = StringOptions[intOption]
			KOBtn.Text = KOptionBtn.Selected
			KOBtn.MouseButton1Click:Connect(function()
				if intOption < #StringOptions then
					intOption = intOption + 1
				else
					intOption = 1
				end
				KOBtn.Text = StringOptions[intOption]
				KOptionBtn.Selected = StringOptions[intOption]
				if Callback then
					Callback(StringOptions[intOption])
				end
			end)
			-- Post registering
			KOptionBtn.Button = KOBtn
			KleaverTab.AddWhitespace()
			return KOptionBtn
		end

		KleaverTab.AddTextBox = function(Text, Callback)
			local KOFrame = Instance.new("Frame", KTab)
			KOFrame.BackgroundColor3 = Color3.fromRGB(40,40,40)
			KOFrame.BackgroundTransparency = 1
			KOFrame.Size = UDim2.new(0, KleavConfig.Width - 10, 0, 20)
			KOFrame.LayoutOrder = #KTab:GetChildren() - 1
			KOFrame.BorderSizePixel = 0
			local KOFrameULL = Instance.new("UIListLayout", KOFrame)
			KOFrameULL.FillDirection = Enum.FillDirection.Horizontal
			KOFrameULL.SortOrder = Enum.SortOrder.LayoutOrder
			local KOTxtX = 0
			local KOLabel = nil
			if Text then
				KOLabel = Instance.new("TextLabel", KOFrame)
				KOLabel.LayoutOrder = #KOFrame:GetChildren() - 1
				KOLabel.BackgroundTransparency = 1
				KOLabel.BorderSizePixel = 0
				KOLabel.TextSize = 14
				KOLabel.Text = Text
				KOLabel.Size = UDim2.new(0, KOFrame.Size.X.Offset, 0, 20)
				KOLabel.Font = KleavConfig.Font
				KOLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
				KOLabel.TextXAlignment = Enum.TextXAlignment.Left
				KOLabel.TextYAlignment = Enum.TextYAlignment.Center
			end
			local KOTBox = Instance.new("TextBox", KOFrame)
			if KOLabel then -- Workaround
				KOLabel.Size = UDim2.new(0, KOLabel.TextBounds.X + 5, 0, 20) 
				KOTxtX = KOLabel.Size.X.Offset
			end
			KOTBox.ClearTextOnFocus = false
			KOTBox.LayoutOrder = #KOFrame:GetChildren() - 1
			KOTBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
			KOTBox.BorderColor3 = Color3.fromRGB(100,100,100)
			KOTBox.BackgroundTransparency = 0
			KOTBox.Size = UDim2.new(0, KOFrame.Size.X.Offset - KOTxtX, 0, 20)
			KOTBox.Font = KleavConfig.Font
			KOTBox.TextColor3 = Color3.fromRGB(255, 255, 255)
			KOTBox.TextSize = 14
			KOTBox.Text = ""
			KOTBox.TextXAlignment = Enum.TextXAlignment.Center
			KOTBox.TextYAlignment = Enum.TextYAlignment.Center
			if Callback then 
				KOTBox.FocusLost:Connect(function()
					Callback(KOTBox.Text)
				end)
			end
			-- Post registering
			KleaverTab.AddWhitespace()
			return KOTBox
		end
		-- Post registering
		KleaverTab.Tab = KTab
		KleaverTab.TabButton = KTabBtn
		return KleaverTab
	end
	-- Post registering
	Kleaver.GUIObject = KleaverGUI
	Kleaver.Window = KWin
	Kleaver.Title = KTitle
	return Kleaver
end
return KleaverUI
