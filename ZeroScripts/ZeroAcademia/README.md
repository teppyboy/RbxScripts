# ZeroAcademia
## Script
```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/teppyboy/RbxScripts/master/ZeroScripts/ZeroAcademia/Script.lua"))()
```
+ Exploits I don't list here are **not tested**
+ Working exploits:
  + [Krnl](https://krnl.rocks/) - 100% Working (I only use Krnl btw)
  + [SirHurt](https://www.google.com/search?q=pedophilia) - Semi-work (My friend tested, not me)
  + [Synapse X](https://x.synapse.to/) - Not tested (This was coded by looking at Synapse X documentation)
+ Non-working exploits:
  + [Oxygen U](https://oxygenu.xyz/) - Authentication not working, everything else does. (WILL FIX)
  + [WeAreDevs API](https://wearedevs.net/d/Exploit%20API) - A lot of functions are missing/crappy made and it has memory leaks.
  + [Proxo](https://www.google.com/search?q=Linkvertise%20*%20math.huge%20+%20Adware) - no
  + [Shadow](https://wearedevs.net/d/Shadow) - Memory leaks + missing functions
  + and All others exploits in WRD/any free exploits site.
## Instructions (Tabs)
> Because this was coded by an Arch Linux user, the customization are a lot but hard for new user.
### Main
+ This tab will show your Quirk name and Quirk item.
+ The "Welcome to ZeroAcademia" is inspired by Arch Linux.
### Auto
#### Auto Quest
+ Quest name are fetched in game storages, I don't manually type it.
+ This section shows quest you're doing and progress (If enabled)
#### Auto Farm
+ NPC Name is NPC's Name in **Workspace**, not the one in their head (although almost all NPCs has their head name = their workspace name)
+ NPC Find Retry is how much retries in finding NPC before fail.
+ Verify NPC **before** use anything related to that (It'll verify the NPC with name you typed exists)
  + Ex: I put 100 in it so it'll find the NPC with the name 100 times, if it found then verify will be sucessed
  + Tips:
    + Earth Beast name is **Forest Beast**
    + Slidin Go, Electoplant and Crust name is **Pro Hero**
    + Weak Nomu name is **Weak Nomu 1,Weak Nomu 2,Weak Nomu 3,Weak Nomu 4**
+ Vector3: Vector3 from NPC to You 
  + To change Height like old version does, do 0,HEIGHT,0
  + Ex: 0,-200,0 means you're lower than the NPC 200 aka you're underground
+ Rotation: Your character Vector3.X rotation
  + Ex: 90 means you look up, 270 means you look down
### Keys
+ **Dropdown[2] has been removed because the script now auto select the mode for you**
+ Dropdown[1] is spam mode (AutoFarm++ = Auto Farm only, Boot = spawn only (only use once when spawn) and Normal = always)
### Miscellaneous
#### Bypasses
+ Bypasses are some pre-coded bypasses for the game by me.
#### Quirk
+ **Auto Spin only works in the game intro screen, else you'll get kicked with "Possible exploit detected"**
+ Auto Spin is auto spin until you get the quirk(s) you put in the box.
#### Weapons
+ Pretty much useless, use game's GUI to equip the weapons are easier.

## Credits
+ [UntitledUI](https://github.com/teppyboy/RbxScripts/tree/master/Misc/UntitledUI) v1 for UI Library.
+ [PSU](https://psu.dev/) for their obfuscator.
