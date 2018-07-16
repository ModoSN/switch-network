-- Switch Network FiveM Server Content (https://switchnetwork.co)
-- Handsup hotkey, heavily edited by Modo to allow walking and disable weapons.

function loadAnimDict( dict )
    while ( not HasAnimDictLoaded("random@arrests@busted") ) do
        RequestAnimDict("random@arrests@busted")
        Citizen.Wait( 0 )
    end
end

Citizen.CreateThread( function()
    while true do 
        Citizen.Wait( 0 )

        local ped = GetPlayerPed( -1 )

        if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
            DisableControlAction( 0, 323, true ) -- INPUT_CHARACTER_WHEEL (LEFTALT)  

            if ( not IsPauseMenuActive() ) then 
                    loadAnimDict( "random@arrests@busted" )

                    while ( not HasAnimDictLoaded( "random@arrests@busted" ) ) do 
                        Citizen.Wait( 100 )
                    end 
                        if ( IsDisabledControlJustReleased( 0, 323 ) ) then
						ClearPedSecondaryTask(ped)
                        SetEnableHandcuffs(ped, false)
                    else
                        if ( IsDisabledControlJustPressed( 0, 323 ) ) then
                        TaskPlayAnim(ped, "random@arrests@busted", "enter", 8.0, 2.0, -1, 50, 2.0, 0, 0, 0 )
						SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"), true)
						SetEnableHandcuffs(ped, true)
                    end 
					   if IsEntityPlayingAnim(GetPlayerPed(PlayerId()), "random@arrests@busted", "enter", 3) then
					   DisableControlAction(1, 21, true) -- disables sprint
					   DisableControlAction(1, 140, true)
					   DisableControlAction(1, 141, true)
					   DisableControlAction(1, 142, true)
					end
                end
            end 
        end 
    end
end )
