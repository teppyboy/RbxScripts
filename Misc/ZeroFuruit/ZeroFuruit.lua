-- Variables
local VU = game:GetService("VirtualUser")
local TS = game:GetService("TweenService")
local RS = game:GetService('RunService')
local BlxFrtVars = {}
BlxFrtVars.Players = game:GetService("Players")
BlxFrtVars.LocalPlayer = BlxFrtVars.Players.LocalPlayer
BlxFrtVars.Character = BlxFrtVars.LocalPlayer.Character
BlxFrtVars.Humanoid = BlxFrtVars.Character.Humanoid
BlxFrtVars.WeaponHasKb = false
BlxFrtVars.AutoQuest = false
BlxFrtVars.AutoFarm = false
BlxFrtVars.AutoQuest = false
BlxFrtVars.EquipItemOnBoot = ""
BlxFrtVars.TeleportMode = "Auto" -- can be Auto/Unsafe/Safe (Auto = auto, Unsafe = always shamblesTo(), Safe = always moveTo())
BlxFrtVars.AutoClick = false
BlxFrtVars.HWAutoClick = false
BlxFrtVars.ACInterval = 0.1
BlxFrtVars.AntiAFKBypass = false
BlxFrtVars.EquipAccesoryOnBoot = ""
BlxFrtVars.EquipBusoOnBoot = false
BlxFrtVars.AutoSprintOnBoot = false
BlxFrtVars.MainGUI = BlxFrtVars.LocalPlayer.PlayerGui.Main
BlxFrtVars.DialogFrame = BlxFrtVars.MainGUI.Dialogue
BlxFrtVars.Buttons = {}
BlxFrtVars.Buttons.Z = false
BlxFrtVars.Buttons.X = false
BlxFrtVars.Buttons.C = false
BlxFrtVars.Buttons.V = false
BlxFrtVars.Buttons.F = false
BlxFrtVars.Buttons.T = false
-- Unstable features variables
BlxFrtVars.UAutoLSD = false
BlxFrtVars.UBuddhaFix = false -- Not used by anything atm
-- Load the configuration.
local EXPLOIT = nil
local noticeTxt = ""
if not WRDAPI then -- WTF? WeAreDevs can't even do some shit in blacklisting check???
    local jsCFG = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://raw.githubusercontent.com/teppyboy/RbxScripts/master/Misc/ZeroFuruit/ZeroFuruitCfg.json"))
    print("ZeroFuruit version: "..jsCFG.version)
    local function isStringInTable(tablee, stringg)
        for i, v in pairs(tablee) do
            if v == stringg then
                return true
            end
        end
        return false
    end
    local function actionAnalyzer(actionname, reason)
        if (actionname == "kick") then
            BlxFrtVars.LocalPlayer:Kick(reason)
        elseif (actionname == "print") then
            print(reason)
        elseif (actionname == "warn") then
            warn(reason)
        end
    end
    for i, v in pairs(jsCFG.exploits) do
        print("Exploit check: "..v.name)
        local isExp = false
        for ba, ka in pairs(v.functions) do
            print("Begin check for function: "..ka)
            if getgenv()[ka] and not isStringInTable(v.fakefunctions,ka) then
                print("The exploit is '"..v.name.."'")
                isExp = true
                EXPLOIT = v.name
                actionAnalyzer(v.action, v.reason)
                break
            end
        end
        if not isExp then
            print("The exploit is not '"..v.name.."'")
        else
            break
        end
    end
    if EXPLOIT == nil then
        print("Unknown exploit, setting to Generic type")
        EXPLOIT = "generic"
    end
    -- Fetch notice text.
    for i, v in pairs(jsCFG.notice) do
        noticeTxt = noticeTxt..v..string.char(10)
    end
else
    BlxFrtVars.LocalPlayer:Kick([[WeAreDevs API exploits based are NOT supported due to Memory Leaks 
    (instant Mem Leaks from 0.5GB -> 1.5GB when activate the Auto Farm)
    
    If you can't find any exploit then use Krnl/Oxygen X/etc... (Even Proxo and EasyExploits API exploits based too
    because EEAPI's dev is Electron's dev (Co) so it dosen't trash like your thought)
    
    NOTE: Shadow works fine but you WILL expect Memory Leaks like WRD API
    NOTE2: Don't use Furk, Coco Z or any shady exploit in WRD.net]])
end
local function CreateInstance(cls,props)
    local inst = Instance.new(cls)
    for i,v in pairs(props) do
        inst[i] = v
    end
    return inst
end
    
local ZeroFuruit = CreateInstance('ScreenGui',{DisplayOrder=0,Enabled=true,ResetOnSpawn=false,Name='ZeroFuruit', Parent=game.CoreGui})
local TitleTxt = CreateInstance('TextLabel',{Font=Enum.Font.Ubuntu,FontSize=Enum.FontSize.Size14,Text='ZeroFuruit',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,Active=false,AnchorPoint=Vector2.new(0.5, 0.5),BackgroundColor3=Color3.new(0.0784314, 0.0784314, 0.0784314),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0.5, -320,1.5, -180),Rotation=0,Selectable=false,Size=UDim2.new(0, 640, 0, 20),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='TitleTxt',Parent = ZeroFuruit})
local MainFrm = CreateInstance('Frame',{Style=Enum.FrameStyle.Custom,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.117647, 0.117647, 0.117647),BackgroundTransparency=0,BorderColor3=Color3.new(0.117647, 0.117647, 0.117647),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 0, 0, 20),Rotation=0,Selectable=false,Size=UDim2.new(0, 640, 0, 340),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name = 'MainFrm',Parent = TitleTxt})
local MainTabBtn = CreateInstance('TextButton',{Font=Enum.Font.Ubuntu,FontSize=Enum.FontSize.Size14,Text='Main',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.313726, 0.313726, 0.313726),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 0, 0, 0),Rotation=0,Selectable=true,Size=UDim2.new(0, 70, 0, 20),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='MainTabBtn',Parent = MainFrm})
local MainTabBtnTF = CreateInstance('Frame',{Style=Enum.FrameStyle.Custom,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0784314, 0.0784314, 0.0784314),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 0, 1, 0),Rotation=0,Selectable=false,Size=UDim2.new(0, 640, 0, 320),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name = 'MainTabBtnTF',Parent = MainTabBtn})
local ScrollingFrame = CreateInstance('ScrollingFrame',{BottomImage='rbxasset://textures/ui/Scroll/scroll-bottom.png',CanvasPosition=Vector2.new(0, 0),CanvasSize=UDim2.new(1.25, 0, 1.25, 0),MidImage='rbxasset://textures/ui/Scroll/scroll-middle.png',ScrollBarThickness=12,ScrollingEnabled=true,TopImage='rbxasset://textures/ui/Scroll/scroll-top.png',Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0784314, 0.0784314, 0.0784314),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=0,ClipsDescendants=true,Draggable=false,Position=UDim2.new(0.015625, 0, 0.0281249993, 0),Rotation=0,Selectable=true,Size=UDim2.new(0, 620, 0, 300),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='ScrollingFrame',Parent = MainTabBtnTF})

local TextBox = CreateInstance('TextBox',{ClearTextOnFocus=false,Font=Enum.Font.Ubuntu,FontSize=Enum.FontSize.Size14,MultiLine=true,Text=noticeTxt,TextColor3=Color3.new(1, 1, 1), PlaceholderText='', PlaceholderColor3=Color3.new(0.7, 0.7, 0.7),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0784314, 0.0784314, 0.0784314),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(-0.000352822593, 0, 0, 0),Rotation=0,Selectable=true,Size=UDim2.new(0, 730, 0, 300),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='TextBox',Parent = ScrollingFrame})

