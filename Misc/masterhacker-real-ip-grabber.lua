-- Idea from https://www.reddit.com/r/masterhacker/comments/m809gp/trace_the_account_link_with_an_ip_tracker/
-- This script was coded with GitHub IDE without testing (may test with selene in the future)
-- Here, if you want to give this script to some 11 yo "hackers" then obfuscate it with PSU (discord.gg/psu) first then give them the obfuscated file.
-- Although this was designed for exploits but it works with Roblox Studio localscript (Identity 2) because it dosent access anything that require identity > 2
local Players = game:GetService("Players")
for _, v in pairs(Players:GetPlayers()) do
  print(string.format("%s | UserID: %d - STATUS: TRYING TO GET IP ADDRESS...", v.Name, v.UserId)
  wait(math.random(1,3))
  warn(string.format("%s | UserID: %d - STATUS: IP FOUND: %d.%d.%d.%d", v.Name, v.UserId, math.random(1, 255), math.random(1, 255), math.random(1, 255), math.random(1, 255)))
end

-- Become masterhacker NOW with https://hackertyper.net FOR FREE!!! (NOT SPONSORED)
