# ZeroAcademia
## Instructions (Tabs)
> Because this was coded by an Arch Linux user, the customization are a lot but hard for new user.
### Main
+ This tab will show your Quirk name and Quirk item.
+ The "Welcome to ZeroAcademia" is inspired by Arch Linux.
### Auto
+ This tab has 2 sections: Auto Quest and Auto Farm
#### Auto Quest
+ Quest name are fetched in game storages, I don't manually type it.
+ This section shows quest you're doing and progress (If enabled)
#### Auto Farm
+ NPC Name is NPC's Name in **Workspace**, not the one in their head (although almost all NPCs has their head name = their workspace name)
+ NPC Find Retry is how much retries in finding NPC before fail.
+ Ex: I put 100 in it so it'll find the NPC with the name put above 100 times, if it found then it'll farm them else it'll show a message that it failed to find the NPC.
+ Height: Height from NPC to You [Ex: -200 means you're lower than the NPC 200 aka you're underground]
+ Rotation: Your character Vector3.X rotation (Ex: 90* means you look up, 270* means you look down)
+ Tips:
  + Earth Beast name is **Forest Beast**, Slidin Go, Electoplant and Crust name is **Pro Hero**
### Keys
+ Dropdown[1] is spam mode (AutoFarm++ = Auto Farm only, Boot = spawn only (only use once when spawn) and Normal = always)
+ Dropdown[2] is Argument Emulation mode:
  + nil = Nothing (This will emulate nothing in Key event)
  + CFrame = CFrame emulate (This will emulate CFrame in Key event, for Auto farm it uses NPC's CFrame and for others, it uses player's CFrame)
  + Vector3 = Vector3 emulate (This will emulate Vector3 in Key event, does same things as CFrame but some keys need Vector3 (ex: Explosion's V))
+ Tips:
  + If you used wrong argument emulation mode for the key, **you won't be able to use the skill again until you reset**
  + You can use nil if the Skill **has effect in front of player or dosen't follow the mouse**
  + CFrame if the skill is a **ranged skill** (ex: Pistol's swing,...)
  + Vector3 if the skill is a **flying skill** (ex: Explosion's V fly the player into a location)
  + You **always** need to use CFrame for Swing due to the game always send CFrame to server when you swing.
### Miscellaneous
#### Bypasses
+ Bypasses are some pre-coded bypasses for the game by me.
#### Quirk
+ **Auto Spin only works in the game intro screen, else you'll get kicked with "Possible exploit detected"**
+ Auto Spin is auto spin until you get the quirk(s) you put in the box.
#### Weapons
+ Pretty much useless, use game's GUI to equip the weapons are easier.
