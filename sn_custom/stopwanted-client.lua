-- Switch Network FiveM Server Content (https://switchnetwork.co)
-- Disables police from responding to wanted levels.
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(3000)
       
        if GetPlayerWantedLevel(PlayerId()) ~= 0 then -- if wanted level is anything other than zero
            --SetPlayerWantedLevel(PlayerId(), 0, false) -- then set it to zero (disabled to allow vrp wanted)
            SetPlayerWantedLevelNow(PlayerId(), false) -- make player not wanted
			SetPoliceIgnorePlayer(PlayerId(), true) -- make police ignore player
			SetDispatchCopsForPlayer(PlayerId(), false) -- do not dispatch police
        end
    end
end)