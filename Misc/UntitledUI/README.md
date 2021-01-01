# [UntitledUI](https://raw.githubusercontent.com/teppyboy/RbxScripts/master/Misc/UntitledUI/Library.lua)
> A Wally's UI Library v2 ripoff for myself
# Example
```lua
local Untitled = loadstring(game:HttpGet("https://raw.githubusercontent.com/teppyboy/RbxScripts/master/Misc/UntitledUI/Library.lua"))()
local UV1 = Untitled.V1
local Window1 = UV1.MakeWindow("Window1")
local Window2 = UV1.MakeWindow("Window2")
local Wnd1Txt = Window1.AddLabel("Hi, "..game.Players.LocalPlayer.Name)
local Wnd1Txt = Window1.AddButton("Welcome to UntitledUI!", function() print("Wow you actually clicked this") end)
local Wnd1Tb = Window1.AddTextbox("Waifuverse", function(Text) print("UwU: "..Text) end)
local Wnd2Checkbox = Window2.AddCheckbox("Select me!",function(Checked) print("Selected: "..tostring(Checked)) end)
local Wnd2Dropdown = Window2.AddDropdown({"Patreon","Only(real)fans","Rubberroad","Pixiv #1", "Trash Pinterest"},function(Selected) print("Selected Value: "..Selected) end)
local Wnd2HybridBtn = Window1.AddLabelButton("UwU", "Button", function() print("WuW") end)
```
# Documentation
+ We'll use the variable listed in here as example:
```lua
local Untitled = loadstring(game:HttpGet("https://raw.githubusercontent.com/teppyboy/RbxScripts/master/Misc/UntitledUI/Library.lua"))()
```
# Classes
## Untitled
#### (nil) Untitled.BindToggleKey(KeyCode NewKey)
+ Bind a new KeyCode to toggle the GUI
#### (V1) Untitled.V1
+ Access the V1 version of UntitledUI
#### (nil) Untitled.SetGUIName(string Name)
+ Set the GUI instance used by Untitled to [Name]
#### (ScreenGui?) Untitled.GetInstance()
+ Return the top GUI instance that is used by Untitled
## V1
#### [V1] (Window) UntitledV1.MakeWindow(string WindowName)
+ Make a new window and return the window
## Window
#### (nil) Window.Update()
+ Re-render the window created by MakeWindow.
#### (Frame) Window.AddWhitespace()
+ Add a whitespace to the window's content.
#### (TextLabel) Window.AddLabel(string Text)
+ Add a TextLabel to the window's content.
#### (TextButton) Window.AddButton(string Text, function() Function = nil)
+ Add a TextButton to the window's content and execute Function when user click the button if specified.
#### (TextBox) Window.AddTextbox(string PlaceholderText, function(string Text) Function = nil)
+ Add a TextBox to the window's content and execute Function when user lost focus if specified.
#### (heckbox) Window.AddCheckbox(string Text, function(bool Checked) Function = nil)
+ Add a Checkbox to the window's content and execute Function when user check/uncheck if specified.
#### (Dropdown) Window.AddDropdown(table Selections, function(string Selection) Function = nil)
+ Add a Dropdown to the window's content and execute Function when user select an item in item list if specified.
#### (LabelButton) Window.AddLabelButton(string LabelText, string ButtonText, function() Function = nil)
+ Add a LabelButton to the window's content and execute Function when user click the button if specified.
#### (LabelTextbox) Window.AddLabelTextbox(string LabelText, string TextBoxText, function(string Text) Function = nil)
+ Add a LabelTextbox to the window's content and execute Function when user lost focus if specified.

## Checkbox
#### (bool) Checkbox.Checked
+ Return if checkbox is checked.
#### (Frame) Checkbox.GetInstance()
+ Return the top GUI Instance that is used by Checkbox

## Dropdown
#### (string) Dropdown.Selected
+ Return selected content.
#### (TextButton) Dropdown.AddSelection(string Text)
+ Add a selection to dropdown content
#### (nil) Dropdown.Update()
+ Update the Dropdown to match the latest values.
#### (TextButton) Dropdown.GetInstance()
+ Return the top GUI Instance that is used by Dropdown

## LabelButton
#### (Frame) LabelButton.GetInstance()
+ Return the top GUI Instance that is used by LabelButton

## LabelTextbox
#### (Frame) LabelTextbox.GetInstance()
+ Return the top GUI Instance that is used by LabelTextbox

# More features will be added in the future, stay soon!
