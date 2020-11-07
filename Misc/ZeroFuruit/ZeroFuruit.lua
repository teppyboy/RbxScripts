-- Load the configuration.
if not WRDAPI then -- WTF? WeAreDevs can't even do some shit in blacklisting check???
    local jsCFG = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://raw.githubusercontent.com/teppyboy/RbxScripts/master/Misc/ZeroFuruit/ZeroFuruitCfg.json"))
    print("ZeroFuruit version: "..jsCFG.version)
    -- Exploit blacklist check
    local function actionAnalyzer(actionname, reason)
        if (actionname == "kick") then
            lplayer:Kick(reason)
        elseif (actionname == "warn") then
            warn(reason)
        end
    end
    for i, v in pairs(jsCFG.blacklistExploits) do
        print("Blacklist exploit check: "..v.name)
        for ba, ka in pairs(v.functions) do
            print("Begin check for function: "..ka)
            if getgenv()[ka] then
                actionAnalyzer(v.action, v.reason)
                break
            end
        end
        print("The exploit is not '"..v.name.."'")
    end
else
    lplayer:Kick([[WeAreDevs API exploits based are NOT supported due to Memory Leaks (instant Mem Leaks from 0.5GB -> 1.5GB when activate the Auto Farm)
    
    If you can't find any exploit then use Krnl/Oxygen X/etc... (Even Proxo and EasyExploits API exploits based too)
    
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
    
local ZeroFuruit = CreateInstance('ScreenGui',{DisplayOrder=0,Enabled=true,ResetOnSpawn=true,Name='ZeroFuruit', Parent=game.CoreGui})
local TitleTxt = CreateInstance('TextLabel',{Font=Enum.Font.Ubuntu,FontSize=Enum.FontSize.Size14,Text='ZeroFuruit',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,Active=false,AnchorPoint=Vector2.new(0.5, 0.5),BackgroundColor3=Color3.new(0.0784314, 0.0784314, 0.0784314),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0.5, -320,1.5, -180),Rotation=0,Selectable=false,Size=UDim2.new(0, 640, 0, 20),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='TitleTxt',Parent = ZeroFuruit})
local MainFrm = CreateInstance('Frame',{Style=Enum.FrameStyle.Custom,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.117647, 0.117647, 0.117647),BackgroundTransparency=0,BorderColor3=Color3.new(0.117647, 0.117647, 0.117647),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 0, 0, 20),Rotation=0,Selectable=false,Size=UDim2.new(0, 640, 0, 340),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name = 'MainFrm',Parent = TitleTxt})
local MainTabBtn = CreateInstance('TextButton',{Font=Enum.Font.Ubuntu,FontSize=Enum.FontSize.Size14,Text='Main',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.313726, 0.313726, 0.313726),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 0, 0, 0),Rotation=0,Selectable=true,Size=UDim2.new(0, 50, 0, 20),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='MainTabBtn',Parent = MainFrm})
local MainTabBtnTF = CreateInstance('Frame',{Style=Enum.FrameStyle.Custom,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0784314, 0.0784314, 0.0784314),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 0, 1, 0),Rotation=0,Selectable=false,Size=UDim2.new(0, 640, 0, 320),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name = 'MainTabBtnTF',Parent = MainTabBtn})
local TextBox = CreateInstance('TextBox',{ClearTextOnFocus=false,Font=Enum.Font.Ubuntu,FontSize=Enum.FontSize.Size14,MultiLine=true,Text=[[Welcome to ZeroFuruit!
This GUI is designed for [Blox Fruits]
Features:
+ Auto Farm (Walk To NPC) [Unpatched]
+ Auto Quest (Walk To NPC) [Beta] (Requires mouse1click())
+ Auto Click (As it intended to be)
+ Anti-AFK Bypass (Finally)

NOTE: This might be able to bypass the Anticheat but NOT other players\' eyes.

## I hope you enjoy using this GUI as much as i creating this :)]],TextColor3=Color3.new(1, 1, 1), PlaceholderText='', PlaceholderColor3=Color3.new(0.7, 0.7, 0.7),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0784314, 0.0784314, 0.0784314),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0.0109374998, 0, 0.0218749996, 0),Rotation=0,Selectable=true,Size=UDim2.new(0, 626, 0, 305),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='TextBox',Parent = MainTabBtnTF})
local AutoTabBtn = CreateInstance('TextButton',{Font=Enum.Font.Ubuntu,FontSize=Enum.FontSize.Size14,Text='Auto',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.313726, 0.313726, 0.313726),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0.078125, 0, 0, 0),Rotation=0,Selectable=true,Size=UDim2.new(0, 50, 0, 20),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='AutoTabBtn',Parent = MainFrm})
local AutoTabBtnTF = CreateInstance('Frame',{Style=Enum.FrameStyle.Custom,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0784314, 0.0784314, 0.0784314),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(-1, 0, 1, 0),Rotation=0,Selectable=false,Size=UDim2.new(0, 640, 0, 320),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=false,ZIndex=1,Name = 'AutoTabBtnTF',Parent = AutoTabBtn})
local npcListSF = CreateInstance('ScrollingFrame',{BottomImage='rbxasset://textures/ui/Scroll/scroll-bottom.png',CanvasPosition=Vector2.new(0, 0),CanvasSize=UDim2.new(0, 0, 0.5, 0),MidImage='rbxasset://textures/ui/Scroll/scroll-middle.png',ScrollBarThickness=5,ScrollingEnabled=true,TopImage='rbxasset://textures/ui/Scroll/scroll-top.png',Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0392157, 0.0392157, 0.0392157),BackgroundTransparency=0,BorderColor3=Color3.new(0.352941, 0.352941, 0.352941),BorderSizePixel=1,ClipsDescendants=true,Draggable=false,Position=UDim2.new(0, 7, 0, 62),Rotation=0,Selectable=true,Size=UDim2.new(0, 308, 0, 60),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='npcListSF',Parent = AutoTabBtnTF})
local npcListRtb = CreateInstance('TextBox',{ClearTextOnFocus=false,Font=Enum.Font.Ubuntu,FontSize=Enum.FontSize.Size14,MultiLine=true,Text='',TextColor3=Color3.new(1, 1, 1), PlaceholderText='', PlaceholderColor3=Color3.new(0.7, 0.7, 0.7),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0392157, 0.0392157, 0.0392157),BackgroundTransparency=0,BorderColor3=Color3.new(0.352941, 0.352941, 0.352941),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 0, 0, 0),Rotation=0,Selectable=true,Size=UDim2.new(0, 308, 0, 160),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='npcListRtb',Parent = npcListSF})
local antiVeloBtn = CreateInstance('TextButton',{Font=Enum.Font.Ubuntu,FontSize=Enum.FontSize.Size14,Text='Anti Velocity By Weapons [FALSE]',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0784314, 0.0784314, 0.0784314),BackgroundTransparency=0,BorderColor3=Color3.new(0.352941, 0.352941, 0.352941),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 329, 0, 149),Rotation=0,Selectable=true,Size=UDim2.new(0, 304, 0, 20),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='antiVeloBtn',Parent = AutoTabBtnTF})
local autoFrmBtn = CreateInstance('TextButton',{Font=Enum.Font.Ubuntu,FontSize=Enum.FontSize.Size14,Text='Auto Farm [FALSE]',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0784314, 0.0784314, 0.0784314),BackgroundTransparency=0,BorderColor3=Color3.new(0.352941, 0.352941, 0.352941),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 329, 0, 176),Rotation=0,Selectable=true,Size=UDim2.new(0, 304, 0, 20),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='autoFrmBtn',Parent = AutoTabBtnTF})
local autoQuestBtn = CreateInstance('TextButton',{Font=Enum.Font.Ubuntu,FontSize=Enum.FontSize.Size14,Text='Auto Quest [FALSE]',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0784314, 0.0784314, 0.0784314),BackgroundTransparency=0,BorderColor3=Color3.new(0.352941, 0.352941, 0.352941),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 329, 0, 204),Rotation=0,Selectable=true,Size=UDim2.new(0, 304, 0, 20),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='autoQuestBtn',Parent = AutoTabBtnTF})
local getNPCsBtn = CreateInstance('TextButton',{Font=Enum.Font.Ubuntu,FontSize=Enum.FontSize.Size14,Text='Get All Available NPCs On This Area',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0784314, 0.0784314, 0.0784314),BackgroundTransparency=0,BorderColor3=Color3.new(0.352941, 0.352941, 0.352941),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 7, 0, 35),Rotation=0,Selectable=true,Size=UDim2.new(0, 308, 0, 20),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='getNPCsBtn',Parent = AutoTabBtnTF})
local npcNameBox = CreateInstance('TextBox',{ClearTextOnFocus=false,Font=Enum.Font.Ubuntu,FontSize=Enum.FontSize.Size14,MultiLine=false,Text='',TextColor3=Color3.new(1, 1, 1), PlaceholderText='Kaguya-sama [Lv. math.huge]', PlaceholderColor3=Color3.new(0.7, 0.7, 0.7),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0392157, 0.0392157, 0.0392157),BackgroundTransparency=0,BorderColor3=Color3.new(0.352941, 0.352941, 0.352941),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 85, 0, 7),Rotation=0,Selectable=true,Size=UDim2.new(0, 230, 0, 20),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='npcNameBox',Parent = AutoTabBtnTF})
local npcNameTxt = CreateInstance('TextLabel',{Font=Enum.Font.Ubuntu,FontSize=Enum.FontSize.Size14,Text='NPC Name:',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0784314, 0.0784314, 0.0784314),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 7, 0, 7),Rotation=0,Selectable=false,Size=UDim2.new(0, 70, 0, 20),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='npcNameTxt',Parent = AutoTabBtnTF})
local QnpcNameTxt = CreateInstance('TextLabel',{Font=Enum.Font.Ubuntu,FontSize=Enum.FontSize.Size14,Text='Quest NPC Name:',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0784314, 0.0784314, 0.0784314),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 329, 0, 7),Rotation=0,Selectable=false,Size=UDim2.new(0, 110, 0, 20),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='QnpcNameTxt',Parent = AutoTabBtnTF})
local QnpcNameBox = CreateInstance('TextBox',{ClearTextOnFocus=false,Font=Enum.Font.Ubuntu,FontSize=Enum.FontSize.Size14,MultiLine=false,Text='',TextColor3=Color3.new(1, 1, 1), PlaceholderText='Enterprise', PlaceholderColor3=Color3.new(0.7, 0.7, 0.7),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0392157, 0.0392157, 0.0392157),BackgroundTransparency=0,BorderColor3=Color3.new(0.352941, 0.352941, 0.352941),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 439, 0, 7),Rotation=0,Selectable=true,Size=UDim2.new(0, 194, 0, 20),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='QnpcNameBox',Parent = AutoTabBtnTF})
local noticeTxt1 = CreateInstance('TextLabel',{Font=Enum.Font.Ubuntu,FontSize=Enum.FontSize.Size14,Text='NOTE: You must enable Auto Farm if you want Auto',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0784314, 0.0784314, 0.0784314),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 329, 0, 236),Rotation=0,Selectable=false,Size=UDim2.new(0, 304, 0, 15),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='noticeTxt1',Parent = AutoTabBtnTF})
local noticeTxt2 = CreateInstance('TextLabel',{Font=Enum.Font.Ubuntu,FontSize=Enum.FontSize.Size14,Text='Quest to work!',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0784314, 0.0784314, 0.0784314),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 329, 0, 256),Rotation=0,Selectable=false,Size=UDim2.new(0, 256, 0, 15),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='noticeTxt2',Parent = AutoTabBtnTF})
local QNameBox = CreateInstance('TextBox',{ClearTextOnFocus=false,Font=Enum.Font.Ubuntu,FontSize=Enum.FontSize.Size14,MultiLine=false,Text='',TextColor3=Color3.new(1, 1, 1), PlaceholderText='Mitsuri', PlaceholderColor3=Color3.new(0.7, 0.7, 0.7),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0392157, 0.0392157, 0.0392157),BackgroundTransparency=0,BorderColor3=Color3.new(0.352941, 0.352941, 0.352941),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 417, 0, 35),Rotation=0,Selectable=true,Size=UDim2.new(0, 216, 0, 20),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='QNameBox',Parent = AutoTabBtnTF})
local QNameTxt = CreateInstance('TextLabel',{Font=Enum.Font.Ubuntu,FontSize=Enum.FontSize.Size14,Text='Quest Name:',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0784314, 0.0784314, 0.0784314),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 329, 0, 35),Rotation=0,Selectable=false,Size=UDim2.new(0, 81, 0, 20),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='QNameTxt',Parent = AutoTabBtnTF})
local QLocBox = CreateInstance('TextBox',{ClearTextOnFocus=false,Font=Enum.Font.Ubuntu,FontSize=Enum.FontSize.Size14,MultiLine=false,Text='',TextColor3=Color3.new(1, 1, 1), PlaceholderText='Aqua-sama', PlaceholderColor3=Color3.new(0.7, 0.7, 0.7),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0392157, 0.0392157, 0.0392157),BackgroundTransparency=0,BorderColor3=Color3.new(0.352941, 0.352941, 0.352941),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 452, 0, 62),Rotation=0,Selectable=true,Size=UDim2.new(0, 181, 0, 20),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='QLocBox',Parent = AutoTabBtnTF})
local QLocTxt = CreateInstance('TextLabel',{Font=Enum.Font.Ubuntu,FontSize=Enum.FontSize.Size14,Text='NPC Loc (Vector3):',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0784314, 0.0784314, 0.0784314),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 329, 0, 62),Rotation=0,Selectable=false,Size=UDim2.new(0, 117, 0, 20),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='QLocTxt',Parent = AutoTabBtnTF})
local getCurLocBtn = CreateInstance('TextButton',{Font=Enum.Font.Ubuntu,FontSize=Enum.FontSize.Size14,Text='Get Current Location',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0784314, 0.0784314, 0.0784314),BackgroundTransparency=0,BorderColor3=Color3.new(0.352941, 0.352941, 0.352941),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 329, 0, 95),Rotation=0,Selectable=true,Size=UDim2.new(0, 304, 0, 20),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='getCurLocBtn',Parent = AutoTabBtnTF})
local curPlrLocBox = CreateInstance('TextBox',{ClearTextOnFocus=false,Font=Enum.Font.Ubuntu,FontSize=Enum.FontSize.Size14,MultiLine=false,Text='',TextColor3=Color3.new(1, 1, 1), PlaceholderText='Current Location will be printed here', PlaceholderColor3=Color3.new(0.7, 0.7, 0.7),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0392157, 0.0392157, 0.0392157),BackgroundTransparency=0,BorderColor3=Color3.new(0.352941, 0.352941, 0.352941),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 329, 0, 122),Rotation=0,Selectable=true,Size=UDim2.new(0, 304, 0, 20),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='curPlrLocBox',Parent = AutoTabBtnTF})
local autoClickBtn = CreateInstance('TextButton',{Font=Enum.Font.Ubuntu,FontSize=Enum.FontSize.Size14,Text='Auto Click [FALSE]',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0784314, 0.0784314, 0.0784314),BackgroundTransparency=0,BorderColor3=Color3.new(0.352941, 0.352941, 0.352941),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 329, 0, 283),Rotation=0,Selectable=true,Size=UDim2.new(0, 304, 0, 20),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='autoClickBtn',Parent = AutoTabBtnTF})
local equipItemBtn = CreateInstance('TextButton',{Font=Enum.Font.Ubuntu,FontSize=Enum.FontSize.Size14,Text='Equip Item On Spawn [FALSE]',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0784314, 0.0784314, 0.0784314),BackgroundTransparency=0,BorderColor3=Color3.new(0.352941, 0.352941, 0.352941),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 7, 0, 132),Rotation=0,Selectable=true,Size=UDim2.new(0, 308, 0, 20),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='equipItemBtn',Parent = AutoTabBtnTF})
local itemNameBox = CreateInstance('TextBox',{ClearTextOnFocus=false,Font=Enum.Font.Ubuntu,FontSize=Enum.FontSize.Size14,MultiLine=false,Text='',TextColor3=Color3.new(1, 1, 1), PlaceholderText='Wooden Sword', PlaceholderColor3=Color3.new(0.7, 0.7, 0.7),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0392157, 0.0392157, 0.0392157),BackgroundTransparency=0,BorderColor3=Color3.new(0.352941, 0.352941, 0.352941),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 85, 0, 162),Rotation=0,Selectable=true,Size=UDim2.new(0, 230, 0, 20),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='itemNameBox',Parent = AutoTabBtnTF})
local QnpcNameTxt = CreateInstance('TextLabel',{Font=Enum.Font.Ubuntu,FontSize=Enum.FontSize.Size14,Text='Item Name:',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0784314, 0.0784314, 0.0784314),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 7, 0, 162),Rotation=0,Selectable=false,Size=UDim2.new(0, 70, 0, 20),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='QnpcNameTxt',Parent = AutoTabBtnTF})
local getItemsBtn = CreateInstance('TextButton',{Font=Enum.Font.Ubuntu,FontSize=Enum.FontSize.Size14,Text='Get All Available Items On Inventory',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0784314, 0.0784314, 0.0784314),BackgroundTransparency=0,BorderColor3=Color3.new(0.352941, 0.352941, 0.352941),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 7, 0, 190),Rotation=0,Selectable=true,Size=UDim2.new(0, 308, 0, 20),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='getItemsBtn',Parent = AutoTabBtnTF})
local itemListSF = CreateInstance('ScrollingFrame',{BottomImage='rbxasset://textures/ui/Scroll/scroll-bottom.png',CanvasPosition=Vector2.new(0, 31),CanvasSize=UDim2.new(0, 0, 0.25, 0),MidImage='rbxasset://textures/ui/Scroll/scroll-middle.png',ScrollBarThickness=5,ScrollingEnabled=true,TopImage='rbxasset://textures/ui/Scroll/scroll-top.png',Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0392157, 0.0392157, 0.0392157),BackgroundTransparency=0,BorderColor3=Color3.new(0.352941, 0.352941, 0.352941),BorderSizePixel=1,ClipsDescendants=true,Draggable=false,Position=UDim2.new(0, 7, 0, 222),Rotation=0,Selectable=true,Size=UDim2.new(0, 308, 0, 49),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='itemListSF',Parent = AutoTabBtnTF})
local itemListRtb = CreateInstance('TextBox',{ClearTextOnFocus=false,Font=Enum.Font.Ubuntu,FontSize=Enum.FontSize.Size14,MultiLine=true,Text='',TextColor3=Color3.new(1, 1, 1), PlaceholderText='', PlaceholderColor3=Color3.new(0.7, 0.7, 0.7),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0392157, 0.0392157, 0.0392157),BackgroundTransparency=0,BorderColor3=Color3.new(0.352941, 0.352941, 0.352941),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 0, -1.67638063e-08, 0),Rotation=0,Selectable=true,Size=UDim2.new(0, 308, 0, 80),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='itemListRtb',Parent = itemListSF})
local antiAFKBtn = CreateInstance('TextButton',{Font=Enum.Font.Ubuntu,FontSize=Enum.FontSize.Size14,Text='Anti-AFK Bypass [FALSE]',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0784314, 0.0784314, 0.0784314),BackgroundTransparency=0,BorderColor3=Color3.new(0.352941, 0.352941, 0.352941),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 7, 0, 283),Rotation=0,Selectable=true,Size=UDim2.new(0, 308, 0, 20),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='antiAFKBtn',Parent = AutoTabBtnTF})
local Auto2TabBtn = CreateInstance('TextButton',{Font=Enum.Font.Ubuntu,FontSize=Enum.FontSize.Size14,Text='Auto (2)',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.313726, 0.313726, 0.313726),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0.15625, 0, 0, 0),Rotation=0,Selectable=true,Size=UDim2.new(0, 50, 0, 20),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='Auto2TabBtn',Parent = MainFrm})
local Auto2TabBtnTF = CreateInstance('Frame',{Style=Enum.FrameStyle.Custom,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0784314, 0.0784314, 0.0784314),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(-2, 0, 1, 0),Rotation=0,Selectable=false,Size=UDim2.new(0, 640, 0, 320),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=false,ZIndex=1,Name = 'Auto2TabBtnTF',Parent = Auto2TabBtn})
local tpModeBtn = CreateInstance('TextButton',{Font=Enum.Font.Ubuntu,FontSize=Enum.FontSize.Size14,Text='Teleport Bypass Mode: [AUTO]',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0784314, 0.0784314, 0.0784314),BackgroundTransparency=0,BorderColor3=Color3.new(0.352941, 0.352941, 0.352941),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 11, 0, 7),Rotation=0,Selectable=true,Size=UDim2.new(0, 304, 0, 20),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='tpModeBtn',Parent = Auto2TabBtnTF})
local CloseBtn = CreateInstance('ImageButton',{Image='',ImageColor3=Color3.new(0.156863, 0.156863, 0.156863),ImageRectOffset=Vector2.new(0, 0),ImageRectSize=Vector2.new(0, 0),ImageTransparency=0,ScaleType=Enum.ScaleType.Stretch,SliceCenter=Rect.new(0, 0, 0, 0),AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(1, 0, 0),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 622, 0, 2),Rotation=0,Selectable=true,Size=UDim2.new(0, 15, 0, 15),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='CloseBtn',Parent = TitleTxt})
local MinMaxBtn = CreateInstance('ImageButton',{Image='',ImageColor3=Color3.new(0.156863, 0.156863, 0.156863),ImageRectOffset=Vector2.new(0, 0),ImageRectSize=Vector2.new(0, 0),ImageTransparency=0,ScaleType=Enum.ScaleType.Stretch,SliceCenter=Rect.new(0, 0, 0, 0),AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0235294, 0.447059, 1),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 604, 0, 2),Rotation=0,Selectable=true,Size=UDim2.new(0, 15, 0, 15),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='MinMaxBtn',Parent = TitleTxt})

