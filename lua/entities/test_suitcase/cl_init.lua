-------------------------------------------------------------------------------------------------------------|
-- Do Not edit the files below!  I warned  you!!!!                                                           |
-------------------------------------------------------------------------------------------------------------|

include('shared.lua')

surface.CreateFont( "shit", {
	font = "Arial",
	size = 30,
	weight = 1000,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = true,
	additive = false,
	outline = false,
})

function suitcase_menu()
    	

local frame = vgui.Create("DFrame")
   frame:SetPos( ScrW() / 2 - 345, ScrH() / 2 - 150 )
   frame:SetSize(510, 300)
   frame:SetTitle(" ")
   frame:SetVisible(true)
   frame:ShowCloseButton(true)
   frame:SetDraggable(true)
   frame:MakePopup()
   frame.Paint = function()
      draw.RoundedBox(0, 0, 0, frame:GetWide(), frame:GetTall(), Color(70, 120, 70))
      draw.RoundedBox(0, 0, 0, frame:GetWide(), 24, Color(80, 130, 80))
      draw.SimpleText("Disguise Menu", "shit", frame:GetWide() / 2 - 10, 0, color_white, TEXT_ALIGN_CENTER)
  end
   
   local scrolldbar = vgui.Create("DScrollPanel", frame)
    scrolldbar:SetSize(500, frame:GetTall() - 27)
	scrolldbar:SetPos(10, 27)
	 
	
	local modellist = vgui.Create("DIconLayout", scrolldbar)
	modellist:SetSize(500, 205)
	modellist:SetPos(5, 10)
	modellist:SetSpaceY(5)
	modellist:SetSpaceX(5)
	
	     for k, v in pairs(suitcase_models) do			
	        
		
		local test = modellist:Add("DModelPanel", fail)			    			
			test:SetModel(v)
			test:SetSize(200, 155)			
			 
			
		test.DoClick = function()
			    net.Start("IdidIt")
			        net.WriteString( v )
			   net.SendToServer()
			frame:Close()
		end
	end			   	
end
usermessage.Hook("test_suitcase_clientsidemenu", suitcase_menu)


function ENT:Draw()
    self:DrawModel()

		local Pos = self:GetPos()
	    local Ang = self:GetAngles()
		
		Ang:RotateAroundAxis(Ang:Forward(), 90)
	    local TextAng = Ang

	    TextAng:RotateAroundAxis(TextAng:Right(), CurTime() * -180)
		
		cam.Start3D2D(Pos + Ang:Right() * -30, TextAng, 0.35)
			draw.SimpleTextOutlined( 'Disguise Suitcase', "HUDNumber5", 0, 0, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, 1, Color(0, 0, 0, 255))
		cam.End3D2D()	
end
