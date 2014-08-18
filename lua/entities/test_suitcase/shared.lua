-------------- Add Models here 

SUITCASE_changetime = 100

suitcase_models = {
    ------------------------------ Add models  below here-------------------------------------
	"models/player/alyx.mdl",
    "models/player/gman_high.mdl",
    "models/player/odessa.mdl",
    "models/player/mossman.mdl",                                
	"models/player/swat.mdl",
}


--------------------------------- Do NOT edit anything below here -----------------------------
ENT.Base = "base_gmodentity" 
ENT.Type = "anim" 

 
ENT.PrintName	= "Diguise Suitcase" 
ENT.Author		= "Icejjfish" 
ENT.Contact		= "why?" 
 
ENT.Category    = "Icejjfish shit" 
ENT.Spawnable		= true 
ENT.AdminSpawnable	= true 
 
shit_fucked_up = file.Read("fuckingfilelibrary.txt", "DATA")
shit_i_guess = util.JSONToTable(shit_fucked_up) -- thanks Crazyscouter for teaching my some of the file library and how to use json
 