local AutoTabBtn = CreateInstance('TextButton',{Font=Enum.Font.Ubuntu,FontSize=Enum.FontSize.Size14,Text='Auto',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.313726, 0.313726, 0.313726),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0.218750015, 0, 0, 0),Rotation=0,Selectable=true,Size=UDim2.new(0, 70, 0, 20),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='AutoTabBtn',Parent = MainFrm})
local AutoTabBtnTF = CreateInstance('Frame',{Style=Enum.FrameStyle.Custom,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0784314, 0.0784314, 0.0784314),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(-2, 0, 1, 0),Rotation=0,Selectable=false,Size=UDim2.new(0, 640, 0, 320),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=false,ZIndex=1,Name = 'AutoTabBtnTF',Parent = AutoTabBtn})
local npcListSF = CreateInstance('ScrollingFrame',{BottomImage='rbxasset://textures/ui/Scroll/scroll-bottom.png',CanvasPosition=Vector2.new(0, 0),CanvasSize=UDim2.new(0, 0, 0.75, 0),MidImage='rbxasset://textures/ui/Scroll/scroll-middle.png',ScrollBarThickness=5,ScrollingEnabled=true,TopImage='rbxasset://textures/ui/Scroll/scroll-top.png',Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0392157, 0.0392157, 0.0392157),BackgroundTransparency=0,BorderColor3=Color3.new(0.352941, 0.352941, 0.352941),BorderSizePixel=1,ClipsDescendants=true,Draggable=false,Position=UDim2.new(0, 7, 0, 62),Rotation=0,Selectable=true,Size=UDim2.new(0, 308, 0, 60),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='npcListSF',Parent = AutoTabBtnTF})
local npcListRtb = CreateInstance('TextBox',{ClearTextOnFocus=false,Font=Enum.Font.Ubuntu,FontSize=Enum.FontSize.Size14,MultiLine=true,Text='',TextColor3=Color3.new(1, 1, 1), PlaceholderText='', PlaceholderColor3=Color3.new(0.7, 0.7, 0.7),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0392157, 0.0392157, 0.0392157),BackgroundTransparency=0,BorderColor3=Color3.new(0.352941, 0.352941, 0.352941),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 0, 0, 0),Rotation=0,Selectable=true,Size=UDim2.new(0, 308, 0, 240),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='npcListRtb',Parent = npcListSF})
local antiVeloBtn = CreateInstance('TextButton',{Font=Enum.Font.Ubuntu,FontSize=Enum.FontSize.Size14,Text='Anti Velocity By Weapons [FALSE]',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0784314, 0.0784314, 0.0784314),BackgroundTransparency=0,BorderColor3=Color3.new(0.352941, 0.352941, 0.352941),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 329, 0, 149),Rotation=0,Selectable=true,Size=UDim2.new(0, 304, 0, 20),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='antiVeloBtn',Parent = AutoTabBtnTF})
local autoFrmBtn = CreateInstance('TextButton',{Font=Enum.Font.Ubuntu,FontSize=Enum.FontSize.Size14,Text='Auto Farm [FALSE]',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0784314, 0.0784314, 0.0784314),BackgroundTransparency=0,BorderColor3=Color3.new(0.352941, 0.352941, 0.352941),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 329, 0, 176),Rotation=0,Selectable=true,Size=UDim2.new(0, 304, 0, 20),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='autoFrmBtn',Parent = AutoTabBtnTF})
local autoQuestBtn = CreateInstance('TextButton',{Font=Enum.Font.Ubuntu,FontSize=Enum.FontSize.Size14,Text='Auto Quest [FALSE]',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0784314, 0.0784314, 0.0784314),BackgroundTransparency=0,BorderColor3=Color3.new(0.352941, 0.352941, 0.352941),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 7, 0, 129),Rotation=0,Selectable=true,Size=UDim2.new(0, 308, 0, 20),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='autoQuestBtn',Parent = AutoTabBtnTF})
local getNPCsBtn = CreateInstance('TextButton',{Font=Enum.Font.Ubuntu,FontSize=Enum.FontSize.Size14,Text='Get All Available NPCs On This Area',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0784314, 0.0784314, 0.0784314),BackgroundTransparency=0,BorderColor3=Color3.new(0.352941, 0.352941, 0.352941),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 7, 0, 35),Rotation=0,Selectable=true,Size=UDim2.new(0, 308, 0, 20),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='getNPCsBtn',Parent = AutoTabBtnTF})
local npcNameBox = CreateInstance('TextBox',{ClearTextOnFocus=false,Font=Enum.Font.Ubuntu,FontSize=Enum.FontSize.Size14,MultiLine=false,Text='',TextColor3=Color3.new(1, 1, 1), PlaceholderText='Kaguya-sama [Lv. math.huge]', PlaceholderColor3=Color3.new(0.7, 0.7, 0.7),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0392157, 0.0392157, 0.0392157),BackgroundTransparency=0,BorderColor3=Color3.new(0.352941, 0.352941, 0.352941),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 85, 0, 7),Rotation=0,Selectable=true,Size=UDim2.new(0, 230, 0, 20),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='npcNameBox',Parent = AutoTabBtnTF})
local npcNameTxt = CreateInstance('TextLabel',{Font=Enum.Font.Ubuntu,FontSize=Enum.FontSize.Size14,Text='NPC Name:',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0784314, 0.0784314, 0.0784314),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 7, 0, 7),Rotation=0,Selectable=false,Size=UDim2.new(0, 70, 0, 20),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='npcNameTxt',Parent = AutoTabBtnTF})
local QnpcNameTxt = CreateInstance('TextLabel',{Font=Enum.Font.Ubuntu,FontSize=Enum.FontSize.Size14,Text='Quest NPC Name:',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0784314, 0.0784314, 0.0784314),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 329, 0, 7),Rotation=0,Selectable=false,Size=UDim2.new(0, 110, 0, 20),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='QnpcNameTxt',Parent = AutoTabBtnTF})
local QnpcNameBox = CreateInstance('TextBox',{ClearTextOnFocus=false,Font=Enum.Font.Ubuntu,FontSize=Enum.FontSize.Size14,MultiLine=false,Text='',TextColor3=Color3.new(1, 1, 1), PlaceholderText='Enterprise', PlaceholderColor3=Color3.new(0.7, 0.7, 0.7),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0392157, 0.0392157, 0.0392157),BackgroundTransparency=0,BorderColor3=Color3.new(0.352941, 0.352941, 0.352941),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 439, 0, 7),Rotation=0,Selectable=true,Size=UDim2.new(0, 194, 0, 20),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='QnpcNameBox',Parent = AutoTabBtnTF})
local noticeTxt1 = CreateInstance('TextLabel',{Font=Enum.Font.Ubuntu,FontSize=Enum.FontSize.Size14,Text='NOTE: You must enable Auto Farm if you want Auto',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0784314, 0.0784314, 0.0784314),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 7, 0, 161),Rotation=0,Selectable=false,Size=UDim2.new(0, 308, 0, 15),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='noticeTxt1',Parent = AutoTabBtnTF})
local noticeTxt2 = CreateInstance('TextLabel',{Font=Enum.Font.Ubuntu,FontSize=Enum.FontSize.Size14,Text='Quest to work!',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0784314, 0.0784314, 0.0784314),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 7, 0, 181),Rotation=0,Selectable=false,Size=UDim2.new(0, 259, 0, 15),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='noticeTxt2',Parent = AutoTabBtnTF})
local QNameBox = CreateInstance('TextBox',{ClearTextOnFocus=false,Font=Enum.Font.Ubuntu,FontSize=Enum.FontSize.Size14,MultiLine=false,Text='',TextColor3=Color3.new(1, 1, 1), PlaceholderText='Mitsuri', PlaceholderColor3=Color3.new(0.7, 0.7, 0.7),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0392157, 0.0392157, 0.0392157),BackgroundTransparency=0,BorderColor3=Color3.new(0.352941, 0.352941, 0.352941),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 417, 0, 35),Rotation=0,Selectable=true,Size=UDim2.new(0, 216, 0, 20),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='QNameBox',Parent = AutoTabBtnTF})
local QNameTxt = CreateInstance('TextLabel',{Font=Enum.Font.Ubuntu,FontSize=Enum.FontSize.Size14,Text='Quest Name:',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0784314, 0.0784314, 0.0784314),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 329, 0, 35),Rotation=0,Selectable=false,Size=UDim2.new(0, 81, 0, 20),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='QNameTxt',Parent = AutoTabBtnTF})
local QLocBox = CreateInstance('TextBox',{ClearTextOnFocus=false,Font=Enum.Font.Ubuntu,FontSize=Enum.FontSize.Size14,MultiLine=false,Text='',TextColor3=Color3.new(1, 1, 1), PlaceholderText='Aqua-sama', PlaceholderColor3=Color3.new(0.7, 0.7, 0.7),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0392157, 0.0392157, 0.0392157),BackgroundTransparency=0,BorderColor3=Color3.new(0.352941, 0.352941, 0.352941),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 452, 0, 62),Rotation=0,Selectable=true,Size=UDim2.new(0, 181, 0, 20),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='QLocBox',Parent = AutoTabBtnTF})
local QLocTxt = CreateInstance('TextLabel',{Font=Enum.Font.Ubuntu,FontSize=Enum.FontSize.Size14,Text='NPC Loc (Vector3):',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0784314, 0.0784314, 0.0784314),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 329, 0, 62),Rotation=0,Selectable=false,Size=UDim2.new(0, 117, 0, 20),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='QLocTxt',Parent = AutoTabBtnTF})
local getCurLocBtn = CreateInstance('TextButton',{Font=Enum.Font.Ubuntu,FontSize=Enum.FontSize.Size14,Text='Get Current Location',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0784314, 0.0784314, 0.0784314),BackgroundTransparency=0,BorderColor3=Color3.new(0.352941, 0.352941, 0.352941),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 329, 0, 95),Rotation=0,Selectable=true,Size=UDim2.new(0, 304, 0, 20),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='getCurLocBtn',Parent = AutoTabBtnTF})
local curPlrLocBox = CreateInstance('TextBox',{ClearTextOnFocus=false,Font=Enum.Font.Ubuntu,FontSize=Enum.FontSize.Size14,MultiLine=false,Text='',TextColor3=Color3.new(1, 1, 1), PlaceholderText='Current Location will be printed here', PlaceholderColor3=Color3.new(0.7, 0.7, 0.7),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0392157, 0.0392157, 0.0392157),BackgroundTransparency=0,BorderColor3=Color3.new(0.352941, 0.352941, 0.352941),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 329, 0, 122),Rotation=0,Selectable=true,Size=UDim2.new(0, 304, 0, 20),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='curPlrLocBox',Parent = AutoTabBtnTF})
local autoClickBtn = CreateInstance('TextButton',{Font=Enum.Font.Ubuntu,FontSize=Enum.FontSize.Size14,Text='Auto Click [FALSE]',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0784314, 0.0784314, 0.0784314),BackgroundTransparency=0,BorderColor3=Color3.new(0.352941, 0.352941, 0.352941),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 329, 0, 202),Rotation=0,Selectable=true,Size=UDim2.new(0, 304, 0, 20),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='autoClickBtn',Parent = AutoTabBtnTF})
local antiAFKBtn = CreateInstance('TextButton',{Font=Enum.Font.Ubuntu,FontSize=Enum.FontSize.Size14,Text='Anti-AFK Bypass [FALSE]',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0784314, 0.0784314, 0.0784314),BackgroundTransparency=0,BorderColor3=Color3.new(0.352941, 0.352941, 0.352941),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 7, 0, 202),Rotation=0,Selectable=true,Size=UDim2.new(0, 308, 0, 20),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='antiAFKBtn',Parent = AutoTabBtnTF})
local HWautoClickBtn = CreateInstance('TextButton',{Font=Enum.Font.Ubuntu,FontSize=Enum.FontSize.Size14,Text='Hardware Auto Click [FALSE]',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0784314, 0.0784314, 0.0784314),BackgroundTransparency=0,BorderColor3=Color3.new(0.352941, 0.352941, 0.352941),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 329, 0, 228),Rotation=0,Selectable=true,Size=UDim2.new(0, 304, 0, 20),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='HWautoClickBtn',Parent = AutoTabBtnTF})
local LGSfarmBtn = CreateInstance('TextButton',{Font=Enum.Font.Ubuntu,FontSize=Enum.FontSize.Size14,Text='Auto Noob Sword Farm [FALSE]',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0784314, 0.0784314, 0.0784314),BackgroundTransparency=0,BorderColor3=Color3.new(0.352941, 0.352941, 0.352941),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 7, 0, 228),Rotation=0,Selectable=true,Size=UDim2.new(0, 308, 0, 20),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='LGSfarmBtn',Parent = AutoTabBtnTF})
local intervalTxt = CreateInstance('TextLabel',{Font=Enum.Font.Ubuntu,FontSize=Enum.FontSize.Size14,Text='Interval (ms):',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0784314, 0.0784314, 0.0784314),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 329, 0, 255),Rotation=0,Selectable=false,Size=UDim2.new(0, 81, 0, 20),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='intervalTxt',Parent = AutoTabBtnTF})
local intervalBox = CreateInstance('TextBox',{ClearTextOnFocus=false,Font=Enum.Font.Ubuntu,FontSize=Enum.FontSize.Size14,MultiLine=false,Text='',TextColor3=Color3.new(1, 1, 1), PlaceholderText='002016', PlaceholderColor3=Color3.new(0.7, 0.7, 0.7),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0392157, 0.0392157, 0.0392157),BackgroundTransparency=0,BorderColor3=Color3.new(0.352941, 0.352941, 0.352941),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 417, 0, 255),Rotation=0,Selectable=true,Size=UDim2.new(0, 216, 0, 20),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='intervalBox',Parent = AutoTabBtnTF})
local Auto2TabBtn = CreateInstance('TextButton',{Font=Enum.Font.Ubuntu,FontSize=Enum.FontSize.Size14,Text='Auto (2)',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.313726, 0.313726, 0.313726),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0.328125, 0, 0, 0),Rotation=0,Selectable=true,Size=UDim2.new(0, 70, 0, 20),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='Auto2TabBtn',Parent = MainFrm})
local Auto2TabBtnTF = CreateInstance('Frame',{Style=Enum.FrameStyle.Custom,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0784314, 0.0784314, 0.0784314),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(-3, 0, 0.949999988, 0),Rotation=0,Selectable=false,Size=UDim2.new(0, 640, 0, 320),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=false,ZIndex=1,Name = 'Auto2TabBtnTF',Parent = Auto2TabBtn})
local tpModeBtn = CreateInstance('TextButton',{Font=Enum.Font.Ubuntu,FontSize=Enum.FontSize.Size14,Text='Teleport Bypass Mode: [AUTO]',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0784314, 0.0784314, 0.0784314),BackgroundTransparency=0,BorderColor3=Color3.new(0.352941, 0.352941, 0.352941),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 7, 0, 7),Rotation=0,Selectable=true,Size=UDim2.new(0, 308, 0, 20),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='tpModeBtn',Parent = Auto2TabBtnTF})
local eqAccessoryBtn = CreateInstance('TextButton',{Font=Enum.Font.Ubuntu,FontSize=Enum.FontSize.Size14,Text='Equip Accessory On Spawn: [FALSE]',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0784314, 0.0784314, 0.0784314),BackgroundTransparency=0,BorderColor3=Color3.new(0.352941, 0.352941, 0.352941),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 7, 0, 64),Rotation=0,Selectable=true,Size=UDim2.new(0, 308, 0, 20),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='eqAccessoryBtn',Parent = Auto2TabBtnTF})
local accesNameTxt = CreateInstance('TextLabel',{Font=Enum.Font.Ubuntu,FontSize=Enum.FontSize.Size14,Text='Item Name:',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0784314, 0.0784314, 0.0784314),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 7, 0, 35),Rotation=0,Selectable=false,Size=UDim2.new(0, 70, 0, 20),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='accesNameTxt',Parent = Auto2TabBtnTF})
local accessoryNameBox = CreateInstance('TextBox',{ClearTextOnFocus=false,Font=Enum.Font.Ubuntu,FontSize=Enum.FontSize.Size14,MultiLine=false,Text='',TextColor3=Color3.new(1, 1, 1), PlaceholderText='Purple Heart\'s Sword', PlaceholderColor3=Color3.new(0.7, 0.7, 0.7),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0392157, 0.0392157, 0.0392157),BackgroundTransparency=0,BorderColor3=Color3.new(0.352941, 0.352941, 0.352941),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 81, 0, 35),Rotation=0,Selectable=true,Size=UDim2.new(0, 234, 0, 20),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='accessoryNameBox',Parent = Auto2TabBtnTF})
local eqBusoBtn = CreateInstance('TextButton',{Font=Enum.Font.Ubuntu,FontSize=Enum.FontSize.Size14,Text='Equip Buso Haki On Spawn: [FALSE]',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0784314, 0.0784314, 0.0784314),BackgroundTransparency=0,BorderColor3=Color3.new(0.352941, 0.352941, 0.352941),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 7, 0, 95),Rotation=0,Selectable=true,Size=UDim2.new(0, 308, 0, 20),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='eqBusoBtn',Parent = Auto2TabBtnTF})
local eqSprintBtn = CreateInstance('TextButton',{Font=Enum.Font.Ubuntu,FontSize=Enum.FontSize.Size14,Text='Auto Sprint On Spawn: [FALSE]',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0784314, 0.0784314, 0.0784314),BackgroundTransparency=0,BorderColor3=Color3.new(0.352941, 0.352941, 0.352941),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 7, 0, 125),Rotation=0,Selectable=true,Size=UDim2.new(0, 308, 0, 20),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='eqSprintBtn',Parent = Auto2TabBtnTF})
local itemListSF = CreateInstance('ScrollingFrame',{BottomImage='rbxasset://textures/ui/Scroll/scroll-bottom.png',CanvasPosition=Vector2.new(0, 0),CanvasSize=UDim2.new(0, 0, 0.349999994, 0),MidImage='rbxasset://textures/ui/Scroll/scroll-middle.png',ScrollBarThickness=5,ScrollingEnabled=true,TopImage='rbxasset://textures/ui/Scroll/scroll-top.png',Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0392157, 0.0392157, 0.0392157),BackgroundTransparency=0,BorderColor3=Color3.new(0.352941, 0.352941, 0.352941),BorderSizePixel=1,ClipsDescendants=true,Draggable=false,Position=UDim2.new(0, 7, 0, 242),Rotation=0,Selectable=true,Size=UDim2.new(0, 308, 0, 49),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='itemListSF',Parent = Auto2TabBtnTF})
local itemListRtb = CreateInstance('TextBox',{ClearTextOnFocus=false,Font=Enum.Font.Ubuntu,FontSize=Enum.FontSize.Size14,MultiLine=true,Text='',TextColor3=Color3.new(1, 1, 1), PlaceholderText='', PlaceholderColor3=Color3.new(0.7, 0.7, 0.7),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0392157, 0.0392157, 0.0392157),BackgroundTransparency=0,BorderColor3=Color3.new(0.352941, 0.352941, 0.352941),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 0, 0, 0),Rotation=0,Selectable=true,Size=UDim2.new(0, 308, 0, 112),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='itemListRtb',Parent = itemListSF})
local getItemsBtn = CreateInstance('TextButton',{Font=Enum.Font.Ubuntu,FontSize=Enum.FontSize.Size14,Text='Get All Available Items On Inventory',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0784314, 0.0784314, 0.0784314),BackgroundTransparency=0,BorderColor3=Color3.new(0.352941, 0.352941, 0.352941),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 7, 0, 210),Rotation=0,Selectable=true,Size=UDim2.new(0, 308, 0, 20),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='getItemsBtn',Parent = Auto2TabBtnTF})
local itemNameBox = CreateInstance('TextBox',{ClearTextOnFocus=false,Font=Enum.Font.Ubuntu,FontSize=Enum.FontSize.Size14,MultiLine=false,Text='',TextColor3=Color3.new(1, 1, 1), PlaceholderText='Wooden Sword', PlaceholderColor3=Color3.new(0.7, 0.7, 0.7),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0392157, 0.0392157, 0.0392157),BackgroundTransparency=0,BorderColor3=Color3.new(0.352941, 0.352941, 0.352941),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 81, 0, 152),Rotation=0,Selectable=true,Size=UDim2.new(0, 234, 0, 20),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='itemNameBox',Parent = Auto2TabBtnTF})
local itemNameTxt = CreateInstance('TextLabel',{Font=Enum.Font.Ubuntu,FontSize=Enum.FontSize.Size14,Text='Item Name:',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0784314, 0.0784314, 0.0784314),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 7, 0, 152),Rotation=0,Selectable=false,Size=UDim2.new(0, 70, 0, 20),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='itemNameTxt',Parent = Auto2TabBtnTF})
local equipItemBtn = CreateInstance('TextButton',{Font=Enum.Font.Ubuntu,FontSize=Enum.FontSize.Size14,Text='Equip Item On Spawn [FALSE]',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0784314, 0.0784314, 0.0784314),BackgroundTransparency=0,BorderColor3=Color3.new(0.352941, 0.352941, 0.352941),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 7, 0, 180),Rotation=0,Selectable=true,Size=UDim2.new(0, 308, 0, 20),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='equipItemBtn',Parent = Auto2TabBtnTF})
local autoBtnTxt = CreateInstance('TextLabel',{Font=Enum.Font.Ubuntu,FontSize=Enum.FontSize.Size14,Text='================= Auto Skill =================',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0784314, 0.0784314, 0.0784314),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 323, 0, 7),Rotation=0,Selectable=false,Size=UDim2.new(0, 310, 0, 20),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='autoBtnTxt',Parent = Auto2TabBtnTF})
local zBtnBtn = CreateInstance('TextButton',{Font=Enum.Font.Ubuntu,FontSize=Enum.FontSize.Size14,Text='Z [FALSE]',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0784314, 0.0784314, 0.0784314),BackgroundTransparency=0,BorderColor3=Color3.new(0.352941, 0.352941, 0.352941),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 323, 0, 35),Rotation=0,Selectable=true,Size=UDim2.new(0, 70, 0, 20),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='zBtnBtn',Parent = Auto2TabBtnTF})
local xBtnBtn = CreateInstance('TextButton',{Font=Enum.Font.Ubuntu,FontSize=Enum.FontSize.Size14,Text='X [FALSE]',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0784314, 0.0784314, 0.0784314),BackgroundTransparency=0,BorderColor3=Color3.new(0.352941, 0.352941, 0.352941),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 404, 0, 35),Rotation=0,Selectable=true,Size=UDim2.new(0, 70, 0, 20),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='xBtnBtn',Parent = Auto2TabBtnTF})
local cBtnBtn = CreateInstance('TextButton',{Font=Enum.Font.Ubuntu,FontSize=Enum.FontSize.Size14,Text='C [FALSE]',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0784314, 0.0784314, 0.0784314),BackgroundTransparency=0,BorderColor3=Color3.new(0.352941, 0.352941, 0.352941),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 484, 0, 35),Rotation=0,Selectable=true,Size=UDim2.new(0, 70, 0, 20),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='cBtnBtn',Parent = Auto2TabBtnTF})
local vBtnBtn = CreateInstance('TextButton',{Font=Enum.Font.Ubuntu,FontSize=Enum.FontSize.Size14,Text='V [FALSE]',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0784314, 0.0784314, 0.0784314),BackgroundTransparency=0,BorderColor3=Color3.new(0.352941, 0.352941, 0.352941),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 563, 0, 35),Rotation=0,Selectable=true,Size=UDim2.new(0, 70, 0, 20),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='vBtnBtn',Parent = Auto2TabBtnTF})
local tBtnBtn = CreateInstance('TextButton',{Font=Enum.Font.Ubuntu,FontSize=Enum.FontSize.Size14,Text='T (Race Skill) [FALSE]',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0784314, 0.0784314, 0.0784314),BackgroundTransparency=0,BorderColor3=Color3.new(0.352941, 0.352941, 0.352941),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 404, 0, 64),Rotation=0,Selectable=true,Size=UDim2.new(0, 150, 0, 20),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='tBtnBtn',Parent = Auto2TabBtnTF})
local fBtnBtn = CreateInstance('TextButton',{Font=Enum.Font.Ubuntu,FontSize=Enum.FontSize.Size14,Text='F [FALSE]',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0784314, 0.0784314, 0.0784314),BackgroundTransparency=0,BorderColor3=Color3.new(0.352941, 0.352941, 0.352941),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 323, 0, 64),Rotation=0,Selectable=true,Size=UDim2.new(0, 70, 0, 20),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='fBtnBtn',Parent = Auto2TabBtnTF})
local StatusTabBtn = CreateInstance('TextButton',{Font=Enum.Font.Ubuntu,FontSize=Enum.FontSize.Size14,Text='Status',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.313726, 0.313726, 0.313726),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0.109375, 0, 0, 0),Rotation=0,Selectable=true,Size=UDim2.new(0, 70, 0, 20),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='StatusTabBtn',Parent = MainFrm})
local StatusTabBtnTF = CreateInstance('Frame',{Style=Enum.FrameStyle.Custom,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0784314, 0.0784314, 0.0784314),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(-1, 0, 0.949999988, 0),Rotation=0,Selectable=false,Size=UDim2.new(0, 640, 0, 320),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=false,ZIndex=1,Name = 'StatusTabBtnTF',Parent = StatusTabBtn})
local gameIdTxt = CreateInstance('TextLabel',{Font=Enum.Font.Ubuntu,FontSize=Enum.FontSize.Size18,Text='Game ID: 4206942069',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=16,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=true,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0784314, 0.0784314, 0.0784314),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 7, 0, 8),Rotation=0,Selectable=false,Size=UDim2.new(0, 259, 0, 20),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='gameIdTxt',Parent = StatusTabBtnTF})
local gameIdCopyBtn = CreateInstance('TextButton',{Font=Enum.Font.Ubuntu,FontSize=Enum.FontSize.Size14,Text='Copy',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0784314, 0.0784314, 0.0784314),BackgroundTransparency=0,BorderColor3=Color3.new(0.352941, 0.352941, 0.352941),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 272, 0, 8),Rotation=0,Selectable=true,Size=UDim2.new(0, 35, 0, 20),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='gameIdCopyBtn',Parent = StatusTabBtnTF})
local placeIdCopyBtn = CreateInstance('TextButton',{Font=Enum.Font.Ubuntu,FontSize=Enum.FontSize.Size14,Text='Copy',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0784314, 0.0784314, 0.0784314),BackgroundTransparency=0,BorderColor3=Color3.new(0.352941, 0.352941, 0.352941),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 272, 0, 37),Rotation=0,Selectable=true,Size=UDim2.new(0, 35, 0, 20),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='placeIdCopyBtn',Parent = StatusTabBtnTF})
local placeIdTxt = CreateInstance('TextLabel',{Font=Enum.Font.Ubuntu,FontSize=Enum.FontSize.Size18,Text='Place ID: 177013',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=16,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=true,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0784314, 0.0784314, 0.0784314),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 7, 0, 37),Rotation=0,Selectable=false,Size=UDim2.new(0, 259, 0, 20),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='placeIdTxt',Parent = StatusTabBtnTF})
local jobIdTxt = CreateInstance('TextLabel',{Font=Enum.Font.Ubuntu,FontSize=Enum.FontSize.Size18,Text='Job ID: REM',TextColor3=Color3.new(1, 1, 1),TextScaled=true,TextSize=16,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=true,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0784314, 0.0784314, 0.0784314),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 7, 0, 65),Rotation=0,Selectable=false,Size=UDim2.new(0, 259, 0, 20),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='jobIdTxt',Parent = StatusTabBtnTF})
local jobIdCopyBtn = CreateInstance('TextButton',{Font=Enum.Font.Ubuntu,FontSize=Enum.FontSize.Size14,Text='Copy',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0784314, 0.0784314, 0.0784314),BackgroundTransparency=0,BorderColor3=Color3.new(0.352941, 0.352941, 0.352941),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 272, 0, 65),Rotation=0,Selectable=true,Size=UDim2.new(0, 35, 0, 20),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='jobIdCopyBtn',Parent = StatusTabBtnTF})
local playTimeTxt = CreateInstance('TextLabel',{Font=Enum.Font.Ubuntu,FontSize=Enum.FontSize.Size18,Text='Play Time: 02:02:02',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=16,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0784314, 0.0784314, 0.0784314),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 7, 0, 122),Rotation=0,Selectable=false,Size=UDim2.new(0, 259, 0, 20),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='playTimeTxt',Parent = StatusTabBtnTF})
local placeVerTxt = CreateInstance('TextLabel',{Font=Enum.Font.Ubuntu,FontSize=Enum.FontSize.Size18,Text='Place Version: NeroTheBird',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=16,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0784314, 0.0784314, 0.0784314),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 7, 0, 93),Rotation=0,Selectable=false,Size=UDim2.new(0, 259, 0, 20),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='placeVerTxt',Parent = StatusTabBtnTF})
local placeVerCopyBtn = CreateInstance('TextButton',{Font=Enum.Font.Ubuntu,FontSize=Enum.FontSize.Size14,Text='Copy',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0784314, 0.0784314, 0.0784314),BackgroundTransparency=0,BorderColor3=Color3.new(0.352941, 0.352941, 0.352941),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 272, 0, 93),Rotation=0,Selectable=true,Size=UDim2.new(0, 35, 0, 20),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='placeVerCopyBtn',Parent = StatusTabBtnTF})
local CloseBtn = CreateInstance('ImageButton',{Image='',ImageColor3=Color3.new(0.156863, 0.156863, 0.156863),ImageRectOffset=Vector2.new(0, 0),ImageRectSize=Vector2.new(0, 0),ImageTransparency=0,ScaleType=Enum.ScaleType.Stretch,SliceCenter=Rect.new(0, 0, 0, 0),AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(1, 0, 0),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 622, 0, 2),Rotation=0,Selectable=true,Size=UDim2.new(0, 15, 0, 15),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='CloseBtn',Parent = TitleTxt})
local MinMaxBtn = CreateInstance('ImageButton',{Image='',ImageColor3=Color3.new(0.156863, 0.156863, 0.156863),ImageRectOffset=Vector2.new(0, 0),ImageRectSize=Vector2.new(0, 0),ImageTransparency=0,ScaleType=Enum.ScaleType.Stretch,SliceCenter=Rect.new(0, 0, 0, 0),AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0235294, 0.447059, 1),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 604, 0, 2),Rotation=0,Selectable=true,Size=UDim2.new(0, 15, 0, 15),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='MinMaxBtn',Parent = TitleTxt})

