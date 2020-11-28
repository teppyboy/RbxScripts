local Version = "1.0.0_test"
print("Performance Optimizer Version: "..Version.." | This even works with Roblox Studio command bar!")
print("Initalizing...")
local function mkDrag(gui) -- https://devforum.roblox.com/t/draggable-property-is-hidden-on-gui-objects/107689/5 Roblox Staff code :))))
    local UserInputService = game:GetService("UserInputService")
    local dragging
    local dragInput
    local dragStart
    local startPos
    local function update(input)
        local delta = input.Position - dragStart
        gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
    gui.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = gui.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    gui.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            update(input)
        end
    end)
end
-- End
local Lighting = game:GetService("Lighting")
local Terrain = workspace.Terrain
local NR0 = NumberRange.new(0)
local NS0 = NumberSequence.new(0)
local NS1 = NumberSequence.new(1)
local WhiteColor = Color3.fromRGB(255,255,255)
local BlackColor = Color3.fromRGB(0,0,0)
local NothingTexture = "rbxassetid://160612406"
local ParticleEmitterNS0 = {"Size","Rate","LightEmission","LightInfluence"}
local ParticleEmitterNR0 = {"Lifetime","Speed","Rotation","RotSpeed"}
local TrailNS0 = {"TextureLength","MaxLength","MinLength","WidthScale"}
local BodyColorsVars = {"HeadColor3","LeftArmColor3","LeftLegColor3","RightArmColor3","RightLegColor3","TorsoColor3"}
local OptimizeMode = "Normal"
local Bind = {}
Bind.Workspace = nil
Bind.Lighting = nil
local function Optimize(v)
    -- Part/MeshPart
    if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") or v:IsA("MeshPart") then
        local Graycolor = (v.Color.R + v.Color.G + v.Color.B) / 3
        --print("R: "..tostring(v.Color.R).." G: "..tostring(v.Color.G).." B: "..tostring(v.Color.B).." Grayscaled: "..tostring(Graycolor))
        v.Material = "SmoothPlastic"
        v.Reflectance = 0
        v.CastShadow = false
        v.Color = Color3.new(Graycolor,Graycolor,Graycolor)
        if v:IsA("MeshPart") then
            v.TextureID = NothingTexture
        end
    -- Decal/Particles
    elseif v:IsA("Decal") or v:IsA("Texture") then
        v.Transparency = 1
    elseif v:IsA("ParticleEmitter") then
        for ba, ka in pairs(ParticleEmitterNS0) do
            v[ka] = NS0
        end
        for ba, ka in pairs(ParticleEmitterNR0) do
            v[ka] = NR0
        end
    elseif v:IsA("Trail") then
        v.Lifetime = NR0
        for ba,ka in pairs(TrailNS0) do
            v[ka] = NS0
        end
    elseif v:IsA("Explosion") then
        v.BlastPressure = 1
        v.BlastRadius = 1
    elseif v:IsA("Fire") or v:IsA("Smoke") or v:IsA("Sparkles") or v:IsA("PointLight") or v:IsA("SurfaceLight") or v:IsA("SpotLight") then
        v.Enabled = false
    -- Accessory
    elseif v:IsA("Pants") or v:IsA("Shirt") or v:IsA("ShirtGraphic") or v:IsA("Accessory") then
        v:Destroy()
    elseif v:IsA("BodyColors") and OptimizeMode == "Extreme" then
        for ba, ka in pairs(BodyColorsVars) do
            v[ka] = WhiteColor
        end
    -- Lighting
    elseif v:IsA("BlurEffect") or v:IsA("SunRaysEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("BloomEffect") or v:IsA("DepthOfFieldEffect") then
        v.Enabled = false
    end
end
print("Initalized")

local function CreateInstance(cls,props)
local inst = Instance.new(cls)
for i,v in pairs(props) do
    inst[i] = v
end
return inst
end
    
local PO = CreateInstance('ScreenGui',{DisplayOrder=0,Enabled=true,ResetOnSpawn=true,Name='PO', Parent=game.CoreGui})
local POF = CreateInstance('Frame',{Style=Enum.FrameStyle.Custom,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0, 0, 0),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0.0181818176, 0, 0.0434782617, 0),Rotation=0,Selectable=false,Size=UDim2.new(0.087272726, 0, 0.20869568, 0),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name = 'POF',Parent = PO})
local Title = CreateInstance('TextLabel',{Font=Enum.Font.Code,FontSize=Enum.FontSize.Size14,Text='Performance Optimizer',TextColor3=Color3.new(1, 1, 1),TextScaled=true,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=true,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.0784314, 0.0784314, 0.0784314),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 0, 0, 0),Rotation=0,Selectable=false,Size=UDim2.new(1, 0, 0.0800440237, 0),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='Title',Parent = POF})
local Description = CreateInstance('TextLabel',{Font=Enum.Font.Code,FontSize=Enum.FontSize.Size9,Text='Description',TextColor3=Color3.new(1, 1, 1),TextScaled=true,TextSize=9,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=true,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0, 0, 0),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0.0500000007, 0, 0.276977658, 0),Rotation=0,Selectable=false,Size=UDim2.new(0.899999976, 0, 0.304929525, 0),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='Description',Parent = POF})
local CloseBtn = CreateInstance('TextButton',{Font=Enum.Font.Code,FontSize=Enum.FontSize.Size14,Text='X',TextColor3=Color3.new(1, 1, 1),TextScaled=true,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=true,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.117647, 0.117647, 0.117647),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0.875, 0, 0.644163668, 0),Rotation=0,Selectable=true,Size=UDim2.new(0.075000003, 0, 0.077502951, 0),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='CloseBtn',Parent = POF})
local OptimizeBtn = CreateInstance('TextButton',{Font=Enum.Font.Code,FontSize=Enum.FontSize.Size14,Text='Optimize',TextColor3=Color3.new(1, 1, 1),TextScaled=true,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=true,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.117647, 0.117647, 0.117647),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0.0500000007, 0, 0.644163668, 0),Rotation=0,Selectable=true,Size=UDim2.new(0.75, 0, 0.077502951, 0),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='OptimizeBtn',Parent = POF})
local ExtremeModeBtn = CreateInstance('TextButton',{Font=Enum.Font.Code,FontSize=Enum.FontSize.Size14,Text='Extreme',TextColor3=Color3.new(1, 1, 1),TextScaled=true,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=true,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.117647, 0.117647, 0.117647),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0.649999976, 0, 0.130865589, 0),Rotation=0,Selectable=true,Size=UDim2.new(0.300000042, 0, 0.0775029734, 0),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='ExtremeModeBtn',Parent = POF})
local NormalModeBtn = CreateInstance('TextButton',{Font=Enum.Font.Code,FontSize=Enum.FontSize.Size14,Text='Normal',TextColor3=Color3.new(1, 1, 1),TextScaled=true,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=true,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.117647, 0.117647, 0.117647),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0.0499999672, 0, 0.130865589, 0),Rotation=0,Selectable=true,Size=UDim2.new(0.300000072, 0, 0.077502951, 0),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='NormalModeBtn',Parent = POF})
local Note = CreateInstance('TextLabel',{Font=Enum.Font.Code,FontSize=Enum.FontSize.Size8,Text='NOTE: You can\'t Undo this unless you rejoin the game.',TextColor3=Color3.new(1, 1, 1),TextScaled=true,TextSize=8,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=true,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0, 0, 0),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0.0500000007, 0, 0.764999986, 0),Rotation=0,Selectable=false,Size=UDim2.new(0.899999976, 0, 0.209999993, 0),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='Note',Parent = POF})
mkDrag(POF)
NormalModeBtn.MouseButton1Click:Connect(function()
    OptimizeMode = "Normal"
    Description.Text = "Normal mode, suitable for users who wants to maintain gameplay and performance"
end)
ExtremeModeBtn.MouseButton1Click:Connect(function()
    OptimizeMode = "Extreme"
    Description.Text = "Extreme mode, all optimization will be used. Not recommended unless you really need this"
end)
CloseBtn.MouseButton1Click:Connect(function()
    PO:Destroy()
end)
OptimizeBtn.MouseButton1Click:Connect(function()
    local BeginTime = os.clock()
    print("Optimizing Terrain...")
    for i, v in pairs({"WaterWaveSize","WaterWaveSpeed","WaterReflectance","WaterTransparency"}) do
        Terrain[v] = 0
    end
    Terrain.WaterColor = BlackColor
    print("Optimizing Lighting...")
    Lighting.GlobalShadows = false
    Lighting.FogEnd = 9e9
    Lighting.Brightness = 0
    if OptimizeMode == "Extreme" then
        local FakeSky = Instance.new("Sky", Lighting)
        FakeSky.CelestialBodiesShown = false
        for i, v in pairs({"SunTextureId","MoonTextureId","SkyboxBk","SkyboxDn","SkyboxFt","SkyboxLf","SkyboxRt","SkyboxUp"}) do
            FakeSky[v] = NothingTexture
        end
        FakeSky.StarCount = 0
        FakeSky.SunAngularSize = 0
        FakeSky.MoonAngularSize = 0
        for i, v in pairs(Lighting:GetChildren()) do
            if v:IsA("Sky") and v ~= FakeSky then
                v:Destroy()
            end
        end
    end
    --settings().Rendering.QualityLevel = "Level01"
    print("Optimizing Workspace...")
    for i, v in pairs(workspace:GetDescendants()) do
        coroutine.wrap(Optimize)(v)
    end
    print("Optimizing Lighting...")
    for i, v in pairs(Lighting:GetDescendants()) do
        coroutine.wrap(Optimize)(v)
    end
    print("Registering DescendantAdded to Workspace...")
    if Bind.Workspace ~= nil then Bind.Workspace:Disconnect() end
    Bind.Workspace = workspace.DescendantAdded:Connect(function(descendant)
        coroutine.wrap(Optimize)(descendant)
    end)
    print("Registering DescendantAdded to Lighting...")
    if Bind.Lighting ~= nil then Bind.Lighting:Disconnect() end
    Bind.Lighting = Lighting.DescendantAdded:Connect(function(descendant)
        coroutine.wrap(Optimize)(descendant)
    end)
    print("Done")
    OptimizeBtn.Text = "Optimized ("..tostring(math.floor((os.clock() - BeginTime) * 1000)).."ms)" 
    print("The process is still working in background but you can play now.")
end)