-- Drag
local dragger = {}; do
    local mouse        = game:GetService("Players").LocalPlayer:GetMouse();
    local inputService = game:GetService('UserInputService');
    local heartbeat    = game:GetService("RunService").Heartbeat;
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
    for i, v in pairs(taget:GetChildren()) do
        v.Visible = false
    end
    taget:TweenSize(UDim2.new(0,0,0,320),Enum.EasingDirection.Out,Enum.EasingStyle.Quart,0.5,true, function() 
        taget.Visible = false
        taget.Size = baksize
        for i, v in pairs(taget:GetChildren()) do
            v.Visible = true
        end
        barbaraidol = true 
    end)
    while not barbaraidol do
        wait()
    end
end
local function tweenVisTab(tab)
    for i, v in pairs(tab:GetDescendants()) do
        v.Visible = false
    end
    tab.Size = UDim2.new(0,0,0,320)
    tab.Visible = true
    local barbaraidol = false
    tab:TweenSize(UDim2.new(0,640,0,320),Enum.EasingDirection.Out,Enum.EasingStyle.Quart,0.35,true, function() 
        for i, v in pairs(tab:GetDescendants()) do
            v.Visible = true
        end
        barbaraidol = true 
    end)
    while not barbaraidol do
        wait()
    end
end
MainTabBtn.MouseButton1Click:Connect(function()
    local tartab = MainTabBtn[MainTabBtn.Name.."TF"]
    if tartab.Visible then return end
    devisAllTab()
    tweenVisTab(tartab)
end)
AutoTabBtn.MouseButton1Click:Connect(function()
    local tartab = AutoTabBtn[AutoTabBtn.Name.."TF"]
    if tartab.Visible then return end
    devisAllTab()
    tweenVisTab(tartab)
end)
Auto2TabBtn.MouseButton1Click:Connect(function()
    local tartab = Auto2TabBtn[Auto2TabBtn.Name.."TF"]
    if tartab.Visible then return end
    devisAllTab()
    tweenVisTab(tartab)
end)
-- Script
local Players = game:GetService("Players")
local lplayer = Players.LocalPlayer
local char = lplayer.Character
local BlxFrtVars = {}
BlxFrtVars.WeaponHasKb = false
BlxFrtVars.AutoQuest = false
BlxFrtVars.AutoFarm = false
BlxFrtVars.AutoQuest = false
BlxFrtVars.EquipItemOnBoot = ""
BlxFrtVars.TeleportMode = "Auto" -- can be Auto/Unsafe/Safe (Auto = auto, Unsafe = always shamblesTo(), Safe = always moveTo())
BlxFrtVars.AutoClick = false
BlxFrtVars.AntiAFKBypass = false
BlxFrtVars.MainGUI = lplayer.PlayerGui.Main
BlxFrtVars.DialogFrame = BlxFrtVars.MainGUI.Dialogue
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
	repeat wait() until Players.LocalPlayer and Players.LocalPlayer.Character and getRoot(Players.LocalPlayer.Character) and Players.LocalPlayer.Character:FindFirstChild('Humanoid')
	local T = getRoot(Players.LocalPlayer.Character)
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
local function NoclipLoop(enable)
    for _, child in pairs(char:GetDescendants()) do
        if child:IsA("BasePart") and child.CanCollide == enable then
            child.CanCollide = not enable
        end
    end
