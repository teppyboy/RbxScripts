local Version = "1.0.2_rww"
--[[
    For game developers, feel free to take everything in this script
    without credit, I don't mind :)

    Tips: If you remove Wally UI reference (which I'll do in newer 
    version if I have time), this script works in Level 2 (LocalScript
    in normal games, not exploit)
]]
print("Performance Optimizer Version: "..Version.."")
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
local Bind = {}
Bind.Workspace = nil
Bind.Lighting = nil
local function Grayscaler(color3)
    local Graycolor = (color3.R + color3.G + color3.B) / 3
    return Color3.new(Graycolor,Graycolor,Graycolor) -- Grayscale
end
local Wally = loadstring(game:HttpGet("https://raw.githubusercontent.com/teppyboy/RbxScripts/master/Misc/UI_Libraries/WallyUILibraryV2.lua", true))()
local Window1 = Wally:CreateWindow('FPS Optimizer')
Window1:Label("Select object(s) to optimize")
Window1:Toggle('Part', {flag = "Part"})
Window1:Toggle('Decal', {flag = "Mesh"})
Window1:Toggle('ParticleEmitter', {flag = "ParticleEmitter"})
Window1:Toggle('Trail', {flag = "Trail"})
Window1:Toggle('Fire/Smoke/Sparkles', {flag = "FireSmokeSparkles"})
Window1:Toggle('Lights', {flag = "Lights"})
Window1:Toggle('Clothes (Partially work)', {flag = "Clothes"})
Window1:Toggle('BodyColors', {flag = "BodyColors"})
Window1:Toggle('Lighting Effects', {flag = "Effects"})
Window1:Toggle('Grayscale', {flag = "Grayscale"})
Window1:Toggle('Brightness', {flag = "Brightness"})
Window1:Toggle('Sky', {flag = "Sky"})
local function Optimize(v)
    -- Part/MeshPart
    if (v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") or v:IsA("MeshPart")) and Window1.flags.Part then
        v.Material = "SmoothPlastic"
        v.Reflectance = 0
        v.CastShadow = false
        if Window1.flags.Grayscale then
            v.Color = Grayscaler(v.Color)
        end
        if v:IsA("MeshPart") then
            v.TextureID = NothingTexture
        end
    -- Decal/Particles
    elseif (v:IsA("Decal") or v:IsA("Texture")) and Window1.flags.Mesh then
        v.Transparency = 1
    elseif v:IsA("ParticleEmitter") and Window1.flags.ParticleEmitter then
        for ba, ka in pairs(ParticleEmitterNS0) do
            v[ka] = NS0
        end
        for ba, ka in pairs(ParticleEmitterNR0) do
            v[ka] = NR0
        end
    elseif v:IsA("Trail") and Window1.flags.Trail then
        v.Lifetime = NR0
        for ba,ka in pairs(TrailNS0) do
            v[ka] = NS0
        end
    elseif v:IsA("Explosion") then
        v.BlastPressure = 1
        v.BlastRadius = 1
    elseif (v:IsA("Fire") or v:IsA("Smoke") or v:IsA("Sparkles")) and Window1.flags.FireSmokeSparkles then
        v.Enabled = false
    elseif (v:IsA("PointLight") or v:IsA("SurfaceLight") or v:IsA("SpotLight")) and Window1.flags.Lights then
        v.Brightness = 0
        v.Color = BlackColor
        v.Range = 0
        v.Shadows = false
        v.Enabled = false
    elseif v:IsA("SpecialMesh") and Window1.flags.Mesh then
        v.TextureId = NothingTexture
    -- Accessory
    elseif (v:IsA("Pants") or v:IsA("Shirt") or v:IsA("ShirtGraphic") or v:IsA("Accessory")) and Window1.flags.Clothes then
        v:Destroy()
    elseif v:IsA("BodyColors") and Window1.flags.BodyColors then
        for ba, ka in pairs(BodyColorsVars) do
            v[ka] = WhiteColor
        end
    -- Lighting
    elseif (v:IsA("BlurEffect") or v:IsA("SunRaysEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("BloomEffect") or v:IsA("DepthOfFieldEffect")) and Window1.flags.Effects then
        v.Enabled = false
    end
end

Window1:Button("Optimize", function()
local BeginTime = os.clock() -- Begin benchmark
    print("Optimizing Terrain...")
    for i, v in pairs({"WaterWaveSize","WaterWaveSpeed","WaterReflectance","WaterTransparency"}) do
        Terrain[v] = 0
    end
    if Window1.flags.Grayscale then 
        Terrain.WaterColor = BlackColor 
        for i, v in pairs(Enum.Material:GetEnumItems()) do
            pcall(function() 
                Terrain:SetMaterialColor(v,Grayscaler(Terrain:GetMaterialColor(v)))
            end)
        end
    end
    print("Optimizing Lighting...")
    Lighting.GlobalShadows = false
    Lighting.FogEnd = 9e9
    if Window1.flags.Brightness then
        Lighting.Brightness = 0
    end
    if Window1.flags.Sky then
        print("Extreme mode, using Fake Sky...")
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
    print("Optimizing Lighting[2]...")
    for i, v in pairs(Lighting:GetDescendants()) do
        coroutine.wrap(Optimize)(v)
    end
    if Bind.Workspace == nil then 
        print("Registering DescendantAdded to Workspace...")
        Bind.Workspace = workspace.DescendantAdded:Connect(function(descendant)
            coroutine.wrap(Optimize)(descendant)
        end)
    end
    if Bind.Lighting == nil then
        print("Registering DescendantAdded to Lighting...")
        Bind.Lighting = Lighting.DescendantAdded:Connect(function(descendant)
            coroutine.wrap(Optimize)(descendant)
        end)
    end
    print("Optimized ("..tostring(math.floor((os.clock() - BeginTime) * 1000)).."ms)")
    print("The process is still working in background but you can play now.")
end)
Window1:Label("NOTE: You can't revert changes")
Window1:Label("unless you rejoin the game.")
