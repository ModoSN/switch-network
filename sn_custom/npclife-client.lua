-- Switch Network FiveM Server Content (https://switchnetwork.co)
-- NPC Life Script: Add NPCs to set co-ordinates with many variables.

-------------------------------------------------------------------------------------------------
---------------------------------- DON'T EDIT THESES LINES --------------------------------------
-------------------------------------------------------------------------------------------------

local generalLoaded = false
local PlayingAnim = false

-------------------------------------------------------------------------------------------------
----------------------------------- YOU CAN EDIT THIS LINES -------------------------------------
-------------------------------------------------------------------------------------------------

local ShopClerk = {
  -- ID: id of NPC | name: Name of Blip | BlipID: Icone of Blip | VoiceName: NPC Talk When near it | Ambiance: Ambiance of Shop | Weapon: Hash of Weapon | modelHash: Model | X: Position x | Y: Position Y | Z: Position Z | heading: Where Npc look
	{id = 1, name = "Dealer", BlipID = 52, VoiceName = "SHOP_BANTER_FRANKLIN", Ambiance = "AMMUCITY", Weapon = 0x1D073A89, modelHash = "S_M_Y_Dealer_01", x = -1227.4739990234, y = -1234.9270019531, z = 7.0508131980896, heading = 31.0},
	{id = 2, name = "MissionRowPD", BlipID = 52, VoiceName = "GENERIC_HOWS_IT_GOING", Ambiance = "AMMUCITY", Weapon = 0x1D073A89, modelHash = "S_M_Y_Cop_01", x = 440.83297729492, y = -978.85131835938, z = 30.689601898193, heading = 184.0},
	{id = 3, name = "PDArmory", BlipID = 52, VoiceName = "GENERIC_HOWS_IT_GOING", Ambiance = "AMMUCITY", Weapon = 0x1D073A89, modelHash = "S_M_Y_Cop_01", x = 454.09704589844, y = -980.02941894531, z = 30.689584732056, heading = 102.0},
	{id = 4, name = "Store", BlipID = 0, VoiceName = "SHOP_GREET", Ambiance = "AMMUCITY", Weapon = 0x1D073A89, modelHash = "mp_m_shopkeep_01", x = -46.689449310303, y = -1757.7998046875, z = 29.421012878418, heading = 53.0}, -- Grove Street Gas
	{id = 5, name = "Store", BlipID = 0, VoiceName = "SHOP_GREET", Ambiance = "AMMUCITY", Weapon = 0x1D073A89, modelHash = "mp_m_shopkeep_01", x = 24.487564086914, y = -1345.4069824219, z = 29.497024536133, heading = 276.0}, -- Innocent Blvd
	{id = 6, name = "Store", BlipID = 0, VoiceName = "SHOP_GREET", Ambiance = "STRIPCLUB", Weapon = 0x1D073A89, modelHash = "s_f_y_bartender_01", x = 128.82157897949, y = -1282.9176025391, z = 29.272556304932, heading = 126.0}, -- Strip Club
	{id = 7, name = "Store", BlipID = 0, VoiceName = "SHOP_GREET", Ambiance = "STRIPCLUB", Weapon = 0x1D073A89, modelHash = "s_f_y_bartender_01", x = -561.63366699219, y = 288.56805419922, z = 82.176483154297, heading = 254.0}, -- Eclipse Bar,
	{id = 8, name = "Store", BlipID = 0, VoiceName = "SHOP_GREET", Ambiance = "AMMUCITY", Weapon = 0x1D073A89, modelHash = "mp_m_shopkeep_01", x = 1134.1538085938, y = -982.04058837891, z = 46.41580581665, heading = 276.0}, -- El Ranch Blvd
	{id = 9, name = "Store", BlipID = 0, VoiceName = "SHOP_GREET", Ambiance = "AMMUCITY", Weapon = 0x1D073A89, modelHash = "mp_m_shopkeep_01", x = -706.14984130859, y = -913.67999267578, z = 19.215591430664, heading = 86.0}, -- Palominio Ave
	{id = 10, name = "Store", BlipID = 0, VoiceName = "SHOP_GREET", Ambiance = "AMMUCITY", Weapon = 0x1D073A89, modelHash = "mp_m_shopkeep_01", x = -1222.2388916016, y = -908.53991699219, z = 12.326354980469, heading = 30.0}, -- San Andreas Ave
	{id = 11, name = "Store", BlipID = 0, VoiceName = "SHOP_GREET", Ambiance = "AMMUCITY", Weapon = 0x1D073A89, modelHash = "mp_m_shopkeep_01", x = -1485.9737548828, y = -378.24731445313, z = 40.163387298584, heading = 137.0}, -- Prosperity Street
	{id = 12, name = "Store", BlipID = 0, VoiceName = "SHOP_GREET", Ambiance = "AMMUCITY", Weapon = 0x1D073A89, modelHash = "mp_m_shopkeep_01", x = 1164.7261962891, y = -322.54330444336, z = 69.205055236816, heading = 107.0}, -- West Mirror Drive
	{id = 13, name = "Store", BlipID = 0, VoiceName = "SHOP_GREET", Ambiance = "AMMUCITY", Weapon = 0x1D073A89, modelHash = "mp_m_shopkeep_01", x = 373.02722167969, y = 328.1455078125, z = 103.56636810303, heading = 256.0}, -- clinton Ave
	{id = 14, name = "Ammunation", BlipID = 110, VoiceName = "GENERIC_HI", Ambiance = "AMMUCITY", Weapon = 0x1D073A89, modelHash = "s_m_y_ammucity_01", x = 841.843566894531, y = -1035.70556640625, z = 28.1948642730713, heading = 3.31448912620544},
}


-------------------------------------------------------------------------------------------------
---------------------------------- DON'T EDIT THESES LINES --------------------------------------
-------------------------------------------------------------------------------------------------

--[[ Blip For NPC
Citizen.CreateThread(function()
	for k,v in pairs(ShopClerk)do
		local blip = AddBlipForCoord(v.x, v.y, v.z)
		SetBlipSprite(blip, v.BlipID)
		SetBlipScale(blip, 0.8)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(v.name)
		EndTextCommandSetBlipName(blip)
	end
end)

-----------------------------------------------------------------------------------------------]]
---------------------------------- DON'T EDIT THESES LINES --------------------------------------
-------------------------------------------------------------------------------------------------

-- Spawn NPC
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
	
	if (not generalLoaded) then
	  
	  for i=1, #ShopClerk do
        RequestModel(GetHashKey(ShopClerk[i].modelHash))
        while not HasModelLoaded(GetHashKey(ShopClerk[i].modelHash)) do
          Wait(1)
        end
		
        ShopClerk[i].id = CreatePed(2, ShopClerk[i].modelHash, ShopClerk[i].x, ShopClerk[i].y, ShopClerk[i].z, ShopClerk[i].heading, true, true)
        SetPedFleeAttributes(ShopClerk[i].id, 0, 0)
		SetAmbientVoiceName(ShopClerk[i].id, ShopClerk[i].Ambiance)
		SetPedDropsWeaponsWhenDead(ShopClerk[i].id, false)
		SetPedDiesWhenInjured(ShopClerk[i].id, false)
		GiveWeaponToPed(ShopClerk[i].id, ShopClerk[i].Weapon, 2800, false, true)
		
      end
      generalLoaded = true
		
    end
	
  end
end)

