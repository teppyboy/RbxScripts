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
+ **UntitledV1 classes ARE diffirent from UntitledV2 classes (Ex: UntitledV1.UntitledWindow =/= UntitledV2.UntitledWindow)
+ We'll use the variable listed in here as example:
```lua
local Untitled = loadstring(game:HttpGet("https://raw.githubusercontent.com/teppyboy/RbxScripts/master/Misc/UntitledUI/Library.lua"))()
```
## Classes
### Untitled
#### (nil) Untitled.BindToggleKey(KeyCode NewKey)
+ Bind a new KeyCode to toggle the GUI
#### (UntitledV1) Untitled.V1
+ Access the V1 version of UntitledUI
#### (nil) Untitled.SetGUIName(string Name)
+ Set the GUI instance used by Untitled to [Name]
#### (ScreenGui?) Untitled.GetInstance()
+ Return the top GUI instance that is used by Untitled
### UntitledV1
#### (UntitledWindow) UntitledV1.MakeWindow(string WindowName)
+ Make a new window and return the window
### UntitledWindow
#### (nil) UntitledWindow.Rerender()
+ Re-render the window created by MakeWindow.
#### (Frame) UntitledWindow.AddWhitespace()
+ Add a whitespace to the window's content.
#### (TextLabel) UntitledWindow.AddLabel(string Text)
+ Add a TextLabel to the window's content.
#### (TextButton) UntitledWindow.AddButton(string Text, function() Function = nil)
+ Add a TextButton to the window's content and execute Function when user click the button if specified.
#### (TextBox) UntitledWindow.AddTextbox(string PlaceholderText, function(string Text) Function = nil)
+ Add a TextBox to the window's content and execute Function when user lost focus if specified.
#### (UntitledCheckbox) UntitledWindow.AddCheckbox(string Text, function(bool Checked) Function = nil)
+ Add an UntitledCheckbox to the window's content and execute Function when user check/uncheck if specified.
#### (UntitledDropdown) UntitledWindow.AddDropdown(table Selections, function(string Selection) Function = nil)
+ Add an UntitledDropdown to the window's content and execute Function when user select an item in item list if specified.
#### (UntitledLabelButton) UntitledWindow.AddLabelButton(string LabelText, string ButtonText, function() Function = nil)
+ Add a UntitledLabelButton to the window's content and execute Function when user click the button if specified.
#### (UntitledLabelTextBox) UntitledWindow.AddLabelTextBox(string LabelText, string TextBoxText, function(string Text) Function = nil)
+ Add a UntitledLabelTextBox to the window's content and execute Function when user lost focus if specified.

### UntitledCheckbox
#### (bool) UntitledCheckbox.Checked
+ Return if checkbox is checked.
#### (Frame) UntitledCheckbox.GetInstance()
+ Return the top GUI Instance that is used by UntitledCheckbox

### UntitledDropdown
#### (string) UntitledDropdown.Selected
+ Return selected content.
#### (TextButton) UntitledDropdown.AddSelection(string Text)
+ Add a selection to dropdown content
#### (nil) UntitledDropdown.Update()
+ Update the Dropdown to match the latest values.
#### (TextButton) UntitledDropdown.GetInstance()
+ Return the top GUI Instance that is used by UntitledDropdown

### UntitledLabelButton
#### (Frame) UntitledLabelButton.GetInstance()
+ Return the top GUI Instance that is used by UntitledLabelButton

### UntitledLabelTextBox
#### (Frame) UntitledLabelTextBox.GetInstance()
+ Return the top GUI Instance that is used by UntitledLabelTextBox

# More features will be added in the future, stay soon!
