local VirtualUser = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
    VirtualUser:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    wait(1)
    VirtualUser:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:getService("RunService")
local HttpService = game:GetService("HttpService")

local Finity = loadstring(game:HttpGet("http://finity.vip/scripts/finity_lib.lua"))()
local FinityWindow = Finity.new(true,"SpeedGui by iceskiddo @ v3rm | Use [RightControl] to toggle the GUI") -- 'true' means dark mode is enabled
FinityWindow.ChangeToggleKey(Enum.KeyCode.RightControl)
local AutoCategory = FinityWindow:Category("Automation") -- name is the name of the FinityCategory
local Auto = {}

local FarmSector = AutoCategory:Sector("Farm") -- name is the name of the FinityCategory
Auto.Farm = {}
Auto.Farm.Mode = "BindToRenderStep"
Auto.Farm.Enabled = false
Auto.Farm.SteppedConnected = nil
Auto.Farm.FarmPerFrame = 1
Auto.Farm.WaitTime = 0
Auto.Farm.FarmFunction = function()
    if Auto.Farm.Enabled then
        for i = 0, Auto.Farm.FarmPerFrame do
            ReplicatedStorage.Remotes.AddSpeed:FireServer()
        end
        wait(Auto.Farm.WaitTime)
    end
end

FarmSector:Cheat("Dropdown", "Farm Mode", function(Option)
    print("Dropdown option changed:", Option)
    Auto.Farm.Mode = Option
end, {
	options = {
		"BindToRenderStep",
		"Stepped",
		"Loop"
	}
})
FarmSector:Cheat("Label", "Farm Speed: BindToRenderStep > Stepped > Loop")
FarmSector:Cheat("Label", "You must use the mode used to farm to disable!")
FarmSector:Cheat("Textbox", "Farm Per Frame", function(Value)
    local sucess = pcall(function() Auto.Farm.FarmPerFrame = tonumber(Value) end)
    if not sucess then
        Auto.Farm.FarmPerFrame = 1
    end
end, {
	placeholder = "1"
})
FarmSector:Cheat("Label", "More FPF is faster but the chance of Rebirth get")
FarmSector:Cheat("Label", "bugged is very high, so set a reasonable value.")
FarmSector:Cheat("Textbox", "Delay After Event", function(Value)
    pcall(function() Auto.Farm.WaitTime = tonumber(Value) end)
    if not sucess then
        Auto.Farm.WaitTime = 0
    end
end, {
	placeholder = "1"
})
FarmSector:Cheat("Label", "Because high FPF = more Ping so you need to")
FarmSector:Cheat("Label", "decrease ping to avoid being kicked!")
FarmSector:Cheat("Checkbox", "Farm Enabled", function(enabled)
    Auto.Farm.Enabled = enabled
    if (Auto.Farm.Enabled) then
        if (Auto.Farm.Mode == "BindToRenderStep") then
            RunService:BindToRenderStep("Auto.Farm",0, Auto.Farm.FarmFunction)
        elseif (Auto.Farm.Mode == "Stepped") then
            Auto.Farm.SteppedConnected = RunService.Stepped:Connect(Auto.Farm.FarmFunction)
        elseif (Auto.Farm.Mode == "Loop") then
            while Auto.Farm.Mode do
                Auto.Farm.FarmFunction()
                wait()
            end
        end
    else
        if (Auto.Farm.Mode == "BindToRenderStep") then
            RunService:UnbindFromRenderStep("Auto.Farm")
        elseif (Auto.Farm.Mode == "Stepped") then
            Auto.Farm.SteppedConnected:Disconnect()
        end
    end
end, {})

local OrbSector = AutoCategory:Sector("Orb") -- name is the name of the FinityCategory
Auto.Orb = {}
Auto.Orb.Mode = "BindToRenderStep"
Auto.Orb.Enabled = false
Auto.Orb.SteppedConnected = nil
Auto.Orb.FarmFunction = function()
    if Auto.Orb.Enabled then
        for i,v in pairs(game.Workspace.OrbSpawns:GetChildren()) do
            if Auto.Orb.Enabled and (v.Name == "Orb" or v.Name == "Ring") then
                if v:GetChildren()["Picked"] ~= nil then v:GetChildren()["Picked"]:Destroy() end
                v.Transparency = 1
                v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                wait()
            end
        end
    end