-- Drag
local dragger = {}; do
    local mouse        = BlxFrtVars.LocalPlayer:GetMouse();
    local inputService = game:GetService('UserInputService');
    local heartbeat    = RS.Heartbeat;
    -- // credits to Ririchi / Inori for this cute drag function :)
    function dragger.new(frame)
        local s, event = pcall(function()
            return frame.MouseEnter
        end)

        if s then
            frame.Active = true;
            event:connect(function()
                local input = frame.InputBegan:connect(function(key)
                    if key.UserInputType == Enum.UserInputType.MouseButton1 then
                        local objectPosition = Vector2.new(mouse.X - frame.AbsolutePosition.X, mouse.Y - frame.AbsolutePosition.Y);
                        frame.AnchorPoint = Vector2.new(0,0)
                        while heartbeat:wait() and inputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
                            pcall(function()
                                frame:TweenPosition(UDim2.new(0, mouse.X - objectPosition.X, 0, mouse.Y - objectPosition.Y), 'Out', 'Sine', 0.1, true);
                            end)
                        end
                    end
                end)

                local leave;
                leave = frame.MouseLeave:connect(function()
                    input:disconnect();
                    leave:disconnect();
                end)
            end)
        end
    end
end
-- UI
-- PositionBeforeOpen = 0.5, -320,1.5, -180
local DevisedTable = {}
MinMaxBtn.MouseButton1Click:Connect(function()
    if MainFrm.Size == UDim2.new(0,640,0,340) then
        DevisedTable = {}
        for i, v in pairs(MainFrm:GetDescendants()) do
            if v.Visible then 
                v.Visible = false
                v.BackgroundTransparency = 1
                table.insert(DevisedTable, v)
            end
        end
        MainFrm:TweenSize(UDim2.new(0,640,0,0),Enum.EasingDirection.Out,Enum.EasingStyle.Quart,0.5,false)
    else
        MainFrm:TweenSize(UDim2.new(0,640,0,340),Enum.EasingDirection.Out,Enum.EasingStyle.Quart,0.35,false, function() 
            for i, v in pairs(DevisedTable) do
                spawn(function()
                    v.Visible = true
                    while (v.BackgroundTransparency > 0) do
                        v.BackgroundTransparency = v.BackgroundTransparency - 0.1
                        wait()
                    end
                end)
            end
        end)
    end
end)
local function devisAllTab()
    local barbaraidol = false
    local taget = nil
    for i, v in pairs(MainFrm:GetChildren()) do
        if v:IsA("TextButton") and v[v.Name.."TF"].Visible == true then
            taget = v[v.Name.."TF"]
            break
        end
    end
    local baksize = taget.Size
    for i, v in pairs(taget:GetDescendants()) do
        if v.ClassName == "TextButton" or v.ClassName == "TextBox" or v.ClassName == "TextLabel" then
            spawn(function()
                for color=255,taget.BackgroundColor3.R,-25 do
                    v.TextColor3 = Color3.fromRGB(color,color,color)
                    wait(0.001)
                end
                v.Visible = false
            end)
        end
    end
    taget:TweenSize(UDim2.new(0,0,0,320),Enum.EasingDirection.Out,Enum.EasingStyle.Quart,0.5,true, function() 
        taget.Visible = false
        taget.Size = baksize
        for i, v in pairs(taget:GetDescendants()) do
            v.Visible = true
        end
        barbaraidol = true 
    end)
    while not barbaraidol do
        wait()
    end