end
function NOFLY()
	FLYING = false
	Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
end
-- END
local VU = game:GetService("VirtualUser")
local TS = game:GetService("TweenService")
local function shamblesTo(part1, part2)
    local targetCFrame = part2.CFrame
    local a = TweenInfo.new(math.abs((part2.Position- part1.Position).Magnitude) / char.Humanoid.WalkSpeed,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0)
    local b = TS:Create(part1 ,a ,{CFrame = targetCFrame})
    b:Play()
    while (part1.Position - part2.Position).Magnitude > 5 do wait(0.1) end
end
local function moveTo(humanoid, targetPart)
    local targetPoint = targetPart.Position
    humanoid:MoveTo(targetPoint, targetPart)
    local function ababa()
        if humanoid.MoveDirection.Magnitude <= 0 then -- Are we walking?
            -- does the humanoid still exist?
            if not (humanoid and humanoid.Parent) then
                return 'break'
            end
            -- refresh the timeout
            humanoid:MoveTo(targetPoint, targetPart)
        end
        if targetPart.Position ~= targetPoint then
            targetPoint = targetPart.Position
            -- refresh the timeout
            humanoid:MoveTo(targetPoint, targetPart)
        end
        wait(0.01)
    end
    while (targetPoint - char.HumanoidRootPart.Position).Magnitude > 5 do
        if ababa() == 'break' then break end
    end
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
    local hrp = char.HumanoidRootPart
    -- A
    if BlxFrtVars.TeleportMode == "Safe" then
        moveTo(char.Humanoid, targetPart)
    elseif BlxFrtVars.TeleportMode == "Unsafe" then
        shamblesTo(hrp, targetPart)
    else -- Your "Auto" mode.
        if math.abs((targetPart.Position - hrp.Position).Y) <= 10 then
            moveTo(char.Humanoid, targetPart)
        else
            shamblesTo(hrp, targetPart)
        end
    end
