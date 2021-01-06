local Untitled = {}

local PrivUntitled = {}
-- Functions
PrivUntitled.MkInstance = function(ClassName, Properties)
	local Object = Instance.new(ClassName);
	for i, v in pairs(Properties) do
		Object[i] = v
	end
	return Object
end

PrivUntitled.FstMk = {
	MkFrm = function(X, Parent)
		return PrivUntitled.MkInstance("Frame", {
			Parent = Parent,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ZIndex = 0,
			Size = UDim2.new(0,X,0,20),
			LayoutOrder = #Parent:GetChildren()
		})
	end,
	MkLbl = function(Text, X, Parent)
		return PrivUntitled.MkInstance("TextLabel",{
			Parent = Parent,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(0,X,0,20),
			ZIndex = 0,
			Font = Enum.Font.Ubuntu,
			Text = Text,
			TextColor3 = Color3.fromRGB(255,255,255),
			TextSize = 16,
			TextXAlignment = Enum.TextXAlignment.Left,
			LayoutOrder = #Parent:GetChildren()
		})
	end,
	MkBtn = function(Text, X, Parent)
		return PrivUntitled.MkInstance("TextButton",{
			Parent = Parent,
			BackgroundColor3 = Color3.fromRGB(30, 30, 30),
			BorderColor3 = Color3.fromRGB(100,100,100),
			BackgroundTransparency = 0,
			BorderSizePixel = 1,
			ZIndex = 0,
			Size = UDim2.new(0,X,0,20),
			Font = Enum.Font.Ubuntu,
			Text = Text,
			TextColor3 = Color3.fromRGB(255,255,255),
			TextSize = 16,
			TextXAlignment = Enum.TextXAlignment.Center,
			LayoutOrder = #Parent:GetChildren()
		})
	end,
	MkTb = function(PText, X, Parent)
		return PrivUntitled.MkInstance("TextBox",{
			Parent = Parent,
			BackgroundColor3 = Color3.fromRGB(30, 30, 30),
			BorderColor3 = Color3.fromRGB(100,100,100),
			BackgroundTransparency = 0,
			ZIndex = 0,
			ClearTextOnFocus = false,
			PlaceholderColor3 = Color3.fromRGB(178, 178, 178),
			PlaceholderText = PText,
			BorderSizePixel = 1,
			Size = UDim2.new(0,X,0,20),
			Font = Enum.Font.Ubuntu,
			Text = "",
			TextColor3 = Color3.fromRGB(255,255,255),
			TextSize = 16,
			TextWrapped = true,
			TextTruncate = Enum.TextTruncate.AtEnd,
			TextXAlignment = Enum.TextXAlignment.Center,
			LayoutOrder = #Parent:GetChildren()
		})
	end
}

-- Variables
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local GuiFolder
if RunService:IsStudio() then
	warn("This Library is running in Studio Mode")
	GuiFolder = LocalPlayer.PlayerGui
else
	GuiFolder = game:GetService("CoreGui")
end 
local UntitledGUI
local Minimized = {}
local HoveringWindowes = {}
local KeyCode, Hidding, Dragging, MouseOffset = Enum.KeyCode.RightAlt, false, false, nil
local function DragWindow(Title)
	while Dragging and MouseOffset and not Hidding do
		if Title then
			Title:TweenPosition(UDim2.new(0, Mouse.X - MouseOffset.X, 0, Mouse.Y - MouseOffset.Y), "Out", "Sine", 0.1, true)
		end
		wait()
	end
	MouseOffset = nil
end
UserInputService.InputBegan:Connect(function(Input, GameProcessedEvent)
	if not GameProcessedEvent then
		if Input.UserInputType == Enum.UserInputType.MouseButton1 then
			for i, v in pairs(HoveringWindowes) do
				if v ~= nil and v[1] then
					MouseOffset = {
						X = Mouse.X - v[2].AbsolutePosition.X,
						Y = Mouse.Y - v[2].AbsolutePosition.Y
					}
					Dragging = true
					coroutine.wrap(DragWindow)(v[2])
					break
				end
			end
		elseif Input.KeyCode == KeyCode and not Hidding then
			Hidding = true
			for i, v in pairs(Minimized) do
				if v ~= nil and v[1] then
					Minimized[i][1] = false
					v[2]:TweenPosition(v[3], Enum.EasingDirection.Out, Enum.EasingStyle.Sine, 0.5, true, nil)
				elseif v ~= nil then
					Minimized[i][1] = true
					Minimized[i][3] = v[2].Position
					v[2]:TweenPosition(UDim2.new(0,-1280,0,-720), Enum.EasingDirection.In, Enum.EasingStyle.Sine, 0.5, true, nil)
				end
			end
			wait(0.5)
			Hidding = false
		end
	end
end)
UserInputService.InputEnded:Connect(function(Input)
	if Input.UserInputType == Enum.UserInputType.MouseButton1 then
		Dragging = false
	end
end)
Untitled.BindToggleKey = function(NewKey)
	KeyCode = NewKey