end
local isSwitchingTab = false
local function tweenVisTab(tab)
    if not isSwitchingTab then
        isSwitchingTab = true
    else
        return
    end
    for i, v in pairs(tab:GetDescendants()) do
        v.Visible = false
        if v.ClassName == "TextButton" or v.ClassName == "TextBox" or v.ClassName == "TextLabel" then
            v.TextColor3 = tab.BackgroundColor3
        end
    end
    tab.Size = UDim2.new(0,0,0,320)
    tab.Visible = true
    local barbaraidol = false
    tab:TweenSize(UDim2.new(0,640,0,320),Enum.EasingDirection.Out,Enum.EasingStyle.Quart,0.35,true, function() 
        for i, v in pairs(tab:GetDescendants()) do
            v.Visible = true
            if v.ClassName == "TextButton" or v.ClassName == "TextBox" or v.ClassName == "TextLabel" then
                spawn(function()
                    for color=tab.BackgroundColor3.R,255,25 do
                        v.TextColor3 = Color3.fromRGB(color,color,color)
                        wait(0.001)
                    end
                end)
            end
        end
        isSwitchingTab = false
        barbaraidol = true 
    end)
    while not barbaraidol do
        wait()
    end
end
-- Auto Tab create
for i, v in pairs({MainTabBtn, AutoTabBtn, Auto2TabBtn, StatusTabBtn}) do
    v.MouseButton1Click:Connect(function()
        local tartab = v[v.Name.."TF"]
        if tartab.Visible or isSwitchingTab then return end
        devisAllTab()
        tweenVisTab(tartab)
    end)
