local HS = game:GetService("HttpService")
local Players = game:GetService("Players")
local PrivZeroAuth = {}
PrivZeroAuth.LogWebhook = nil
PrivZeroAuth.Database = nil -- Unused
PrivZeroAuth.GetIPv4 = function()
	return game:HttpGet("https://checkip.amazonaws.com/")
end
PrivZeroAuth.GetHWID = function()
	if gethwid then return gethwid() end
	if syn then return "Syn-Fingerprint" end
	return "Exploit not supported"
end
PrivZeroAuth.GetRBXID = function()
	return Players.LocalPlayer.UserId
end
PrivZeroAuth.GetRBXName = function()
	return Players.LocalPlayer.Name
end
PrivZeroAuth.GetRBXAvatar = function()
	local Uri, Status = Players:GetUserThumbnailAsync(PrivZeroAuth.GetRBXID(),Enum.ThumbnailType.HeadShot,Enum.ThumbnailSize.Size100x100)
	return Uri
end
PrivZeroAuth.GetExploit = function()
	local ExploitDB = game:HttpGet("https://raw.githubusercontent.com/teppyboy/RbxScripts/master/ZeroScripts/Authentication/ExploitDatabase.json")
	for i, v in pairs(HS:JSONDecode(ExploitDB)) do
		local FuncAvailable, FakeFunc = false, false
		for i2, v2 in pairs(v.Functions) do
			if getgenv()[v2] then
				FuncAvailable = true
				break
			end
		end
		for i3, v3 in pairs(v.FakeFunctions) do
			if getgenv()[v3] then
				FakeFunc = true
				break
			end
		end
		if FuncAvailable and not FakeFunc then return v.Name end
	end
	return "Unknown"
end
PrivZeroAuth.RequestMethod = "request"
local RequestFunction
if PrivZeroAuth.GetExploit() == "Synapse" then
	PrivZeroAuth.RequestMethod = "syn.request"
	RequestFunction = syn.request
elseif http_request then
	PrivZeroAuth.RequestMethod = "http_request"
	RequestFunction = http_request
elseif request then
	PrivZeroAuth.RequestMethod = "request"
	RequestFunction = request
else
	error("Request is not supported in this exploit!")
end
local function gsplit(text, pattern, plain)
	local splitStart, length = 1, #text
	return function()
		if splitStart then
		  local sepStart, sepEnd = string.find(text, pattern, splitStart, plain)
		  local ret
		  if not sepStart then
		    ret = string.sub(text, splitStart)
		    splitStart = nil
		  elseif sepEnd < sepStart then
		    -- Empty separator!
		    ret = string.sub(text, splitStart, sepStart)
		    if sepStart < length then
		      splitStart = sepStart + 1
		    else
		      splitStart = nil
		    end
		  else
		    ret = sepStart > splitStart and string.sub(text, splitStart, sepStart - 1) or ''
		    splitStart = sepEnd + 1
		  end
		  return ret
		end
	end
end
local MiscFunc = {
	RGBToHex = function(RGBTbl)
		local hexadecimal = ''
		for key, value in pairs(RGBTbl) do
			local hex = ''
			while(value > 0)do
				local index = math.fmod(value, 16) + 1
				value = math.floor(value / 16)
				hex = string.sub('0123456789ABCDEF', index, index) .. hex			
			end

			if(string.len(hex) == 0)then
				hex = '00'

			elseif(string.len(hex) == 1)then
				hex = '0' .. hex
			end

			hexadecimal = hexadecimal .. hex
		end
		return hexadecimal
	end,
	SplitString = function(text, pattern, plain)
	  	local ret = {}
	  	for match in gsplit(text, pattern, plain) do
	    	table.insert(ret, match)
	  	end
	 	return ret
	end
}
MiscFunc.HexToDecimal = function(H3x)
	local ColorConvTbl = {
		["A"] = "10",
		["B"] = "11",
		["C"] = "12",
		["D"] = "13",
		["E"] = "14",
		["F"] = "15",
	}
	local ColorSplit = MiscFunc.SplitString(H3x,"")
	local newColorSplit = {}
    for index, value in pairs(ColorSplit) do
    	local newTxt
    	for i, v in pairs(ColorConvTbl) do
    		local oldTxt = value
    		newTxt = string.gsub(value,i,v)
    		if oldTxt ~= newTxt then 
    			break 
    		end
    	end
    	table.insert(newColorSplit,tonumber(newTxt))
    end
    local decClr = 1
    for i, v in pairs(newColorSplit) do
    	decClr = decClr * v
    end
    decClr = decClr - 1
    return decClr
end
local ZeroScripts = {
	['ZeroAcademia'] = true,
	['ZeroFuruit'] = true,
	['ZeroBark'] = true
}
local ZeroAuthentication = {}
ZeroAuthentication.Initialize = function(ZACfg)
	PrivZeroAuth.LogWebhook = ZACfg.LogWebhook
	PrivZeroAuth.Database = ZACfg.Database
	return 0
end
ZeroAuthentication.Authenticate = function(ZeroScriptName)
	if ZeroScripts[ZeroScriptName] == true then
		-- Logging
		local ZeroLogBody = {
			username = "ZeroScripts Authentication",
			embeds = {
				{
					title = "User Logged",
					thumbnail = {
						url = PrivZeroAuth.GetRBXAvatar(),
						height = 64,
						width = 64
					},
					fields = {
						{
							name = "Roblox Name:",
							value = PrivZeroAuth.GetRBXName(),
							inline = true
						},
						{
							name = "Roblox ID:",
							value = tostring(PrivZeroAuth.GetRBXID()),
							inline = false
						},
						{
							name = "IPv4:",
							value = PrivZeroAuth.GetIPv4(),
							inline = true
						},
						{
							name = "Hardware ID:",
							value = PrivZeroAuth.GetHWID(),
							inline = false
						},
						{
							name = "Execute Time (Unix):",
							value = string.format("%ds",os.time()),
							inline = true
						},
						{
							name = "Exploit:",
							value = PrivZeroAuth.GetExploit(),
							inline = false
						},
						{
							name = "Request Method:",
							value = PrivZeroAuth.RequestMethod,
							inline = true
						},
						{
							name = "Product:",
							value = ZeroScriptName,
							inline = false
						}
					},
					author = {
						name = "ZeroScripts Authentication",
						url = "https://github.com/teppyboy",
						icon_url = "https://cdn.discordapp.com/attachments/791359897152913438/791359966598529074/EmDnN5zU8AAE7CJ.jpeg"
					},
					footer = {
						text = "ZeroScripts Logger [v1.0] [TEST]"
					},
					color = MiscFunc.HexToDecimal(MiscFunc.RGBToHex({math.random(0,255),math.random(0,255),math.random(0,255)}))
				}
			}
		}
		local Encoded_Body = HS:JSONEncode(ZeroLogBody)
		local response = RequestFunction({
	    	Url = PrivZeroAuth.LogWebhook,
	    	Method = 'POST',
	        Headers = {
	            ["Content-Type"] = "application/json"
	        },
	        Body = Encoded_Body
		})
		if not response.Success then
			error("Couldn't log this client to the server!")
		end
	else
		error(string.format("[%s] is not a part of ZeroScripts", ZeroScriptName))
	end
end
return ZeroAuthentication
