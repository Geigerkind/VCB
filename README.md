# Vanilla Consolidate Buff-Frames (VCB) #

### What is VCB? ###

Vanilla Consolidate Buff-Frames (VCB) is a smart system to manage your auras. The AddOn provides a lot functions to customize it to your tastes and adds a lot of helpful functions for a better overview, which is its purpose in the first place anyway.

### What are the advantages with VCB? ###

* A better overview for your auras due to consolidation
* Never reach the aura cap because of useless auras that you don't need anyway with the Banning-System
* Each frame is movable, independently from each other
* Display even potential buffs, either grayed out or/and as number on the icon
* Display more than 16 buffs
* Customize the frames to your personal tastes
* Nearly everything is customizable 

### Installing Instructions ###

* Download the AddOn [here](https://bitbucket.org/Albea/vcb/downloads)
* Rename the unziped folder to "VCB"
* Place the folder into your AddOn directory in your World of Warcraft folder
* (If you had a previous version (<v2.5))
* Go into your WTF/Account/ACCNAME/SavedVariables/
* Delete VCB.lua and VCB.lua.bak
* Go into your WTF/Account/ACCNAME/SERVER/CHARNAME/
* Delete VCB.lua and VCB.lua.bak
* Delete VCB_AutoUnbuffer.lua and VCB_AutoUnbuffer.lua.bak
* Delete VCB_Buffframe.lua and VCB_Buffframe.lua.bak
* Enjoy

### Changelog ###

**v2.4:**  
-Aura applications added  

**v2.3:**  
-GameTooltips are now shown properly  
-Auras arent funky anymore in the way of being displayed  

**v2.2:**  
-Timer finally fixed  
-Performance updated  

**v2.1:**  
-Timer fixed  

**v2.0:**  
-Buffs are now displayed correctly after adding them to the list  
-Debuffs can now be displayed twice  
-Timer should be fixed now  
-The consolidated frame is now shown and hidden correctly  
-Recolored the buffs border's  
-The module is now scalable  
-The autounbuffer sends out a message if a buff is cancelled  

**v1.9:**  
-Hotfix for a function name error  

**v1.8:**  
-Clean up  
-Solved some bugs  

**v1.7:**  
-A colored border depending on the debuff type was added at the debuffs  
-Timer fixed  
-Tooltips are now displayed properly  

**v1.6:**  
-Fully implemented Buff and Debuff Frames  
-The Frame is now dragable  
-Added the command "lock"  
-Added the command "ra" to clear the cons. buff list  
-Fixed some bugs  
-Did some visual stuff  

**v1.5:**  
-Some major bugs were fixed with the AutoUnbuffer  
-Some visual bugs were fixed  
-Buff Frames were implemented but not finished yet.  
-The Addons were split from another so they work independently.  
-The Command "Unbuff" was added for macro uses.  

### Known Bugs ###

**v2.4:**  
- NONE  
  
**v2.3:**  
- No aura applications  
  
**v2.2:**  
- Aura frames sometimes dont vanish if they run out  
- GameTooltip not shown in the consolidated frame  
  
**v2.1:**  
- NONE  
  
**v2.0:**  
- Timer still a bit funky -- FIXED  
  
**v1.9:**  
- Buffs are not displayed correctly after adding them to the list (relogg fixes this problem) -- FIXED  
- Debuffs who are applied twice are not displayed correctly -- FIXED  
- Timer are not working correctly sometimes -- FIXED  
- All aura frames pop up the consolidated buff frame -- FIXED 


### Ideas ###

**Fender:**  
- Mirror consolidated buff frame -- DONE  
- Change order off buffs in the consolidated buff frame -- DONE  
- Change order in general -- DONE  
- Create an system to order buffs -- DONE  
  
**Moosic:**  
- Scale the whole module -- DONE   
- Change the buff border's color (red to gold/black(?)) -- DONE  
  
**Ayz:**  
- Let buffs and debuffs be movable independently of each other -- DONE  
- let the timers scale together with the icon-size, currently the timers are same size regardless of icon size -- DONE  
- option to show timers as example 0:24 instead of 24s -- DONE  
  
**Hallonkaka:**  
- Option to have buffs/debuffs flashing then they just have a couple of seconds left, like the normal buffbar -- DONE  
- Make the frames less mushed when there's no buffs ([image](http://i.imgur.com/SRFLNH3.png)) -- DONE  
- Had some issues with trying to move the frame, but realized later that i need to click to the left of the icon to move it. so make the icon the thing to click -- DONE   
- One major improvement could be to make it really like retail and have a counter that shows how many buffs out of how many possible buffs you have. -- DONE  
- Example: you add the buff "Power Word: Fortitude" along with the class "Priest", so whenever a priest is in your group, it will show 0/1 if the priest hasn't buffed stamina. -- DONE  
- the visual part with grayed out icons for missing buffs when you hover over the icon is probably a bit harder (or just annoying to code) so a simple list with "Missing Buffs" would work just as fine. -- DONE  


### Common Issues ###

### Supporting ###