end
gameIdTxt.Text = "Game ID: "..game.GameId
gameIdCopyBtn.MouseButton1Click:Connect(function()
    setclipboard(tostring(game.GameId))
end)
placeIdTxt.Text = "Place ID: "..game.PlaceId
placeIdCopyBtn.MouseButton1Click:Connect(function()
    setclipboard(tostring(game.PlaceId))
end)
jobIdTxt.Text = "Job ID: "..game.JobId
jobIdCopyBtn.MouseButton1Click:Connect(function()
    setclipboard(tostring(game.JobId))
end)
placeVerTxt.Text = "Place Version: "..game.PlaceVersion
placeVerCopyBtn.MouseButton1Click:Connect(function()
    setclipboard(tostring(game.PlaceVersion))
end)
coroutine.wrap(function()
    repeat
        local seconds = math.floor(workspace.DistributedGameTime)
        local minutes = math.floor(workspace.DistributedGameTime / 60)
        local hours = math.floor(workspace.DistributedGameTime / 60 / 60)
        seconds = seconds - (minutes * 60)
        minutes = minutes - (hours * 60)
        local sstr = tostring(seconds)
        local mstr = tostring(minutes)
        local hstr = tostring(hours)
        -- Post-processing
        while string.len(sstr) < 2 do
            sstr = "0"..sstr
        end
        while string.len(mstr) < 2 do
            mstr = "0"..mstr
        end
        while string.len(hstr) < 2 do
            hstr = "0"..hstr
        end
        playTimeTxt.Text = "Play Time: "..hstr..":"..mstr..":"..sstr
        wait(1)
    until ZeroFuruit == nil
end)()
-- Script
antiVeloBtn.MouseButton1Click:Connect(function()
    BlxFrtVars.WeaponHasKb = not BlxFrtVars.WeaponHasKb
    antiVeloBtn.Text = "Anti Velocity By Weapons ["..tostring(BlxFrtVars.WeaponHasKb):upper().."]"
end)
-- IY SKID PART.
local FLYING = false
function getRoot(char)
	local rootPart = char:FindFirstChild('HumanoidRootPart') or char:FindFirstChild('Torso') or char:FindFirstChild('UpperTorso')
	return rootPart