end
Untitled.SetGUIName = function(Name)
	UntitledGUI = GuiFolder:FindFirstChild(Name) or PrivUntitled.MkInstance("ScreenGui", {Parent = GuiFolder,ResetOnSpawn = false, Name = Name})
end
Untitled.GetInstance = function()
	return UntitledGUI
end

-- VERSION 1 OF THE LIBRARY (MINECRAFT CHEAT STYLED)
Untitled.V1 = {
	MakeWindow = function(WindowName)
		if not UntitledGUI then
			Untitled.SetGUIName(tostring(math.random(0, 177013420)))
		end
		local UntitledWindow = {}
		local TitlePosition = (#UntitledGUI:GetChildren() + 1) * 25
		if (#UntitledGUI:GetChildren() > 0) then
			TitlePosition = TitlePosition + #UntitledGUI:GetChildren() * 225
		end
		local RndName = tostring(math.random(0, 177013420))
		local Title = PrivUntitled.MkInstance("TextLabel", {
			Name = RndName,
			Text = WindowName,
			Parent = UntitledGUI,
			ZIndex = 0,
			BackgroundColor3 = Color3.fromRGB(30, 30, 30),
			BorderSizePixel = 0,
			Size = UDim2.new(0,225,0,40),
			Font = Enum.Font.SciFi,
			TextColor3 = Color3.fromRGB(255,255,255),
			TextSize = 22,
			Position = UDim2.new(0,TitlePosition,0, 25)
		})
		Minimized[RndName] = { false, Title }
		HoveringWindowes[RndName] = { false, Title }
		local ColorBar = PrivUntitled.MkInstance("Frame", {
			Name = "ColorBar",
			Parent = Title,
			ZIndex = 0,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BorderSizePixel = 0,
			Size = UDim2.new(0,225,0,2),
			Position = UDim2.new(0,0,0,38)
		})
		UntitledWindow.BarColor = function(Color)
			ColorBar.BackgroundColor3 = Color
		end
		local MinMaxBtn = PrivUntitled.MkInstance("TextButton", {
			Name = "MinMaxBtn",
			Text = "-",
			ZIndex = 0,
			Parent = Title,
			BackgroundColor3 = Color3.fromRGB(30, 30, 30),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(0, 40, 0, 40),
			Font = Enum.Font.Code,
			TextColor3 = Color3.fromRGB(255,255,255),
			TextSize = 26,
			Position = UDim2.new(0,185,0, 0)
		})
		local Contents = PrivUntitled.MkInstance("ScrollingFrame", {
			Name = "Contents",
			Parent = Title,
			BackgroundColor3 = Color3.fromRGB(40, 40, 40),
			BorderSizePixel = 0,
			ZIndex = 0,
			Size = UDim2.new(0, 225, 0, 0),
			Position = UDim2.new(0,0,1, 0),
			CanvasSize = UDim2.new(0,215,0,0),
			ScrollBarThickness = 2,
		})
		UntitledWindow.GetInstance = function()
			return Contents
		end
		local Tweening = false
		local ContentsSize = 5
		local function GetSize()
			if ContentsSize < workspace.CurrentCamera.ViewportSize.Y - 175 then
				return UDim2.new(0, 225, 0, ContentsSize)
			else
				return UDim2.new(0, 225, 0, workspace.CurrentCamera.ViewportSize.Y - 175)
			end
		end
		MinMaxBtn.MouseButton1Click:Connect(function()
			if not Tweening then
				Tweening = true
				if Contents.Size == UDim2.new(0,225,0,0) then
					MinMaxBtn.Text = "-"
					Contents:TweenSize(GetSize(), Enum.EasingDirection.Out, Enum.EasingStyle.Sine, 0.15 , false, function()
						for i, v in pairs(Contents:GetChildren()) do
							if v.ClassName ~= "UIListLayout" then
								v.Visible = true
							end
						end
						Tweening = false
					end)
				else
					MinMaxBtn.Text = "+"
					for i, v in pairs(Contents:GetChildren()) do
						if v.ClassName ~= "UIListLayout" then
							v.Visible = false
						end
					end
					Contents:TweenSize(UDim2.new(0,225,0,0), Enum.EasingDirection.In, Enum.EasingStyle.Sine, 0.15 , false, function()
						Tweening = false
					end)	
				end
			end
		end)
		-- Drag (from Finity V2 (MIT))
		Title.MouseEnter:Connect(function()
			HoveringWindowes[RndName][1] = true
		end)

		Title.MouseLeave:Connect(function()
			HoveringWindowes[RndName][1] = false
		end)

		local ContentsULL = PrivUntitled.MkInstance("UIListLayout", {
			Parent = Contents,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder
		})

		-- Functions
		UntitledWindow.Update = function() -- Re-render the UI
			Contents.Size = GetSize()
			Contents.CanvasSize = UDim2.new(0, 215, 0, ContentsSize)
		end
		workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
			if Contents.Size ~= UDim2.new(0,225,0,0) then
				UntitledWindow.Update()
			end
		end)
		UntitledWindow.AddWhitespace = function() -- ADd empty frame to Contents
			local YO = 5
			local EmptyFrame = PrivUntitled.MkInstance("Frame", {
				Parent = Contents,
				ZIndex = 0,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = UDim2.new(0,225,0,YO),
				LayoutOrder = #Contents:GetChildren()
			})
			ContentsSize = ContentsSize + YO
			UntitledWindow.Update()
			return EmptyFrame
		end

		UntitledWindow.AddLabel = function(Text) -- Add a label
			UntitledWindow.AddWhitespace()
			local YO = 20
			local Label = PrivUntitled.FstMk.MkLbl(Text, 215, Contents)
			ContentsSize = ContentsSize + YO
			UntitledWindow.Update()
			return Label
		end

		UntitledWindow.AddSection = function(Text) -- Add a section
			UntitledWindow.AddWhitespace()
			local YO = 20
			local Label = PrivUntitled.FstMk.MkLbl(Text, 215, Contents)
			Label.TextXAlignment = Enum.TextXAlignment.Center
			Label.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
			Label.BackgroundTransparency = 0
			ContentsSize = ContentsSize + YO
			UntitledWindow.Update()
			return Label
		end

		UntitledWindow.AddButton = function(Text, Function)
			UntitledWindow.AddWhitespace()
			local YO = 20
			local Button = PrivUntitled.FstMk.MkBtn(Text, 215, Contents)
			if Function then
				Button.MouseButton1Click:Connect(Function)
			end
			ContentsSize = ContentsSize + YO
			UntitledWindow.Update()
			return Button
		end

		UntitledWindow.AddTextbox = function(Text, Function)
			UntitledWindow.AddWhitespace()
			local YO = 20
			local Textbox = PrivUntitled.FstMk.MkTb(Text, 215, Contents)
			if Function then
				Textbox.FocusLost:Connect(function()
					Function(Textbox.Text)
				end)
			end
			ContentsSize = ContentsSize + YO
			UntitledWindow.Update()
			return Textbox
		end

		UntitledWindow.AddCheckbox = function(Text, Function)
			UntitledWindow.AddWhitespace()
			local CheckboxTbl = {
				Checked = false
			}
			local YO = 20
			local Checkbox = PrivUntitled.FstMk.MkFrm(215, Contents)
			local Label = PrivUntitled.FstMk.MkLbl(Text, 195, Checkbox)
			Label.TextXAlignment = Enum.TextXAlignment.Left
			local Button = PrivUntitled.FstMk.MkBtn("", 20, Checkbox)
			Button.Position = UDim2.new(0,195,0,0)
			Button.TextSize = 14
			Button.MouseButton1Click:Connect(function()
				CheckboxTbl.Checked = not CheckboxTbl.Checked
				if CheckboxTbl.Checked then
					Button.Text = "✓"
				else
					Button.Text = ""
				end
				if Function then
					Function(CheckboxTbl.Checked)
				end
			end)
			CheckboxTbl.GetInstance = function() 
				return Checkbox
			end
			ContentsSize = ContentsSize + YO
			UntitledWindow.Update()
			return CheckboxTbl
		end

		UntitledWindow.AddDropdown = function(Selections, Function)
			UntitledWindow.AddWhitespace()
			local YO = 20
			local DropdownTbl = {
				Selected = nil
			}
			local ToggleBtn = PrivUntitled.FstMk.MkBtn("", 215, Contents)
			local Label = PrivUntitled.FstMk.MkLbl("↓", 20, ToggleBtn)
			Label.Position = UDim2.new(0,195,0,0)
			Label.Font = Enum.Font.SourceSans
			local DropdownHSize = 60
			if #Selections < 3 then
				DropdownHSize = #Selections * 20
			end
			local DropdownSize = UDim2.new(0, 215, 0, DropdownHSize)
			local DropdownContents = PrivUntitled.MkInstance("ScrollingFrame", {
				Name = "DropdownContents",
				Parent = ToggleBtn,
				BackgroundColor3 = Color3.fromRGB(30, 30, 30),
				BorderColor3 = Color3.fromRGB(100,100,100),
				Position = UDim2.new(0,0,1,1),
				Size = UDim2.new(0, 215, 0, 0),
				ZIndex = 1,
				CanvasSize = UDim2.new(0,0,0,#Selections * 20),
				Visible = false,
				ScrollBarThickness = 4,
				VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar
			})
			local Tweening = false
			local CloseOpnDropdown = function(bool)
				if (not Tweening) or bool then
					Tweening = true
					if not DropdownContents.Visible then
						Label.Text = "↑"
						DropdownContents.Visible = true
						DropdownContents:TweenSize(DropdownSize, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.1, false, function()
							Tweening = false
						end)
					else
						Label.Text = "↓"
						DropdownContents:TweenSize(UDim2.new(0,215,0,0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.1, false, function()
							DropdownContents.Visible = false
							Tweening = false
						end)
					end
				end
			end
			ToggleBtn.MouseButton1Click:Connect(CloseOpnDropdown)
			local DropdownULL = PrivUntitled.MkInstance("UIListLayout", {
				Parent = DropdownContents,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder
			})
			DropdownTbl.Update = function()
				local NewDropdownSize = 60
				local NewSelections = #DropdownContents:GetChildren() - 1
				if NewSelections < 3 then
					NewDropdownSize = NewSelections * 20
				end
				DropdownSize = UDim2.new(0, 215, 0, NewDropdownSize)
				if (DropdownContents.Visible) then
					DropdownContents.Size = DropdownSize
				end
				DropdownContents.CanvasSize = UDim2.new(0,0,0,NewSelections * 20)
			end
			if Selections[1] then 
				DropdownTbl.Selected = Selections[1] 
				ToggleBtn.Text = Selections[1] 
			end
			-- Function
			DropdownTbl.AddSelection = function(Text)
				local SelectionBtn = PrivUntitled.FstMk.MkBtn(Text, 215, DropdownContents)
				SelectionBtn.ZIndex = 1
				SelectionBtn.MouseButton1Click:Connect(function()
					if SelectionBtn.Text ~= DropdownTbl.Selected then
						DropdownTbl.Selected = SelectionBtn.Text
						ToggleBtn.Text = SelectionBtn.Text
						CloseOpnDropdown(true)
						if Function then
							Function(SelectionBtn.Text)
						end
					end
				end)
				if DropdownTbl.Selected == nil then
					DropdownTbl.Selected = SelectionBtn.Text
					ToggleBtn.Text = SelectionBtn.Text
				end
				DropdownTbl.Update()
			end
			for i, v in pairs(Selections) do
				DropdownTbl.AddSelection(v)
			end
			DropdownTbl.GetInstance = function() 
				return ToggleBtn
			end
			ContentsSize = ContentsSize + YO
			UntitledWindow.Update()
			return DropdownTbl
		end

		UntitledWindow.AddLabelButton = function(LabelText, ButtonText, Function)
			UntitledWindow.AddWhitespace()
			local LabelBtnTbl = {}
			local YO = 20
			local LblBtn = PrivUntitled.FstMk.MkFrm(215, Contents)
			local Label = PrivUntitled.FstMk.MkLbl(LabelText, 108, LblBtn)
			local Button = PrivUntitled.FstMk.MkBtn(ButtonText, 107, LblBtn)
			Button.Position = UDim2.new(0,108,0,0)
			if Function then Button.MouseButton1Click:Connect(Function) end
			LabelBtnTbl.GetInstance = function()
				return LblBtn
			end
			ContentsSize = ContentsSize + YO
			UntitledWindow.Update()
			return LabelBtnTbl
		end

		UntitledWindow.AddLabelTextbox = function(LabelText, TextBoxText, Function)
			UntitledWindow.AddWhitespace()
			local LabelTbTbl = {}
			local YO = 20
			local LblTb = PrivUntitled.FstMk.MkFrm(215, Contents)
			local Label = PrivUntitled.FstMk.MkLbl(LabelText, 108, LblTb)
			local Textbox = PrivUntitled.FstMk.MkTb(TextBoxText, 107, LblTb)
			Textbox.Position = UDim2.new(0,108,0,0)
			if Function then
				Textbox.FocusLost:Connect(function()
					Function(Textbox.Text)
				end)
			end
			LabelTbTbl.GetInstance = function()
				return LblTb
			end
			ContentsSize = ContentsSize + YO
			UntitledWindow.Update()
			return LabelTbTbl
		end
		return UntitledWindow
	end
}

-- VERSION 2 (CSGO CHEAT LIKE)
Untitled.V2 = {
	MakeWindow = function(WindowName) 
		local UntitledWindow = {}
		-- POS = UDim2.new(0.5, -320, 0.5, -200)
		if not UntitledGUI then
			Untitled.SetGUIName(tostring(math.random(0, 177013420)))
		end
		local RndName = tostring(math.random(0, 177013420))
		local Title = PrivUntitled.MkInstance("TextLabel",{
			Name = RndName,
			Parent = UntitledGUI,
			BackgroundColor3 = Color3.fromRGB(20,20,20),
			BorderSizePixel = 0,
			Size = UDim2.new(0, 640, 0, 30),
			Position = UDim2.new(0.5, -320, 0.5, -200),
			Font = Enum.Font.SciFi,
			TextColor3 = Color3.fromRGB(255,255,255),
			Text = WindowName,
			TextSize = 18,
			TextXAlignment = Enum.TextXAlignment.Center
		})
		Minimized[RndName] = { false, Title }
		HoveringWindowes[RndName] = { false, Title }
		-- Drag (from Finity V2 (MIT))
		Title.MouseEnter:Connect(function()
			HoveringWindowes[RndName][1] = true
		end)

		Title.MouseLeave:Connect(function()
			HoveringWindowes[RndName][1] = false
		end)

		local CloseBtn = PrivUntitled.MkInstance("TextButton", {
			Parent = Title,
			BackgroundColor3 = Color3.fromRGB(20, 20, 20),
			BorderSizePixel = 0,
			Position = UDim2.new(0, 590, 0, 0),
			Size = UDim2.new(0, 50, 0, 30),
			Font = Enum.Font.Gotham,
			Text = "X",
			TextColor3 = Color3.fromRGB(255,255,255),
			TextSize = 16
		})
		CloseBtn.MouseButton1Click:Connect(function()
			Minimized[RndName] = nil
			HoveringWindowes[RndName] = nil
			Title:Destroy()
		end)
		local MinMaxBtn = PrivUntitled.MkInstance("TextButton", {
			Parent = Title,
			BackgroundColor3 = Color3.fromRGB(20, 20, 20),
			BorderSizePixel = 0,
			Position = UDim2.new(0, 540, 0, 0),
			Size = UDim2.new(0, 50, 0, 30),
			Font = Enum.Font.Gotham,
			Text = "-",
			TextColor3 = Color3.fromRGB(255,255,255),
			TextSize = 32
		})
		local TabManager = PrivUntitled.MkInstance("ScrollingFrame", {
			Parent = Title,
			BackgroundColor3 = Color3.fromRGB(30, 30, 30),
			BorderSizePixel = 0,
			Position = UDim2.new(0, 0, 1, 0),
			CanvasSize = UDim2.new(0, 640, 0, 20),
			ScrollBarImageColor3 = Color3.new(100, 100, 100),
			ScrollBarThickness = 4,
			Size = UDim2.new(0, 640, 0, 20)
		})
		local TabCanvas = 0
		local function TabCanvasRefresh()
			TabCanvas = 0
			for i, v in pairs(TabManager:GetChildren()) do
				if v.ClassName ~= "UIListLayout" then TabCanvas = TabCanvas + v.Size.X.Offset end
			end
			if TabCanvas < 640 then TabManager.CanvasSize = UDim2.new(0, 640, 0, 20) else TabManager.CanvasSize = UDim2.new(0, TabCanvas, 0, 20) end
		end
		local TabULL = PrivUntitled.MkInstance("UIListLayout", {
			Parent = TabManager,
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder
		})
		local TabContainer = PrivUntitled.MkInstance("Frame", {
			Parent = Title,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Position = UDim2.new(0, 0, 0, 50),
			Size = UDim2.new(0, 0, 0, 0)
		})
		local MMTweening = false
		local BakCanvasSz = nil
		local BakTabCanvazSz = nil
		MinMaxBtn.MouseButton1Click:Connect(function()
			if not MMTweening then
				MMTweening = true
				local Contents = nil
				for i, v in pairs(TabContainer:GetChildren()) do
					if v.Visible then
						Contents = v
						break
					end
				end
				if Contents.Size == UDim2.new(0, 640, 0, 0) then
					MinMaxBtn.Text = "-"
					TabManager:TweenSize(UDim2.new(0, 640, 0, 20), Enum.EasingDirection.Out, Enum.EasingStyle.Sine, 0.05 , false, function()
						TabManager.CanvasSize = BakTabCanvazSz
						for i, v in pairs(TabManager:GetChildren()) do
							if v.ClassName ~= "UIListLayout" then
								v.Visible = true
							end
						end
						Contents:TweenSize(UDim2.new(0, 640, 0, 360), Enum.EasingDirection.Out, Enum.EasingStyle.Sine, 0.25 , false, function()
							Contents.CanvasSize = BakCanvasSz
							for i, v in pairs(Contents:GetChildren()) do
								if v.ClassName ~= "UIListLayout" then
									v.Visible = true
								end
							end
							MMTweening = false
						end)
					end)
				else
					MinMaxBtn.Text = "+"
					BakCanvasSz = Contents.CanvasSize
					BakTabCanvazSz = TabManager.CanvasSize
					TabManager.CanvasSize = UDim2.new(0,640,0,0)
					Contents.CanvasSize = UDim2.new(0,640,0,0)
					for i, v in pairs(Contents:GetChildren()) do
						if v.ClassName ~= "UIListLayout" then
							v.Visible = false
						end
					end
					Contents:TweenSize(UDim2.new(0, 640, 0, 0), Enum.EasingDirection.In, Enum.EasingStyle.Sine, 0.25 , false, function()
						for i, v in pairs(TabManager:GetChildren()) do
							if v.ClassName ~= "UIListLayout" then
								v.Visible = false
							end
						end
						TabManager:TweenSize(UDim2.new(0, 640, 0, 0), Enum.EasingDirection.In, Enum.EasingStyle.Sine, 0.05 , false, function()
							MMTweening = false
						end)
					end)	
				end
			end
		end)
		UntitledWindow.AddTab = function(Mode, Name)
			local UntitledTab = {}
			local TabButton = PrivUntitled.MkInstance("TextButton", {
				Parent = TabManager,
				BackgroundColor3 = Color3.fromRGB(84, 107, 209),
				BorderSizePixel = 0,
				Size = UDim2.new(0, 0, 0, 20),
				Font = Enum.Font.Gotham,
				Text = Name,
				TextColor3 = Color3.fromRGB(255, 255, 255),
				TextSize = 16,
				TextXAlignment = Enum.TextXAlignment.Center,
				LayoutOrder = #TabManager:GetChildren()
			})
			local Visibility = false
			if #TabContainer:GetChildren() == 0 then Visibility = true end
			local Contents = PrivUntitled.MkInstance("ScrollingFrame", {
				Parent = TabContainer,
				Active = true,
				Visible = Visibility,
				BackgroundColor3 = Color3.fromRGB(40, 40, 40),
				BorderSizePixel = 0,
				Position = UDim2.new(0, 0, 1, 0),
				Size = UDim2.new(0, 640, 0, 360),
				CanvasSize = UDim2.new(0, 620, 0, 360),
				ScrollBarImageColor3 = Color3.new(100, 100, 100),
				ScrollBarImageTransparency = 0.5,
				ScrollBarThickness = 4,
				ZIndex = 0
			})
			TabButton.MouseButton1Click:Connect(function()
				if not Contents.Visible then
					for i, v in pairs(TabContainer:GetChildren()) do
						v.Visible = false
					end
					Contents.Visible = true 
				end
			end)
			TabButton.Size = UDim2.new(0, TabButton.TextBounds.X + 32, 0, 20)
			TabCanvasRefresh()
			if Mode == "Full" then
				local ContentsSize = 5
				local function GetContentsSize()
					if ContentsSize < 360 then return 360 else return ContentsSize + 5 end
				end
				local ContentsULL = PrivUntitled.MkInstance("UIListLayout", {
					Parent = Contents,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder
				})
				UntitledTab.Update = function()
					local Sz = Contents.Size.X.Offset
					Contents.CanvasSize = UDim2.new(0, Sz - 20, 0, GetContentsSize())
				end
				UntitledTab.AddWhitespace = function()
					local Sz = Contents.Size.X.Offset - 20
					local EmptyFrame = PrivUntitled.MkInstance("Frame", {
						Parent = Contents,
						ZIndex = 0,
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						Size = UDim2.new(0,Sz,0,5),
						LayoutOrder = #Contents:GetChildren()
					})
					ContentsSize = ContentsSize + 5
					UntitledTab.Update()
					return EmptyFrame
				end
				UntitledTab.AddLabel = function(Text) -- Add a label
					UntitledTab.AddWhitespace()
					local Sz = Contents.Size.X.Offset - 20
					local Label = PrivUntitled.FstMk.MkLbl(Text, Sz, Contents)
					ContentsSize = ContentsSize + 20
					UntitledTab.Update()
					return Label
				end
				UntitledTab.AddLabelButton = function(LabelText, ButtonText, Function)
					UntitledTab.AddWhitespace()
					local LabelBtnTbl = {}
					local Sz = Contents.Size.X.Offset - 20
					local HalfSize = Sz / 2
					local LblBtn = PrivUntitled.FstMk.MkFrm(Sz, Contents)
					local Label = PrivUntitled.FstMk.MkLbl(LabelText, HalfSize, LblBtn)
					local Button = PrivUntitled.FstMk.MkBtn(ButtonText, Sz - HalfSize, LblBtn)
					Button.Position = UDim2.new(0,Sz - HalfSize,0,0)
					if Function then Button.MouseButton1Click:Connect(Function) end
					LabelBtnTbl.GetInstance = function()
						return LblBtn
					end
					ContentsSize = ContentsSize + 20
					UntitledTab.Update()
					return LabelBtnTbl
				end
				UntitledTab.AddLabelTextbox = function(LabelText, TextBoxText, Function)
					UntitledTab.AddWhitespace()
					local LabelTbTbl = {}
					local Sz = Contents.Size.X.Offset - 20
					local HalfSize = Sz / 2
					local LblTb = PrivUntitled.FstMk.MkFrm(Sz, Contents)
					local Label = PrivUntitled.FstMk.MkLbl(LabelText, HalfSize, LblTb)
					local Textbox = PrivUntitled.FstMk.MkTb(TextBoxText, Sz - HalfSize, LblTb)
					Textbox.Position = UDim2.new(0,Sz - HalfSize,0,0)
					if Function then
						Textbox.FocusLost:Connect(function()
							Function(Textbox.Text)
						end)
					end
					LabelTbTbl.GetInstance = function()
						return LblTb
					end
					ContentsSize = ContentsSize + 20
					UntitledTab.Update()
					return LabelTbTbl
				end
				return UntitledTab
			elseif Mode == "Column" then
				local UntitledTab = { }
				local Turn = 0
				local LorRCz = {
					[0] = 5,
					[1] = 5
				}
				local ContentXSz = Contents.Size.X.Offset
				local HContentXSz = ContentXSz / 2
				local ContentYSz = Contents.CanvasSize.Y.Offset
				local LorR = {
					[0] = PrivUntitled.MkInstance("Frame",{
						Parent = Contents,
						BackgroundTransparency = 1,
						Size = UDim2.new(0, HContentXSz, 0, ContentYSz)
					}),
					[1] = PrivUntitled.MkInstance("Frame",{
						Parent = Contents,
						BackgroundTransparency = 1,
						Size = UDim2.new(0, HContentXSz, 0, ContentYSz),
						Position = UDim2.new(0, HContentXSz, 0, 0)
					})
				}
				local FrmSeperator = PrivUntitled.MkInstance("Frame", {
					Parent = Contents,
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					BackgroundTransparency = 0.5,
					BorderSizePixel = 0,
					Position = UDim2.new(0, HContentXSz - 1, 0, 0),
					Size = UDim2.new(0, 2, 0, ContentYSz)
				})
				local function SetContent()
					if Turn == 0 then Turn = 1 else Turn = 0 end
				end
				local function GetContentsSize()
					if LorRCz[0] < 360 and LorRCz[1] < 360 then return 360 elseif LorRCz[0] > LorRCz[1] then return LorRCz[0] + 5 else return LorRCz[1] + 5 end
				end
				for i, v in pairs(LorR) do
					PrivUntitled.MkInstance("UIListLayout", {
						Parent = v,
						HorizontalAlignment = Enum.HorizontalAlignment.Center,
						SortOrder = Enum.SortOrder.LayoutOrder
					})
				end
				UntitledTab.AddWhitespace = function(Where) -- Workaround, not intended to put this. THIS IS DIFFIRENT FROM UntitledSection.AddWhitespace()
					local Contents = LorR[Where]
					local EmptyFrame = PrivUntitled.MkInstance("Frame", {
						Parent = Contents,
						ZIndex = 0,
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						Size = UDim2.new(0,620,0,5),
						LayoutOrder = #Contents:GetChildren()
					})
					LorRCz[Where] = LorRCz[Where] + 5
					UntitledTab.Update()
					return EmptyFrame
				end
				UntitledTab.Update = function()
					Contents.CanvasSize = UDim2.new(0, Contents.Size.X.Offset - 20, 0, GetContentsSize())
					FrmSeperator.Size = UDim2.new(0, 2, 0, Contents.CanvasSize.Y.Offset)
				end
				UntitledTab.AddSection = function(SectionName)
					local UntitledSection = {}
					local WhereMe = Turn
					UntitledSection.AddWhitespace = function()
						local Contents = LorR[WhereMe]
						local Sz = Contents.Size.X.Offset - 20
						local EmptyFrame = PrivUntitled.MkInstance("Frame", {
							Parent = Contents,
							ZIndex = 0,
							BackgroundTransparency = 1,
							BorderSizePixel = 0,
							Size = UDim2.new(0,Sz,0,5),
							LayoutOrder = #Contents:GetChildren()
						})
						LorRCz[WhereMe] = LorRCz[WhereMe] + 5
						UntitledTab.Update()
						return EmptyFrame
					end
					UntitledSection.AddLabel = function(Text) -- Add a label
						UntitledSection.AddWhitespace()
						local Contents = LorR[WhereMe]
						local Sz = Contents.Size.X.Offset - 20
						local Label = PrivUntitled.FstMk.MkLbl(Text, Sz, Contents)
						LorRCz[WhereMe] = LorRCz[WhereMe] + 20
						UntitledTab.Update()
						return Label
					end
					local SectionTxt = UntitledSection.AddLabel(SectionName)
					SectionTxt.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
					SectionTxt.TextStrokeTransparency = 0.75
					UntitledSection.AddLabelButton = function(LabelText, ButtonText, Function)
						UntitledSection.AddWhitespace()
						local Contents = LorR[WhereMe]
						local LabelBtnTbl = {}
						local Sz = Contents.Size.X.Offset - 20
						local HalfSize = Sz / 2
						local LblBtn = PrivUntitled.FstMk.MkFrm(Sz, Contents)
						local Label = PrivUntitled.FstMk.MkLbl(LabelText, HalfSize, LblBtn)
						local Button = PrivUntitled.FstMk.MkBtn(ButtonText, Sz - HalfSize, LblBtn)
						Button.Position = UDim2.new(0,Sz - HalfSize,0,0)
						if Function then Button.MouseButton1Click:Connect(Function) end
						LabelBtnTbl.GetInstance = function()
							return LblBtn
						end
						LorRCz[WhereMe] = LorRCz[WhereMe] + 20
						UntitledTab.Update()
						return LabelBtnTbl
					end
					UntitledSection.AddLabelTextbox = function(LabelText, TextBoxText, Function)
						UntitledSection.AddWhitespace()
						local Contents = LorR[WhereMe]
						local LabelTbTbl = {}
						local Sz = Contents.Size.X.Offset - 20
						local HalfSize = Sz / 2
						local LblTb = PrivUntitled.FstMk.MkFrm(Sz, Contents)
						local Label = PrivUntitled.FstMk.MkLbl(LabelText, HalfSize, LblTb)
						local Textbox = PrivUntitled.FstMk.MkTb(TextBoxText, Sz - HalfSize, LblTb)
						Textbox.Position = UDim2.new(0,Sz - HalfSize,0,0)
						if Function then
							Textbox.FocusLost:Connect(function()
								Function(Textbox.Text)
							end)
						end
						LabelTbTbl.GetInstance = function()
							return LblTb
						end
						LorRCz[WhereMe] = LorRCz[WhereMe] + 20
						UntitledTab.Update()
						return LabelTbTbl
					end
					SetContent()
					return UntitledSection
				end
				return UntitledTab
			else
				error("Unknown tab mode.")
			end
		end
		return UntitledWindow
	end
}
return Untitled