end

OrbSector:Cheat("Dropdown", "Orb Farm Mode", function(Option)
    print("Dropdown option changed:", Option)
    Auto.Orb.Mode = Option
end, {
	options = {
		"BindToRenderStep",
		"Stepped",
		"Loop"
	}
})
OrbSector:Cheat("Label", "Farm Speed: BindToRenderStep > Stepped > Loop")
OrbSector:Cheat("Label", "You must use the mode used to orb farm to disable!")
OrbSector:Cheat("Checkbox", "Orb Farm Enabled", function(enabled)
    Auto.Orb.Enabled = enabled
    if (Auto.Orb.Enabled) then
        if (Auto.Orb.Mode == "BindToRenderStep") then
            RunService:BindToRenderStep("Auto.Orb",0, Auto.Orb.FarmFunction)
        elseif (Auto.Orb.Mode == "Stepped") then
            Auto.Orb.SteppedConnected = RunService.Stepped:Connect(Auto.Orb.FarmFunction)
        elseif (Auto.Orb.Mode == "Loop") then
            while Auto.Orb.Mode do
                Auto.Orb.FarmFunction()
                wait()
            end
        end
    else
        if (Auto.Orb.Mode == "BindToRenderStep") then
            RunService:UnbindFromRenderStep("Auto.Orb")
        elseif (Auto.Orb.Mode == "Stepped") then
            Auto.Orb.SteppedConnected:Disconnect()
        end
    end
end, {})

local RebirthSector = AutoCategory:Sector("Rebirth") -- name is the name of the FinityCategory
Auto.Rebirth = {}
Auto.Rebirth.Mode = "BindToRenderStep"
Auto.Rebirth.Enabled = false
Auto.Rebirth.SteppedConnected = nil
Auto.Rebirth.FarmFunction = function()
    if Auto.Rebirth.Enabled then
        ReplicatedStorage.Remotes.Rebirth:FireServer()
    end
end

RebirthSector:Cheat("Dropdown", "Rebirth Mode", function(Option)
    print("Dropdown option changed:", Option)
    Auto.Rebirth.Mode = Option
end, {
	options = {
        "BindToRenderStep",
        "Loop",
        "Stepped"
    }
})
RebirthSector:Cheat("Label", "Stable Rate: BindToRenderStep > Loop > Stepped")
RebirthSector:Cheat("Label", "Loop will rebirth slower but less lag than BTRS")
RebirthSector:Cheat("Label", "You must use the mode used to Rebirth to disable!")
RebirthSector:Cheat("Checkbox", "Rebirth Enabled", function(enabled)
    Auto.Rebirth.Enabled = enabled
    if (Auto.Rebirth.Enabled) then
        if (Auto.Rebirth.Mode == "BindToRenderStep") then
            RunService:BindToRenderStep("Auto.Rebirth",0, Auto.Rebirth.FarmFunction)
        elseif (Auto.Rebirth.Mode == "Stepped") then
            Auto.Rebirth.SteppedConnected = RunService.Stepped:Connect(Auto.Rebirth.FarmFunction)
        elseif (Auto.Rebirth.Mode == "Loop") then
            while Auto.Rebirth.Mode and wait(0.01) do
                Auto.Rebirth.FarmFunction()
            end
        end
    else
        if (Auto.Rebirth.Mode == "BindToRenderStep") then
            RunService:UnbindFromRenderStep("Auto.Rebirth")
        elseif (Auto.Rebirth.Mode == "Stepped") then
            Auto.Rebirth.SteppedConnected:Disconnect()
        end
    end
end, {})

local PetsSector = AutoCategory:Sector("Pets - BUGGED") -- name is the name of the FinityCategory
Auto.Pets = {}
Auto.Pets.OpenEgg = {}
Auto.Pets.OpenEgg.Enabled = false
Auto.Pets.OpenEgg.Egg = "EggOne"
Auto.Pets.OpenEgg.AllEggs = {}
Auto.Pets.OpenEgg.FarmFunction = function()
    while Auto.Pets.OpenEgg.Enabled and wait(0.01) do
        ReplicatedStorage.Remotes.CanBuyEgg:InvokeServer(Auto.Pets.OpenEgg.Egg)
    end