end
function sFLY()
	repeat wait() until BlxFrtVars.LocalPlayer and BlxFrtVars.Character and getRoot(BlxFrtVars.Character) and BlxFrtVars.Character:FindFirstChild('Humanoid')
	local T = getRoot(BlxFrtVars.Character)
	local function FLY()
		FLYING = true
		local BG = Instance.new('BodyGyro', T)
		local BV = Instance.new('BodyVelocity', T)
		BG.P = 9e4
		BG.maxTorque = Vector3.new(9e9, 9e9, 9e9)
		BG.cframe = T.CFrame
		BV.velocity = Vector3.new(0, 0, 0)
		BV.maxForce = Vector3.new(9e9, 9e9, 9e9)
		spawn(function()
			repeat wait()
                BV.velocity = Vector3.new(0, 0, 0)
				BG.cframe = workspace.CurrentCamera.CoordinateFrame
			until not FLYING
			BG:destroy()
			BV:destroy()
		end)
	end
	FLY()
end
local zeroClip = nil
local function NoclipLoop()
    for _, child in pairs(BlxFrtVars.Character:GetDescendants()) do
        if child:IsA("BasePart") and child.CanCollide == true then
            child.CanCollide = false
        end
    end
end
local function deClip()
    if zeroClip ~= nil then
        zeroClip:Disconnect()
        zeroClip = nil
        for _, child in pairs(BlxFrtVars.Character:GetDescendants()) do
            if child:IsA("BasePart") and child.CanCollide == false then
                child.CanCollide = false
            end
        end
    end
end
function NOFLY()
	FLYING = false
	BlxFrtVars.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
end
-- END
-- Teleport functions
local function unsafeTP(X, Y, Z) -- THIS SHOULD NOT BE USED TO TELEPORT DIRECTLY TO NPCS/ENEMIES BECAUSE ITS 100% BANNABLE
    BlxFrtVars.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(X,Y,Z))
end
local function unsafeTPVector3(vector) -- THIS SHOULD NOT BE USED TO TELEPORT DIRECTLY TO NPCS/ENEMIES BECAUSE ITS 100% BANNABLE
    BlxFrtVars.Character.HumanoidRootPart.CFrame = CFrame.new(vector)
end
local function shamblesTo(part1, part2)
    local selfTriggerNC = false
    if zeroClip == nil then 
        zeroClip = RS.Stepped:connect(NoclipLoop) 
        selfTriggerNC = true
    end
    local CFreme = part2.CFrame
    local tweeter = TS:Create(part1 ,TweenInfo.new(math.abs((part2.Position - part1.Position).Magnitude) / BlxFrtVars.Humanoid.WalkSpeed,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0) ,{CFrame = CFreme})
    tweeter:Play()
    while (part1.Position - part2.Position).Magnitude > 5 do 
        if (part2.Position - CFreme.Position).Magnitude > 5 then
            tweeter:Cancel()
            CFreme = part2.CFrame
            tweeter = TS:Create(part1 ,TweenInfo.new(math.abs((part2.Position - part1.Position).Magnitude) / BlxFrtVars.Humanoid.WalkSpeed,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0) ,{CFrame = CFreme})
            tweeter:Play()
        end
        wait(0.1) 
    end
    if selfTriggerNC then deClip() end
end
local function moveTo(humanoid, targetPart)
    local selfTriggerNC = false
    if zeroClip == nil then 
        zeroClip = RS.Stepped:connect(NoclipLoop) 
        selfTriggerNC = true
    end
    local targetPoint = targetPart.Position
    humanoid:MoveTo(targetPoint, targetPart)
    local function ababa()
        if humanoid.MoveDirection.Magnitude <= 0 then -- Are we walking?
            -- does the humanoid still exist?
            if not (humanoid and humanoid.Parent) then
                return 'break'
            end
            if (targetPart.Position - targetPoint).Magnitude > 5 then
                targetPoint = targetPart.Position
            end
            -- refresh the timeout
            humanoid:MoveTo(targetPoint, targetPart)
        end
        wait(0.1)
    end
    while (targetPoint - BlxFrtVars.Character.HumanoidRootPart.Position).Magnitude > 5 do
        if ababa() == 'break' then break end
    end
    -- Temporary workaround..
    shamblesTo(BlxFrtVars.Character.HumanoidRootPart, targetPart)
    if selfTriggerNC then deClip() end
end
-- string extended table
local stringext = {}
stringext.split = function(str, pat)
    local t = {}  -- NOTE: use {n = 0} in Lua-5.0
    local fpat = "(.-)" .. pat
    local last_end = 1
    local s, e, cap = str:find(fpat, 1)
    while s do
       if s ~= 1 or cap ~= "" then
          table.insert(t, cap)
       end
       last_end = e+1
       s, e, cap = str:find(fpat, last_end)
    end
    if last_end <= #str then
       cap = str:sub(last_end)
       table.insert(t, cap)
    end
    return t
 end
-- AI table.
local AI = {}
AI.SmartMove = function(targetPart)
    local hrp = BlxFrtVars.Character.HumanoidRootPart
    if BlxFrtVars.TeleportMode == "Safe" then
        moveTo(BlxFrtVars.Humanoid, targetPart)
    elseif BlxFrtVars.TeleportMode == "Unsafe" then
        shamblesTo(hrp, targetPart)
    else -- Your "Auto" mode.
        if math.abs((targetPart.Position - hrp.Position).Y) <= 10 then
            moveTo(BlxFrtVars.Humanoid, targetPart)
        else
            shamblesTo(hrp, targetPart)
        end
    end
