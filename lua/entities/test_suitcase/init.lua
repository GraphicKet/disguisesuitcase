-------------------------------------------------------------------------------------------------------------|
-- Do Not edit the files below!  I warned  you!!!!                                                           |
-------------------------------------------------------------------------------------------------------------|

AddCSLuaFile('cl_init.lua')
AddCSLuaFile('shared.lua')
include('shared.lua')


util.AddNetworkString("IdidIt")


function ENT:Initialize()
	self:SetModel( "models/props_c17/SuitCase001a.mdl" )
	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetMoveType( MOVETYPE_VPHYSICS )
	self:SetSolid( SOLID_VPHYSICS )
	self:SetUseType( SIMPLE_USE )
	self:DropToFloor()   
     
	
	self.health = 250
	local phys = self:GetPhysicsObject()
	if phys:IsValid() then phys:Wake() end
	
	if not file.Exists("fuckingfilelibrary.txt", "DATA") then
              file.Write("fuckingfilelibrary.txt", util.TableToJSON(suitcase_models))
        end
	ServerLog("It works... I guess\n")

end



function ENT:AcceptInput(name, activator)
	if name == "Use" and IsValid(caller) and caller:IsPlayer() then
		net.Start("test_suitcase_clientsidemenu")
		net.Send(activator)
	end
end

function ENT:OnTakeDamage(damage)
	self.health = self.health - damage:GetDamage()
	if self.health <= 0 then
			self:Remove()
	end
end

function comeupwithabetterway(length, caller)	
	local vmodel = net.ReadString() -- You gotta love net message and shit like that. It's beautiful
	
	for k, v in pairs(shit_i_guess) do
		if vmodel == v then
	   caller.OldModel = caller:GetModel()
	   caller:SetModel(vmodel)
	   caller:PrintMessage(HUD_PRINTTALK, "Your playermodel have changed!" )
	   caller:PrintMessage(HUD_PRINTTALK, "You'll get your old model after" .. SUITCASE_changetime .. "seconds")
	   timer.Simple(SUITCASE_changetime, function() if (IsValid(caller) && caller.OldModel) then 
	       caller:SetModel(caller.OldModel) 
	        caller:PrintMessage(HUD_PRINTTALK, "You've now been changed back to your old model.") end 
	   end)
	end
   end
end
net.Receive("IdidIt", comeupwithabetterway)