end
for i, v in pairs(game.Players.LocalPlayer.PlayerGui.V2:GetChildren()) do
    if v:IsA("BillboardGui") then
        table.insert(Auto.Pets.OpenEgg.AllEggs, v.Name)
    end
end
PetsSector:Cheat("Dropdown", "Egg To Open", function(Option)
    print("Dropdown option changed:", Option)
    Auto.Pets.OpenEgg.Egg = Option
end, {
	options = Auto.Pets.OpenEgg.AllEggs
})
PetsSector:Cheat("Checkbox", "Open Egg Enabled", function(enabled)
    Auto.Pets.OpenEgg.Enabled = enabled
    if (Auto.Pets.OpenEgg.Enabled) then
        Auto.Pets.OpenEgg.FarmFunction()
    end
end, {})
Auto.Pets.UpgradeEgg = {}
Auto.Pets.UpgradeEgg.Enabled = false
Auto.Pets.UpgradeEgg.FarmFunction = function()
    while Auto.Pets.UpgradeEgg.Enabled and wait(0.1) do
        for i, v in pairs(HttpService:JSONDecode(game.Players.LocalPlayer.Pets.Value)) do
            ReplicatedStorage.Remotes.UpgradePet:FireServer(v)
        end
    end
end
PetsSector:Cheat("Checkbox", "Upgrade Pets Enabled", function(enabled)
    Auto.Pets.UpgradeEgg.Enabled = enabled
    if (Auto.Pets.UpgradeEgg.Enabled) then
        Auto.Pets.UpgradeEgg.FarmFunction()
    end
end, {})
Auto.Pets.EquipEgg = {} 
Auto.Pets.EquipEgg.Enabled = false
Auto.Pets.EquipEgg.FarmFunction = function()
    while Auto.Pets.EquipEgg.Enabled and wait(0.1) do
        for i, v in pairs(HttpService:JSONDecode(game.Players.LocalPlayer.Pets.Value)) do
            ReplicatedStorage.Remotes.PetEquip:FireServer(v)
            wait(0.001)
        end
    end
end
PetsSector:Cheat("Button", "Equip all Pets", function(enabled)
    while Auto.Pets.UpgradeEgg.Enabled and wait(0.1) do
        for i, v in pairs(HttpService:JSONDecode(game.Players.LocalPlayer.Pets.Value)) do
            ReplicatedStorage.Remotes.UpgradePet:FireServer(v)
        end
    end
end)
PetsSector:Cheat("Label", "It wont show equipped but dont worry still count")
PetsSector:Cheat("Button", "Unequip all Pets", function()
    for i, v in pairs(HttpService:JSONDecode(game.Players.LocalPlayer.Pets.Value)) do
        ReplicatedStorage.Remotes.PetUnequip:FireServer(v)
    end
end)
local MiscSector = AutoCategory:Sector("Miscellaneous") -- name is the name of the FinityCategory
Auto.Misc = {}
Auto.Misc.AutoGGRace = {}
Auto.Misc.AutoGGRace.Enabled = false
Auto.Misc.AutoGGRace.FarmFunction = function()
    while Auto.Misc.AutoGGRace.Enabled and wait(0.1) do
        if string.find(game.Players.LocalPlayer.PlayerGui.MainUI.RaceNotif.Time.Text,"A RACE IS STARTING, WANT TO JOIN?") then
            local orgPos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            ReplicatedStorage.Remotes.RaceTrigger:FireServer()
            game.Workspace.RaceEnd.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            ReplicatedStorage.Remotes.RaceResults:FireServer()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = orgPos
        end    
    end
end
MiscSector:Cheat("Checkbox", "Race Enabled", function(enabled)
    Auto.Misc.AutoGGRace.Enabled = enabled
    if (Auto.Misc.AutoGGRace.Enabled) then
        Auto.Misc.AutoGGRace.FarmFunction()
    end
end, {})

local TpCategory = FinityWindow:Category("Teleports") -- name is the name of the FinityCategory
local DoorSector = TpCategory:Sector("Doors") -- name is the name of the FinityCategory
for i, v in pairs(game.Workspace.Teleports:GetChildren()) do
    DoorSector:Cheat("Button", v.Name.." Door", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
    end)
end