end
AI.getNPC = function(name, mode)
    local newcctable = {}
    for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
        if (v.Name == name) and (v:FindFirstChild("HumanoidRootPart") ~= nil) and (v.Humanoid.Health > 0) then
            table.insert(newcctable, v)
        end
    end
    if mode == nil then
        return newcctable[math.random(1,#newcctable)]
    elseif mode == "nearest" then --nearest so it wont waste the time.
        local nearestnpc
        local nearestnpcmag = math.huge
        for i, v in pairs(newcctable) do 
            local abctmp = (v.HumanoidRootPart.Position - char.HumanoidRootPart.Position).Magnitude
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
    if is_sirhurt_closure then
        leftclick()
    else
        mouse1click()
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
    wait(0.5)
    local qiuBtn
    while not BlxFrtVars.DialogFrame.Visible do 
        AI.HWMouse1Click()
        wait(0.25)
    end
    wait(0.5)
    for i, v in pairs(BlxFrtVars.DialogFrame:GetChildren()) do
        if (v:IsA("TextButton") and v.TextLabel.Text == QNameBox.Text) then
            while BlxFrtVars.DialogFrame.Option1.TextLabel.Text ~= "Confirm" do 
                AI.btnClicker(v,BlxFrtVars.MainGUI)
                wait(0.25) 
            end
            break
        end
    end
    wait(0.5)
    for i, v in pairs(BlxFrtVars.DialogFrame:GetChildren()) do
        if (v:IsA("TextButton") and v.TextLabel.Text == "Confirm") then
            while AI.GetDialogText() ~= "[Quest accepted.]" do 
                setclipboard(AI.GetDialogText())
                AI.btnClicker(v,BlxFrtVars.MainGUI)
                wait(0.25) 
            end
            break
        end
    end
    wait(0.25)
    while BlxFrtVars.DialogFrame.Visible do 
        AI.Mouse1Click()
        wait(0.25)
    end
end
local function autoFarm()
    while wait() and BlxFrtVars.AutoFarm and (char:WaitForChild("Humanoid",5).Health > 0) do
        local Noclipping = game:GetService('RunService').Stepped:connect(function()
            NoclipLoop(true)
        end) -- temp nc
        if BlxFrtVars.AutoQuest then
            if not BlxFrtVars.MainGUI.Quest.Visible then
                autoQuest()
            end
        end
        local v = nil
        while v == nil do
            v = AI.getNPC(npcNameBox.Text,"nearest")
            wait(0.05)
        end
        AI.SmartMove(v.HumanoidRootPart)
        Noclipping:Disconnect()
        NoclipLoop(false)
        while (v.Humanoid.Health > 0) do
            if (v.HumanoidRootPart.Position - char.HumanoidRootPart.Position).Magnitude > 5 then
                AI.SmartMove(v.HumanoidRootPart)
            end
            if (BlxFrtVars.WeaponHasKb) then sFLY() end
            AI.Mouse1Click()
            wait(0.2)
            if (BlxFrtVars.WeaponHasKb) then NOFLY() end
        end
    end
end
local function autoClick()
    while wait(0.1) and BlxFrtVars.AutoClick do
        AI.Mouse1Click()
    end
end
local antiAFKRBXScriptSignal = nil
local function antiAFKBypass(mamapurpleheart)
    if mamapurpleheart then
        antiAFKRBXScriptSignal = lplayer.Idled:connect(function()
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
    char.Humanoid:UnequipTools()
    for i,v in pairs(lplayer.Backpack:GetChildren()) do
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
autoFrmBtn.MouseButton1Click:Connect(function()
    BlxFrtVars.AutoFarm = not BlxFrtVars.AutoFarm
    autoFrmBtn.Text = "Auto Farm ["..tostring(BlxFrtVars.AutoFarm):upper().."]"
    if (BlxFrtVars.AutoFarm) then
        char = lplayer.Character
        coroutine.wrap(autoFarm)() -- coroutine threads use less memory than normal threads???
    end
end)
autoClickBtn.MouseButton1Click:Connect(function()
    BlxFrtVars.AutoClick = not BlxFrtVars.AutoClick
    autoClickBtn.Text = "Auto Click ["..tostring(BlxFrtVars.AutoClick):upper().."]"
    if (BlxFrtVars.AutoClick) then
        coroutine.wrap(autoClick)() -- coroutine threads use less memory than normal threads???
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
lplayer.CharacterAdded:Connect(function(character)
    char = character
    char:WaitForChild("Humanoid")
    if (BlxFrtVars.EquipItemOnBoot ~= "") then
        print("Z")
        char.Humanoid:EquipTool(lplayer.Backpack:WaitForChild(BlxFrtVars.EquipItemOnBoot))
    end
    if (BlxFrtVars.AutoFarm) then
        wait(5)
        coroutine.wrap(autoFarm)() -- coroutine threads use less memory than normal threads???
    end
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
    curPlrLocBox.Text = tostring(char.HumanoidRootPart.Position)
end)
-- Finally, show the GUI
TitleTxt:TweenPosition(UDim2.new(0.5, -320,0.5, -180),Enum.EasingDirection.Out,Enum.EasingStyle.Quart,1,true)
local TMPPOS = UDim2.new(0, TitleTxt.AbsolutePosition.X, 0, TitleTxt.AbsolutePosition.Y)
TitleTxt.AnchorPoint = Vector2.new(0,0)
TitleTxt.Position = TMPPOS
dragger.new(TitleTxt)
