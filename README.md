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


### Supporting ###

This is AddOn has become very huge and for one person a gigantic task.  
To keep this AddOn **Up-To-Date, performant, clean and bugfree**, I need your help!   
You can help in many ways:

* [Report Bugs](https://bitbucket.org/Albea/vcb/issues?status=new&status=open), tell me how to reproduce them and improve everyones experience
* Give **your opinion** about the AddOn and point out ideas in the forum threads ([Nostalrius](http://forum.nostalrius.org/viewtopic.php?f=63&t=18189) / [Kronos](http://forum.twinstar.cz/showthread.php/98688-RELEASE-VCB-Vanilla-Consolidated-Buff-Frames))
* Some localizations are still missing, and since some functions require this, it is an important task and deserves a lot of thanks. If you are a native speaker of following languages and willing to contribute to this project then copy [this form](https://bitbucket.org/Albea/vcb/src/b7d4cb17cf96468fd1b482b9f3d7f6efa7d857d6/localization/enUS.lua?at=master) and post it in one of those threads. ([Nostalrius](http://forum.nostalrius.org/viewtopic.php?f=63&t=18189) / [Kronos](http://forum.twinstar.cz/showthread.php/98688-RELEASE-VCB-Vanilla-Consolidated-Buff-Frames))  
Following languages are still missing: Spanish(esEs), Spanish(Mexican)(esMX), French(frFR), Italian(itIT), Korean(koKR), Portuguese(ptBR), Russian(ruRU), Chinese(zhCN), Chinese(Taiwan)(zhTW)
* If you play on [Kronos](http://www.kronos-wow.com/) you can donate Gold to **Shino (on Alliance)**. By that I can invest more time in programming instead farming consumables.

Everyone who contributes to this will be mentioned **in the About Tab** of the AddOn for an **permanent time**!

![vUqDGgY.png](https://bitbucket.org/repo/54Xrdo/images/3261093832-vUqDGgY.png)


### How does it look like? ###

**The Default Frame Configuration:**  
![2Jpf1ZS.png](https://bitbucket.org/repo/54Xrdo/images/2166706774-2Jpf1ZS.png)  

**The Unlocked Frame:**  
![uJHSNVy.png](https://bitbucket.org/repo/54Xrdo/images/3876903280-uJHSNVy.png)  
  
**The Dummy Mode for configuration:**  
![JsW2ZU4.png](https://bitbucket.org/repo/54Xrdo/images/2701062446-JsW2ZU4.png)

**The Consolidated Frame options:**  
![TpR5eQf.png](https://bitbucket.org/repo/54Xrdo/images/267774962-TpR5eQf.png)  


### Changelog ###


```

**v2.5:**
-Fixed Disappearing Issue
-Fixed Buff Applications
-Reworked consolidation
-Implemented XML for Buff-Frame
-Increased the performance overall
-Added a Dummy Mode
-Added a MiniMap Button
-Added localization deDE
-Added localization enUS
-Added localization enGB
-Reworked banning mechanic
-Reworked loading mechainc
-Reworked remove buff mechanic
-Implemented custom flashing mechanic because the default one causes huge problems with sorting
-Implemented Interface
-Implemented Interface Menu
-Implemented Interface quick Buttons (Close, Lock, MiniMap, Dummy Mode)
-Added functions to the MiniMap Button (Drag, Leftclick -> open menu, Rightclick -> lock VCB)
-Reworked compatibillity with other addons
-Updated textures
-Added features to increase the using experience overall
-Added Consolidated Buffs Frame with an overview for all buffs, adding and removing system
-Added default consolidated buffs
-Removed the all slash commands, which are replaced with the interface (/vcb)
-Implemented Interface for Banned-Buffs (similiar to consolidated buffs)
-Added banned buff list overview
-Added banned buff add and remove functions
-Implemented Timer interface
-Added font timer slider
-Added show hours checkbutton
-Added show minutes checkbutton
-Added show tenth checkbutton
-Added round down/up checkbutton
-Added show hours and minutes (h:m) checkbutton
-Added show minutes and seconds (m:s) checkbutton
-Added enable flash animation checkbutton
-Added function to all those features mentioned above
-Implemented Interface for Consolidated Frame
-Implemented Consolidated Icon interface
-For that:
-Added select font color option
-Added show amount out of possible buffs checkbutton (1/5 -> Depending on your group members)
-Added show missing buffs (grayed out) checkbutton
-Added enable font border checkbutton
-Added font size slider
-Added font slider
-Added icon opacity slider
-Added font opacity slider
-Added texture slider
-Added function for all those features added above (for the consolidated icon)
-Implemented interface for Buff Frame
-For that:
-Added select border color colorpicker
-Added select background color colorpicker
-Added invert order checkbutton
-Added use custom border checkbutton
-Added use custom background checkbutton
-Added invert aura orientation checkbutton 
-Added border opacity slider
-Added background opacity slider
-Added border slider
-Added custom border path editbox
-Added custom background path editbox
-Added anchor slider
-Added scale slider
-Added buffs per row slider
-Added background slider
-Added functions for all those features mentioned above
-Implemented pager for a lot of pages
-Implemented aura frame
-For that:
-Added enable border checkbutton
-Added enable background color checkbutton
-Added use custom border checkbutton
-Added select border color colorpicker
-Added select background color colorpicker
-Added select font color colorpicker
-Added enable font border checkbutton
-Added padding horizontal slider
-Added padding vertical slider
-Added font size slider
-Added font offset x slider
-Added font offset y slider
-Added border slider
-Added custom border path editbox
-Added font slider
-Added font opacity slider
-Added background opacity slider
-Added functions to all those features mentioned above
-Implemented aura timer interface
-For that:
-Added enable font border checkbutton
-Added select font color colorpicker
-Added font size slider
-Added font opacity slider
-Added functions to those features mentioned above
-Implemented interface for the Buff Frame
-Implemented interface for general options
-For that:
-Added vertical mode checkbutton
-Added enable background color checkbutton
-Added select background color colorpicker
-Added invert order checkbutton
-Added select font color colorpicker
-Added enable font border checkbutton
-Added invert aura orientation checkbutton
-Added buffs per row slider
-Added padding horizontal slider
-Added padding vertical slider
-Added font size slider
-Added font offset x slider
-Added background opacity slider
-Added scale slider
-Added font slider
-Added font opacity slider
-Added font offset y slider
-Added functions for all those features mentioned above
-Implemented border interface for the buff frame
-For that:
-Added enable border checkbutton
-Added use custom border checkbutton
-Added select border color color picker
-Added custom border path editbox
-Added background opacity slider
-Added border slider
-Added functions for all those features mentioned above
-Implemented aura timer interface for the buff frame
-Added enable font border checkbutton
-Added select font color colorpicker
-Added font size slider
-Added font opacity slider
-Added functions for all those features mentioned above
-Implemented debuff frame
-Implemented debuff general frame
-For that:
-Added vertical mode checkbutton
-Added enable background color checkbutton
-Added select background color colorpicker
-Added invert order checkbutton
-Added select font color colorpicker
-Added enable font border checkbutton
-Added invert aura orientation checkbutton
-Added buffs per row slider
-Added padding horizontal slider
-Added padding vertical slider
-Added font size slider
-Added font offset x slider
-Added background opacity slider
-Added scale slider
-Added font slider
-Added font opacity slider
-Added font offset y slider
-Added function for all those features mentioned above for the debuff frame
-Implemented debuff border interface
-For that:
-Added enable border checkbutton
-Added use custom border checkbutton
-Added custom border path editbox
-Added border checkbutton
-Added backgroundopacity checkbutton
-Added colorpicker for each debuff type (none, poison, magic, curse, disease)
-Added functions for all those features mentioned above
-Implemented debuff aura timer interface
-For that:
-Added enable font border checkbutton
-Added selct font color colorpicker
-Added font size slider
-Added font opacity slider
-Added functions for all those features mentioned above
-Implemented interface for the weapon frame
-Implemented weapon general frame
-For that:
-Added vertical mode checkbutton
-Added enable background color checkbutton
-Added select background color colorpicker
-Added attach to Buff-Frame checkbutton
-Added select font color colorpicker
-Added enable font border checkbutton
-Added padding horizontal slider
-Added padding vertical slider
-Added font size slider
-Added font offset x slider
-Added font offset y slider
-Added background opacity slider
-Added scale slider
-Added font slider
-Added font opacity slider
-Added functions for all those features mentioned above
-Implemented weapon border interface
-Added enable border checkbutton
-Added enable custom border checkbutton
-Added select border color colorpicker
-Added custom border path editbox
-Added border slider
-Added background opacity slider
-Added functions for all those features mentioned above
-Implemented weapon aura timer interface
-Added enable border checkbutton
-Added select font color colorpicker
-Added font size slider
-Added font opacity slider
-Added functions for all those features mentioned above
-Implemented profile manager frame
-For that:
-Made profiles global for the whole account
-Added a list for the profiles list
-Added editbox to save a profile
-Added editbox to delete and load a profile
-Added a current profile frame
-Added functions for all those features mentioned above
-Implemented miscellaneous interface
-Implemented miscellaneous general interface
-For That:
-Added disable consolidated mechanic (if you dont want (I mean who does not want it?!))
-Added disable banning mechanic (If you dont need it)
-Added Theme slider
-Added load button
-Added Default theme
-Added functions for all those features mentioned above
-Implemented about interface
-Implemented all sorts of information for vcb
-Implemented supporter tab
-Done some polishing
-Worked on the readme
-Solved an updating issue when adding/removing a buff from a list

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
```
 

### Known Bugs ###


```

**v2.5:**
- NONE

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
```



### Ideas ###


```

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
- Enable consolidated buffs for target debuffs - would be useful in raids for some classes if not all
  
**Hallonkaka:**  
- Option to have buffs/debuffs flashing then they just have a couple of seconds left, like the normal buffbar -- DONE  
- Make the frames less mushed when there's no buffs ([image](http://i.imgur.com/SRFLNH3.png)) -- DONE  
- Had some issues with trying to move the frame, but realized later that i need to click to the left of the icon to move it. so make the icon the thing to click -- DONE   
- One major improvement could be to make it really like retail and have a counter that shows how many buffs out of how many possible buffs you have. -- DONE  
- Example: you add the buff "Power Word: Fortitude" along with the class "Priest", so whenever a priest is in your group, it will show 0/1 if the priest hasn't buffed stamina. -- DONE  
- the visual part with grayed out icons for missing buffs when you hover over the icon is probably a bit harder (or just annoying to code) so a simple list with "Missing Buffs" would work just as fine. -- DONE  

```


### Common Issues ###


```
1. You have to bann/add buffs in the language of your client. If you ban an buff in english but you use an german client for example, it won't work.
2. I get an lua error after installing it, what should I do. You probably had an version before. I addded a lot of new variables that you need to reload therefore follow the instructions carefully!

```