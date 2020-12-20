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
local UntitledGUI = GuiFolder:FindFirstChild("UntitledGUI") or PrivUntitled.MkInstance("ScreenGui", {Parent = GuiFolder,ResetOnSpawn = false, Name = "UntitledGUI"})

Untitled.MakeWindow = function(WindowName)
	local UntitledWindow = {}
	local TitlePosition = (#UntitledGUI:GetChildren() + 1) * 25
	if (#UntitledGUI:GetChildren() > 0) then
		TitlePosition = TitlePosition + #UntitledGUI:GetChildren() * 225
	end
	local Title = PrivUntitled.MkInstance("TextLabel", {
		Name = WindowName,
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
	local Contents = PrivUntitled.MkInstance("Frame", {
		Name = "Contents",
		Parent = Title,
		BackgroundColor3 = Color3.fromRGB(40, 40, 40),
		BorderSizePixel = 0,
		ZIndex = 0,
		Size = UDim2.new(0, 225, 0, 0),
		Position = UDim2.new(0,0,1, 0)
	})
	local Tweening = false
	local ContentsSize = 0
	MinMaxBtn.MouseButton1Click:Connect(function()
		if not Tweening then
			Tweening = true
			if Contents.Size == UDim2.new(0,225,0,0) then
				MinMaxBtn.Text = "-"
				Contents:TweenSize(UDim2.new(0,225,0,ContentsSize), Enum.EasingDirection.Out, Enum.EasingStyle.Sine, ContentsSize / 500, false, function()
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
				Contents:TweenSize(UDim2.new(0,225,0,0), Enum.EasingDirection.In, Enum.EasingStyle.Sine, ContentsSize / 500, false, function()
					Tweening = false
				end)	
			end
		end
	end)
	-- Drag (from Finity V2 (MIT))
	local HoveringTopbar, Dragging, MouseOffset = false, false, nil
	Title.MouseEnter:Connect(function()
		HoveringTopbar = true
	end)

	Title.MouseLeave:Connect(function()
		HoveringTopbar = false
	end)
	local function DragWindow()
		spawn(function()
			while Dragging and MouseOffset do
				if Title then
					Title:TweenPosition(UDim2.new(0, Mouse.X - MouseOffset.X, 0, Mouse.Y - MouseOffset.Y), "Out", "Sine", 0.1, true)
				end
				wait()
			end
			if Title then
				Title:TweenPosition(UDim2.new(0, Mouse.X - MouseOffset.X, 0, Mouse.Y - MouseOffset.Y), "Out", "Sine", 0.1, true)
			end
			MouseOffset = nil
		end)
	end
	UserInputService.InputBegan:Connect(function(Input)
		if Input.UserInputType == Enum.UserInputType.MouseButton1 then
			if HoveringTopbar then
				MouseOffset = {
					X = Mouse.X - Title.AbsolutePosition.X,
					Y = Mouse.Y - Title.AbsolutePosition.Y
				}
				Dragging = true
				DragWindow()
			end
		end
	end)
	UserInputService.InputEnded:Connect(function(Input)
		if Input.UserInputType == Enum.UserInputType.MouseButton1 then
			Dragging = false
		end
	end)
	local ContentsULL = PrivUntitled.MkInstance("UIListLayout", {
		Parent = Contents,
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		SortOrder = Enum.SortOrder.LayoutOrder
	})

	-- Functions
	UntitledWindow.Rerender = function() -- Re-render the UI
		Contents.Size = UDim2.new(0, 225, 0, ContentsSize)
	end

	UntitledWindow.AddWhitespace = function() -- ADd empty frame to Contents
		local YO = 3.5
		local EmptyFrame = PrivUntitled.MkInstance("Frame", {
			Parent = Contents,
			ZIndex = 0,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(0,225,0,YO),
			LayoutOrder = #Contents:GetChildren()
		})
		ContentsSize = ContentsSize + YO
		UntitledWindow.Rerender()
		return EmptyFrame
	end

	UntitledWindow.AddLabel = function(Text) -- Add a label
		UntitledWindow.AddWhitespace()
		local YO = 20
		local Label = PrivUntitled.MkInstance("TextLabel",{
			Parent = Contents,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(0,215,0,YO),
			ZIndex = 0,
			Font = Enum.Font.Ubuntu,
			Text = Text,
			TextColor3 = Color3.fromRGB(255,255,255),
			TextSize = 16,
			TextXAlignment = Enum.TextXAlignment.Left,
			LayoutOrder = #Contents:GetChildren()
		})
		ContentsSize = ContentsSize + YO
		UntitledWindow.AddWhitespace()
		UntitledWindow.Rerender()
		return Label
	end

	UntitledWindow.AddSection = function(Text) -- Add a section
		UntitledWindow.AddWhitespace()
		local YO = 20
		local Label = PrivUntitled.MkInstance("TextLabel",{
			Parent = Contents,
			BackgroundColor3 = Color3.fromRGB(30, 30, 30),
			BackgroundTransparency = 0,
			BorderSizePixel = 0,
			Size = UDim2.new(0,215,0,YO),
			ZIndex = 0,
			Font = Enum.Font.Ubuntu,
			Text = Text,
			TextColor3 = Color3.fromRGB(255,255,255),
			TextSize = 16,
			TextXAlignment = Enum.TextXAlignment.Center,
			LayoutOrder = #Contents:GetChildren()
		})
		ContentsSize = ContentsSize + YO
		UntitledWindow.AddWhitespace()
		UntitledWindow.Rerender()
		return Label
	end

	UntitledWindow.AddButton = function(Text, Function)
		UntitledWindow.AddWhitespace()
		local YO = 20
		local Button = PrivUntitled.MkInstance("TextButton",{
			Parent = Contents,
			BackgroundColor3 = Color3.fromRGB(30, 30, 30),
			BorderColor3 = Color3.fromRGB(100,100,100),
			BackgroundTransparency = 0,
			BorderSizePixel = 1,
			ZIndex = 0,
			Size = UDim2.new(0,215,0,YO),
			Font = Enum.Font.Ubuntu,
			Text = Text,
			TextColor3 = Color3.fromRGB(255,255,255),
			TextSize = 16,
			TextXAlignment = Enum.TextXAlignment.Center,
			LayoutOrder = #Contents:GetChildren()
		})
		if Function then
			Button.MouseButton1Click:Connect(Function)
		end
		ContentsSize = ContentsSize + YO
		UntitledWindow.AddWhitespace()
		UntitledWindow.Rerender()
		return Button
	end

	UntitledWindow.AddTextbox = function(Text, Function)
		UntitledWindow.AddWhitespace()
		local YO = 20
		local Textbox = PrivUntitled.MkInstance("TextBox",{
			Parent = Contents,
			BackgroundColor3 = Color3.fromRGB(30, 30, 30),
			BorderColor3 = Color3.fromRGB(100,100,100),
			BackgroundTransparency = 0,
			ZIndex = 0,
			ClearTextOnFocus = false,
			PlaceholderColor3 = Color3.fromRGB(178, 178, 178),
			PlaceholderText = Text,
			BorderSizePixel = 1,
			Size = UDim2.new(0,215,0,YO),
			Font = Enum.Font.Ubuntu,
			Text = "",
			TextColor3 = Color3.fromRGB(255,255,255),
			TextSize = 16,
			TextWrapped = true,
			TextXAlignment = Enum.TextXAlignment.Center,
			LayoutOrder = #Contents:GetChildren()
		})
		if Function then
			Textbox.FocusLost:Connect(function()
				Function(Textbox.Text)
			end)
		end
		ContentsSize = ContentsSize + YO
		UntitledWindow.AddWhitespace()
		UntitledWindow.Rerender()
		return Textbox
	end

	UntitledWindow.AddCheckbox = function(Text, Function)
		UntitledWindow.AddWhitespace()
		local CheckboxTbl = {
			Checked = false
		}
		local YO = 20
		local Checkbox = PrivUntitled.MkInstance("Frame", {
			Parent = Contents,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ZIndex = 0,
			Size = UDim2.new(0,215,0,YO),
			LayoutOrder = #Contents:GetChildren()
		})
		local Label = PrivUntitled.MkInstance("TextLabel",{
			Parent = Checkbox,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Position = UDim2.new(0,0,0,0),
			Size = UDim2.new(0,195,0,YO),
			Font = Enum.Font.Ubuntu,
			Text = Text,
			ZIndex = 0,
			TextColor3 = Color3.fromRGB(255,255,255),
			TextSize = 16,
			TextXAlignment = Enum.TextXAlignment.Left,
		})
		local Button = PrivUntitled.MkInstance("TextButton",{
			Parent = Checkbox,
			BackgroundColor3 = Color3.fromRGB(30, 30, 30),
			BorderColor3 = Color3.fromRGB(100,100,100),
			BackgroundTransparency = 0,
			BorderSizePixel = 1,
			Position = UDim2.new(0,195,0,0),
			Size = UDim2.new(0,20,0,YO),
			Text = "",
			ZIndex = 0,
			TextColor3 = Color3.fromRGB(255,255,255),
			TextSize = 14,
			TextXAlignment = Enum.TextXAlignment.Center,
		})
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
		UntitledWindow.AddWhitespace()
		UntitledWindow.Rerender()
		return CheckboxTbl
	end

	UntitledWindow.AddDropdown = function(Selections, Function)
		UntitledWindow.AddWhitespace()
		local YO = 20
		local DropdownTbl = {
			Selected = nil
		}
		local ToggleBtn = PrivUntitled.MkInstance("TextButton",{
			Parent = Contents,
			BackgroundColor3 = Color3.fromRGB(30, 30, 30),
			BorderColor3 = Color3.fromRGB(100,100,100),
			BackgroundTransparency = 0,
			BorderSizePixel = 1,
			ZIndex = 0,
			Size = UDim2.new(0,215,0,YO),
			Font = Enum.Font.Ubuntu,
			Text = "",
			TextColor3 = Color3.fromRGB(255,255,255),
			TextSize = 16,
			TextXAlignment = Enum.TextXAlignment.Center,
			LayoutOrder = #Contents:GetChildren()
		})
		local Label = PrivUntitled.MkInstance("TextLabel",{
			Parent = ToggleBtn,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Position = UDim2.new(0,195,0,0),
			Size = UDim2.new(0,20,0,20),
			ZIndex = 0,
			Font = Enum.Font.SourceSans,
			Text = "↓",
			TextColor3 = Color3.fromRGB(255,255,255),
			TextSize = 16
		})
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
			local SelectionBtn = PrivUntitled.MkInstance("TextButton",{
				Parent = DropdownContents,
				BackgroundColor3 = Color3.fromRGB(30, 30, 30),
				BorderColor3 = Color3.fromRGB(100,100,100),
				BackgroundTransparency = 0,
				BorderSizePixel = 1,
				Size = UDim2.new(0,215,0,20),
				Font = Enum.Font.Ubuntu,
				Text = Text,
				ZIndex = 1,
				TextColor3 = Color3.fromRGB(255,255,255),
				TextSize = 16,
				TextXAlignment = Enum.TextXAlignment.Center,
				LayoutOrder = #DropdownContents:GetChildren()
			})
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
		UntitledWindow.AddWhitespace()
		UntitledWindow.Rerender()
		return DropdownTbl
	end

	UntitledWindow.AddLabelButton = function(LabelText, ButtonText, Function)
		UntitledWindow.AddWhitespace()
		local LabelBtnTbl = {}
		local YO = 20
		local LblBtn = PrivUntitled.MkInstance("Frame", {
			Parent = Contents,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ZIndex = 0,
			Size = UDim2.new(0,215,0,YO),
			LayoutOrder = #Contents:GetChildren()
		})
		local Label = PrivUntitled.MkInstance("TextLabel",{
			Parent = LblBtn,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Position = UDim2.new(0,0,0,0),
			Size = UDim2.new(0,107.5,0,YO),
			Font = Enum.Font.Ubuntu,
			Text = LabelText,
			ZIndex = 0,
			TextColor3 = Color3.fromRGB(255,255,255),
			TextSize = 16,
			TextXAlignment = Enum.TextXAlignment.Left,
		})
		local Button = PrivUntitled.MkInstance("TextButton",{
			Parent = LblBtn,
			BackgroundColor3 = Color3.fromRGB(30, 30, 30),
			BorderColor3 = Color3.fromRGB(100,100,100),
			BackgroundTransparency = 0,
			BorderSizePixel = 1,
			Position = UDim2.new(0,107.5,0,0),
			Size = UDim2.new(0,107.5,0,YO),
			ZIndex = 0,
			Font = Enum.Font.Ubuntu,
			Text = ButtonText,
			TextColor3 = Color3.fromRGB(255,255,255),
			TextSize = 16,
			TextXAlignment = Enum.TextXAlignment.Center,
		})
		if Function then Button.MouseButton1Click:Connect(Function) end
		LabelBtnTbl.GetInstance = function()
			return LblBtn
		end
		ContentsSize = ContentsSize + YO
		UntitledWindow.AddWhitespace()
		UntitledWindow.Rerender()
		return LabelBtnTbl
	end
	return UntitledWindow
end
return Untitled
