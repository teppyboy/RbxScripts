# [UntitledUI](https://raw.githubusercontent.com/teppyboy/RbxScripts/master/Misc/UntitledUI/Library.lua)
> A Wally's UI Library v2 ripoff for myself
# Example
```lua
local Untitled = loadstring(game:HttpGet("https://raw.githubusercontent.com/teppyboy/RbxScripts/master/Misc/UntitledUI/Library.lua"))()
local Window1 = Untitled.MakeWindow("Window1")
local Window2 = Untitled.MakeWindow("Window2")
local Wnd1Txt = Window1.AddLabel("Hi, "..game.Players.LocalPlayer.Name)
local Wnd1Txt = Window1.AddButton("Welcome to UntitledUI!", function() print("Wow you actually clicked this") end)
local Wnd1Tb = Window1.AddTextbox("Waifuverse", function(Text) print("UwU: "..Text) end)
local Wnd2Checkbox = Window2.AddCheckbox("Select me!",function(Checked) print("Selected: "..tostring(Checked)) end)
local Wnd2Dropdown = Window2.AddDropdown({"Patreon","Only(real)fans","Rubberroad","Pixiv #1", "Trash Pinterest"},function(Selected) print("Selected Value: "..Selected) end)
```
# Documentation
+ We'll use the variable listed in here as example:
```lua
local Untitled = loadstring(game:HttpGet("https://raw.githubusercontent.com/teppyboy/RbxScripts/master/Misc/UntitledUI/Library.lua"))()
```
## Classes
### Untitled
#### (UntitledWindow) Untitled.MakeWindow(string WindowName)
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

### UntitledCheckbox
#### (bool) UntitledCheckbox.Checked
+ Return if checkbox is checked.
#### (Frame) UntitledCheckbox.Instance
+ Return the top GUI Instance that is used by UntitledCheckbox

### UntitledDropdown
#### (string) UntitledDropdown.Selected
+ Return selected content.
#### (TextButton) UntitledDropdown.AddSelection(string Text)
+ Add a selection to dropdown content
#### (nil) UntitledDropdown.Update()
+ Update the Dropdown to match the latest values.
#### (TextButton) UntitledDropdown.Instance
+ Return the top GUI Instance that is used by UntitledDropdown

# More features will be added in the future, stay soon!