end
AI.getNPC = function(name, mode)
    local newcctable = {}
    for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
        if (v.Name == name) and (v:FindFirstChild("HumanoidRootPart") ~= nil) and (v:FindFirstChild("Humanoid") ~= nil) and (v.Humanoid.Health > 0) then
            table.insert(newcctable, v)
        end
    end
    if mode == nil then
        return newcctable[math.random(1,#newcctable)]
    elseif mode == "nearest" then --nearest so it wont waste the time.
        local nearestnpc
        local nearestnpcmag = math.huge
        for i, v in pairs(newcctable) do 
            local abctmp = (v.HumanoidRootPart.Position - BlxFrtVars.Character.HumanoidRootPart.Position).Magnitude
            if abctmp < nearestnpcmag then
                nearestnpcmag = abctmp
                nearestnpc = v
            end
        end
        return nearestnpc
    end
end
AI.getQuestNPC = function(name)
    for i,v in pairs(game.Workspace.NPCs:GetChildren()) do
        if (v.Name == name) then
            return v
        end
    end
end
AI.Mouse1Click = function()
    VU:CaptureController()
    VU:ClickButton1(Vector2.new(0,0))
end
AI.HWMouse1Click = function()
    if EXPLOIT == "sirhurt" then
        -- sirhurt retard, leftclick ISNT mouse1click smh...
        leftclick()
    else
        mouse1click()
    end
end
AI.KeyPress = function(keycode) -- https://developer.roblox.com/en-us/api-reference/enum/KeyCode
    VU:CaptureController()
    VU:SetKeyDown(keycode)
    wait()
    VU:SetKeyUp(keycode)
    -- Workaround
    local item = BlxFrtVars.Character:FindFirstChildWhichIsA("Tool")
    if item ~= nil then
        BlxFrtVars.Humanoid:UnequipTools()
        wait()
        BlxFrtVars.Humanoid:EquipTool(item)
    end
end
AI.btnClicker = function(btn,maingui)
    local ocP = btn.Parent
    local ocPo = btn.Position
    btn.Parent = maingui
    btn.Position = UDim2.new(0,0,0,0)
    wait(0.1)
    AI.Mouse1Click()
    wait(0.1)
    btn.Parent = ocP
    btn.Position = ocPo
end
AI.GetVector3FromString = function(str)
    local splitedStr = stringext.split(str,",")
    return Vector3.new(tonumber(splitedStr[1]),tonumber(splitedStr[2]),tonumber(splitedStr[3]))
end
AI.GetDialogText = function()
    local txtFrm = BlxFrtVars.DialogFrame.TextFrame
    local txt = ""
    for i, v in pairs(txtFrm:GetChildren()) do
        if v.ClassName == "Frame" then
            for ba, ka in pairs(v.Container:GetChildren()) do
                txt = txt..ka.Text
            end
            if v.Name ~= "Line001" then
                txt = txt..string.char(10)
            end
        end
    end
    return txt
end
-- Auto Farm/Quest related function.
local function autoQuest()
    if (QLocBox.Text ~= "") then
        local pod = Instance.new("Part", game.Workspace)
        local vector6 = AI.GetVector3FromString(QLocBox.Text)
        pod.Anchored = true
        pod.CFrame = CFrame.new(vector6)
        pod.Position = vector6
        pod.CanCollide = false
        AI.SmartMove(pod)
        pod:Destroy()
    else
        local qnpc = AI.getQuestNPC(QnpcNameBox.Text)
        AI.SmartMove(qnpc.Head)
    end
    wait(0.25)
    local qiuBtn
    while not BlxFrtVars.MainGUI.Quest.Visible do
        while not BlxFrtVars.DialogFrame.Visible do 
            AI.HWMouse1Click()
            wait(0.25)
        end
        wait(0.5)
        while string.match(AI.GetDialogText(),"Please select a quest.") do
            for i, v in pairs(BlxFrtVars.DialogFrame:GetChildren()) do
                if (v:IsA("TextButton") and v.TextLabel.Text == QNameBox.Text) then
                    while BlxFrtVars.DialogFrame.Option1.TextLabel.Text ~= "Confirm" do 
                        AI.btnClicker(v,BlxFrtVars.MainGUI)
                        wait(0.25) 
                    end
                    break
                end
            end
            wait()
        end
        wait(0.5)
        while string.match(AI.GetDialogText(),"Level Required:") do
            for i, v in pairs(BlxFrtVars.DialogFrame:GetChildren()) do
                if (v:IsA("TextButton") and v.TextLabel.Text == "Confirm") then
                    while AI.GetDialogText() ~= "[Quest accepted.]" do 
                        AI.btnClicker(v,BlxFrtVars.MainGUI)
                        wait(0.25) 
                    end
                    break
                end
            end
        end
        while BlxFrtVars.DialogFrame.Visible do 
            AI.Mouse1Click()
            wait(0.25)
        end
    end
end
local function autoFarm()
    while wait() and BlxFrtVars.AutoFarm and BlxFrtVars.Humanoid.Health > 0 do
        print("L0")
        if BlxFrtVars.AutoQuest and not BlxFrtVars.MainGUI.Quest.Visible then
            print("LQ")
            autoQuest()
        end
        print("L1")
        local v = nil
        while v == nil do
            print("LV")
            v = AI.getNPC(npcNameBox.Text,"nearest")
            wait()
        end
        print("L2")
        while v ~= nil and (v.Humanoid.Health > 0) and v:FindFirstChild("HumanoidRootPart") ~= nil and v.Parent == game.Workspace.Enemies do
            print("LLOOP0")
            print(v.Name)
            print(v.Parent.Name)
            print((v.HumanoidRootPart.Position - BlxFrtVars.Character.HumanoidRootPart.Position).Magnitude)
            print(v.Head.Transparency)
            if (v.HumanoidRootPart.Position - BlxFrtVars.Character.HumanoidRootPart.Position).Magnitude > 5 then
                AI.SmartMove(v.HumanoidRootPart)
            end
            print("LLOOP1")
            if (BlxFrtVars.WeaponHasKb) then sFLY() end
            AI.Mouse1Click()
            wait(0.2)
            if (BlxFrtVars.WeaponHasKb) then NOFLY() end
            print("LLOOP2")
        end
    end
end
local function autoLSD()
    while wait() and BlxFrtVars.UAutoLSD do
        print("State 1")
        local managerNPC = AI.getQuestNPC("Manager")
        while (managerNPC == nil) do
            unsafeTP(-356.424713, 16.4147243, 362.088989)
            managerNPC = AI.getQuestNPC("Manager")
            wait(0.1)
        end
        print("State 2")
        AI.SmartMove(managerNPC.Head)
        print("State 3")
        while not BlxFrtVars.DialogFrame.Visible do 
            AI.HWMouse1Click()
            wait(0.25)
        end
        wait(0.5)
        for i, v in pairs(BlxFrtVars.DialogFrame:GetChildren()) do
            if (v:IsA("TextButton") and v.TextLabel.Text == "Talk") then
                AI.btnClicker(v,BlxFrtVars.MainGUI)
                break
            end
        end
        wait(0.5)
        if string.match(AI.GetDialogText(),"It's still too early") then
            print("Case 1-0")
            AI.Mouse1Click()
        else
            print("Case 1-1")
            AI.Mouse1Click()
            wait(0.5)
            for i, v in pairs(BlxFrtVars.DialogFrame:GetChildren()) do
                if (v:IsA("TextButton") and v.TextLabel.Text == "Yeah") then
                    AI.btnClicker(v,BlxFrtVars.MainGUI)
                    break
                end
            end
            wait(0.5)
            if string.match(AI.GetDialogText(),"Some pirates") then
                print("Case 2-2")
                AI.Mouse1Click()
            elseif string.match(AI.GetDialogText(),"Meh") then
                print("Case 2-1")
                AI.Mouse1Click()
            elseif string.match(AI.GetDialogText(),"A man") then
                print("Case 2-3")
                AI.Mouse1Click()
            elseif string.match(AI.GetDialogText(),"I think") then
                print("Case 2-4")
                AI.Mouse1Click()
            elseif string.match(AI.GetDialogText(),"Good luck!") then
                print("Case 2-5 [LSD came]")
                while BlxFrtVars.DialogFrame.Visible do 
                    AI.Mouse1Click()
                    wait(0.25)
                end
                AI.Mouse1Click()
                wait(1)
                local colosseumPos = Vector3.new(-2155.83813, 242.02298, 1090.67944)
                local waterwayPos = Vector3.new(-736.809814, 13.985116, -349.90213)
                local petalPos = Vector3.new(-1989.86694, 729.011963, -3619.8894)
                local rockNearFujitoraLoc = Vector3.new(-2221.78491, 73.3607635, -3840.81885)
                local graveyardHillLoc = Vector3.new(-5604.18311, 297.050812, -848.647705)
                local usoppIslandLoc = Vector3.new(4719.04395, 8.54533291, 2877.00635)
                local facLoc = Vector3.new(1254.21545, 73.3538513, 91.5183334)
                for i, v in pairs({colosseumPos,waterwayPos,petalPos,rockNearFujitoraLoc,graveyardHillLoc,usoppIslandLoc,facLoc}) do
                    unsafeTPVector3(v)
                    wait(3)
                    local LGS = AI.getQuestNPC("Legendary Sword Dealer ") -- Bruh
                    if LGS ~= nil then
                        while AI.getQuestNPC("Legendary Sword Dealer ") ~= nil do
                            AI.SmartMove(LGS.Head)
                            while not BlxFrtVars.DialogFrame.Visible do 
                                AI.HWMouse1Click()
                                wait(0.25)
                            end
                            wait(0.5)
                            for i, v in pairs(BlxFrtVars.DialogFrame:GetChildren()) do
                                if (v:IsA("TextButton") and v.TextLabel.Text == "Talk") then
                                    AI.btnClicker(v,BlxFrtVars.MainGUI)
                                    break
                                end
                            end
                            wait(1)
                            for i, v in pairs(BlxFrtVars.DialogFrame:GetChildren()) do
                                if (v:IsA("TextButton") and v.TextLabel.Text == "Purchase") then
                                    AI.btnClicker(v,BlxFrtVars.MainGUI)
                                    break
                                end
                            end
                            wait(0.5)
                            while BlxFrtVars.DialogFrame.Visible do 
                                AI.Mouse1Click()
                                wait(0.25)
                            end
                        end
                        break
                    end
                end
            else
                print("Unknown case")
                AI.Mouse1Click()
            end
        end
    end
end
local antiAFKRBXScriptSignal = nil
local function antiAFKBypass(mamapurpleheart)
    if mamapurpleheart then
        antiAFKRBXScriptSignal = BlxFrtVars.LocalPlayer.Idled:connect(function()
            VU:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
            wait(1)
            VU:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        end)
    else
        antiAFKRBXScriptSignal:Disconnect()
    end
end
-- Button functions
getNPCsBtn.MouseButton1Click:Connect(function()
    npcListRtb.Text = ""
    for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
        if (v:FindFirstChild("HumanoidRootPart") ~= nil) and (v.Humanoid.Health > 0) and (not string.match(npcListRtb.Text, v.Name)) then
            npcListRtb.Text = npcListRtb.Text..v.Name..string.char(10)
        end
    end
    for i,v in pairs(game.Workspace.NPCs:GetChildren()) do
        if (v:FindFirstChild("HumanoidRootPart") ~= nil) and (not string.match(npcListRtb.Text, v.Name)) then
            npcListRtb.Text = npcListRtb.Text..v.Name..string.char(10)
        end
    end
end)
getItemsBtn.MouseButton1Click:Connect(function()
    itemListRtb.Text = ""
    BlxFrtVars.Humanoid:UnequipTools()
    for i,v in pairs(BlxFrtVars.LocalPlayer.Backpack:GetChildren()) do
        if v:IsA("Tool") then
            itemListRtb.Text = itemListRtb.Text..v.Name..string.char(10)
        end
    end
end)
equipItemBtn.MouseButton1Click:Connect(function()
    if BlxFrtVars.EquipItemOnBoot == "" then
        BlxFrtVars.EquipItemOnBoot = itemNameBox.Text
        equipItemBtn.Text = "Equip Item On Spawn [TRUE]"
    else
        BlxFrtVars.EquipItemOnBoot = ""
        equipItemBtn.Text = "Equip Item On Spawn [FALSE]"
    end
end)
eqAccessoryBtn.MouseButton1Click:Connect(function()
    if BlxFrtVars.EquipAccesoryOnBoot == "" then
        BlxFrtVars.EquipAccesoryOnBoot = accessoryNameBox.Text
        eqAccessoryBtn.Text = "Equip Accessory On Spawn [TRUE]"
    else
        BlxFrtVars.EquipAccesoryOnBoot = ""
        eqAccessoryBtn.Text = "Equip Accessory On Spawn [FALSE]"
    end
end)
eqBusoBtn.MouseButton1Click:Connect(function()
    BlxFrtVars.EquipBusoOnBoot = not BlxFrtVars.EquipBusoOnBoot
    eqBusoBtn.Text = "Equip Buso Haki On Spawn: ["..tostring(BlxFrtVars.EquipBusoOnBoot):upper().."]"
end)
eqSprintBtn.MouseButton1Click:Connect(function()
    BlxFrtVars.AutoSprintOnBoot = not BlxFrtVars.AutoSprintOnBoot
    eqSprintBtn.Text = "Auto Sprint On Spawn: ["..tostring(BlxFrtVars.AutoSprintOnBoot):upper().."]"
end)
autoFrmBtn.MouseButton1Click:Connect(function()
    BlxFrtVars.AutoFarm = not BlxFrtVars.AutoFarm
    autoFrmBtn.Text = "Auto Farm ["..tostring(BlxFrtVars.AutoFarm):upper().."]"
    if (BlxFrtVars.AutoFarm) then
        BlxFrtVars.Character = BlxFrtVars.LocalPlayer.Character
        coroutine.wrap(autoFarm)() -- coroutine threads use less memory than normal threads???
    end
end)
LGSfarmBtn.MouseButton1Click:Connect(function()
    BlxFrtVars.UAutoLSD = not BlxFrtVars.UAutoLSD
    LGSfarmBtn.Text = "Auto Noob Sword Farm ["..tostring(BlxFrtVars.UAutoLSD):upper().."]"
    if (BlxFrtVars.UAutoLSD) then
        BlxFrtVars.Character = BlxFrtVars.LocalPlayer.Character
        coroutine.wrap(autoLSD)() -- coroutine threads use less memory than normal threads???
    end
end)
autoClickBtn.MouseButton1Click:Connect(function()
    BlxFrtVars.AutoClick = not BlxFrtVars.AutoClick
    autoClickBtn.Text = "Auto Click ["..tostring(BlxFrtVars.AutoClick):upper().."]"
    if (BlxFrtVars.AutoClick) then
        BlxFrtVars.ACInterval = (tonumber(intervalBox.Text) / 1000)
        coroutine.wrap(function()
            while wait(BlxFrtVars.ACInterval) and BlxFrtVars.AutoClick do
                AI.Mouse1Click()
            end
        end)() -- coroutine threads use less memory than normal threads???
    end
end)
HWautoClickBtn.MouseButton1Click:Connect(function()
    BlxFrtVars.HWAutoClick = not BlxFrtVars.HWAutoClick
    HWautoClickBtn.Text = "Hardware Auto Click ["..tostring(BlxFrtVars.HWAutoClick):upper().."]"
    if (BlxFrtVars.HWAutoClick) then
        BlxFrtVars.ACInterval = (tonumber(intervalBox.Text) / 1000)
        coroutine.wrap(function()
            while wait(BlxFrtVars.ACInterval) and BlxFrtVars.HWAutoClick do
                AI.HWMouse1Click()
            end
        end)() -- coroutine threads use less memory than normal threads???
    end
end)
antiAFKBtn.MouseButton1Click:Connect(function()
    BlxFrtVars.AntiAFKBypass = not BlxFrtVars.AntiAFKBypass
    antiAFKBtn.Text = "Anti-AFK Bypass ["..tostring(BlxFrtVars.AntiAFKBypass):upper().."]"
    antiAFKBypass(BlxFrtVars.AntiAFKBypass)
end)
autoQuestBtn.MouseButton1Click:Connect(function()
    BlxFrtVars.AutoQuest = not BlxFrtVars.AutoQuest
    autoQuestBtn.Text = "Auto Quest ["..tostring(BlxFrtVars.AutoQuest):upper().."]"
end)
tpModeBtn.MouseButton1Click:Connect(function()
    if BlxFrtVars.TeleportMode == "Auto" then
        BlxFrtVars.TeleportMode = "Unsafe"
    elseif BlxFrtVars.TeleportMode == "Unsafe" then
        BlxFrtVars.TeleportMode = "Safe"
    else
        BlxFrtVars.TeleportMode = "Auto"
    end
    tpModeBtn.Text = "Teleport Bypass Mode: ["..BlxFrtVars.TeleportMode:upper().."]"
end)
getCurLocBtn.MouseButton1Click:Connect(function()
    curPlrLocBox.Text = tostring(BlxFrtVars.Character.HumanoidRootPart.Position)
end)
CloseBtn.MouseButton1Click:Connect(function()
    if MainFrm.Size ~= UDim2.new(0,640,0,0) then
        for i, v in pairs(MainFrm:GetDescendants()) do
            v.Visible = false
            v.BackgroundTransparency = 1
        end
        MainFrm:TweenSize(UDim2.new(0,640,0,0),Enum.EasingDirection.Out,Enum.EasingStyle.Quart,0.5,true)
        wait(0.5)
    end
    TitleTxt.Text = ""
    CloseBtn.BackgroundTransparency = 1
    MinMaxBtn.BackgroundTransparency = 1
    TitleTxt:TweenSize(UDim2.new(0,640,0,0),Enum.EasingDirection.Out,Enum.EasingStyle.Quart,0.25,true, function() 
        ZeroFuruit:Destroy() 
    end)
end)
-- Auto Key Buttons (Auto expand function)
for i, v in pairs({zBtnBtn, xBtnBtn, cBtnBtn, vBtnBtn, fBtnBtn, tBtnBtn}) do
    local fistChar = string.sub(v.Name, 1, 1):upper()
    local keyCode = 0
    if fistChar == "Z" then
        keyCode = 122
    elseif fistChar == "X" then
        keyCode = 120
    elseif fistChar == "C" then
        keyCode = "0x63"
    elseif fistChar == "V" then
        keyCode = 118
    elseif fistChar == "F" then
        keyCode = 102
    elseif fistChar == "T" then
        keyCode = 116
    end
    v.MouseButton1Click:Connect(function()
        BlxFrtVars.Buttons[fistChar] = not BlxFrtVars.Buttons[fistChar]
        v.Text = string.gsub(v.Text,tostring(not BlxFrtVars.Buttons[fistChar]):upper(), tostring(BlxFrtVars.Buttons[fistChar]):upper())
        if BlxFrtVars.Buttons[fistChar] then
            coroutine.wrap(function()
                while BlxFrtVars.Buttons[fistChar] and wait(0.1) do
                    AI.KeyPress(keyCode)
                end
            end)()
        end
    end)
end
-- Events
BlxFrtVars.LocalPlayer.CharacterAdded:Connect(function(character)
    BlxFrtVars.Character = character
    BlxFrtVars.Humanoid = BlxFrtVars.Character:WaitForChild("Humanoid")
    if (BlxFrtVars.EquipAccesoryOnBoot ~= "") then
        BlxFrtVars.Humanoid:EquipTool(BlxFrtVars.LocalPlayer.Backpack:WaitForChild(BlxFrtVars.EquipAccesoryOnBoot))
        AI.Mouse1Click()
    end
    wait()
    if (BlxFrtVars.EquipItemOnBoot ~= "") then
        BlxFrtVars.Humanoid:EquipTool(BlxFrtVars.LocalPlayer.Backpack:WaitForChild(BlxFrtVars.EquipItemOnBoot))
    end
    wait(3)
    if (BlxFrtVars.EquipBusoOnBoot) then
        AI.KeyPress(106)
    end
    if (BlxFrtVars.AutoSprintOnBoot) then
        AI.KeyPress(306)
    end
    if (BlxFrtVars.AutoFarm) then
        wait(3)
        coroutine.wrap(autoFarm)() -- coroutine threads use less memory than normal threads???
    end
end)
-- Finally, show the GUI
TitleTxt:TweenPosition(UDim2.new(0.5, -320,0.5, -180),Enum.EasingDirection.Out,Enum.EasingStyle.Quart,1,true)
local TMPPOS = UDim2.new(0, TitleTxt.AbsolutePosition.X, 0, TitleTxt.AbsolutePosition.Y)
TitleTxt.AnchorPoint = Vector2.new(0,0)
TitleTxt.Position = TMPPOS
dragger.new(TitleTxt)
