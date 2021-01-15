_G.FARMENABLED = true
local RS = game:GetService("ReplicatedStorage")
local RunSvc = game:GetService("RunService")
local LP = game:GetService("Players").LocalPlayer
local VU = game:GetService("VirtualUser")
local IntroGui = LP.PlayerGui.IntroGui
local ClientEvents = RS[tostring(LP.UserId).."Client"]
local Remotes = {
    StartMove = ClientEvents.StartMove,
    EndMove = ClientEvents.EndMove
}
LP.Idled:connect(function()
    VU:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    wait(1)
    VU:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)
LP.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(9999,9999,9999))
RunSvc:BindToRenderStep("FLYAAAAAA", 0, function() LP.Character.Humanoid:ChangeState(11) end)
while _G.FARMENABLED and wait() do
    for i, v in pairs(LP.Backpack:GetChildren()) do
        if not string.match(v.Name, "[0123456789]") then
            for idx, var in pairs(Remotes) do
                var:FireServer(v.Name)
            end
        end
    end
end
RunSvc:UnbindFromRenderStep("FLYAAAAAA")