-------------------------------------------------------------------------------------------------
---------------------------------- DON'T EDIT THESES LINES --------------------------------------
-------------------------------------------------------------------------------------------------

-- Action when player Near NPC (or not)
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
		RequestAnimDict("random@shop_gunstore")
		while (not HasAnimDictLoaded("random@shop_gunstore")) do 
			Citizen.Wait(0) 
		end
		
		for i=1, #ShopClerk do
			distance = GetDistanceBetweenCoords(ShopClerk[i].x, ShopClerk[i].y, ShopClerk[i].z, GetEntityCoords(GetPlayerPed(-1)))
			if distance < 4 and PlayingAnim ~= true then
				TaskPlayAnim(ShopClerk[i].id,"random@shop_gunstore","_greeting", 1.0, -1.0, 4000, 0, 1, true, true, true)
				PlayAmbientSpeech1(ShopClerk[i].id, ShopClerk[i].VoiceName, "SPEECH_PARAMS_FORCE", 1)
				PlayingAnim = true
				Citizen.Wait(4000)
				if PlayingAnim == true then
					TaskPlayAnim(ShopClerk[i].id,"random@shop_gunstore","_idle_b", 1.0, -1.0, -1, 0, 1, true, true, true)
					Citizen.Wait(40000)
				end
			else
				--don't touch this
				--TaskPlayAnim(ShopClerk[i].id,"random@shop_gunstore","_idle", 1.0, -1.0, -1, 0, 1, true, true, true)
			end
			if distance > 5.5 and distance < 6 then
				PlayingAnim = false
			end


		end
  end
end)

