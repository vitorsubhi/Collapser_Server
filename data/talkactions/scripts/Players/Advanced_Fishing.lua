function onSay(cid, words, param, channel)
	local t = string.explode(param, ",")
	if t[1] == "water" then
		str = "Water Monsters\n---------------------------\n"
		for anmonster in ipairs(_Lib_Monsters_Info.water) do
			str = str .. "Name: " .._Lib_Monsters_Info.water[anmonster][1] .. "\nLevel: " .. _Lib_Monsters_Info.water[anmonster].mlevel .. "\nFishing: " .. _Lib_Monsters_Info.water[anmonster].fishing .. "\n---------------------------\n"
		end
		doShowTextDialog(cid, 2580, str)
		return true
	elseif t[1] == "lava" then
		str = "Lava Monsters\n---------------------------\n"
		for anmonster in ipairs(_Lib_Monsters_Info.lava) do
			str = str .. "Name: " .._Lib_Monsters_Info.lava[anmonster][1] .. "\nLevel: " .. _Lib_Monsters_Info.lava[anmonster].mlevel .. "\nFishing: " .. _Lib_Monsters_Info.lava[anmonster].fishing .. "\n---------------------------\n"
		end
		doShowTextDialog(cid, 2580, str)
		return true
	elseif param:lower():find('show') == 1 and 3 then
		local _,_,name = param:lower():find('show (.+)')
		name = name or getPlayerName(cid)
		local player = getPlayerByName(name)
		if isPlayer(player) == TRUE then
			str = "Player: " .. getPlayerName(player) .."\n"
			str = str .."Fishing Level: " .. getPlayerSkillLevel(player, SKILL_FISHING) .."\n"
			str = str .."-----------------------------\n"
			str = str .. "                  Fished Water Monsters\n\n"
			for anmonster in ipairs(_Lib_Monsters_Info.water) do
				str = str .. _Lib_Monsters_Info.water[anmonster][1] .. ": " .. getPlayerStorageValue(player, _Lib_Monsters_Info.water[anmonster].storage)+1 .. "\n"
			end
			str = str .. "-----------------------------\n"
			str = str .. "                  Fished Lava Monsters\n\n"
			for anmonster in ipairs(_Lib_Monsters_Info.lava) do
				str = str .. _Lib_Monsters_Info.lava[anmonster][1] .. ": " .. getPlayerStorageValue(player, _Lib_Monsters_Info.lava[anmonster].storage)+1 .. "\n"
			end
			doShowTextDialog(cid, 2580, str)
			return true
		else
			return doPlayerSendTextMessage(cid,25, "A player with this name is not online, or not exists.")
        end
	elseif param:lower():find('enable') == 1 and 3 then
		local _,_,funct = param:lower():find('enable (.+)')
		funct = funct or ""
		if (funct == "monsters") then
			return doPlayerSendTextMessage(cid, 25, "You had enabled fishing monsters")
		elseif (funct == "fish") then
			return doPlayerSendTextMessage(cid, 25, "You had enabled fishing fishes")
		else
			str = "How to enable something:\n!fish enable (OBJECT)\n\n\n"
			str = str .. "Things that you can enable:\n\n"
			str = str .. "!fish enable monsters\n(Enable to fish monsters)\n\n"
			str = str .. "!fish enable fish\n(Enable to capture fishes - For Food)\n\n"
			doShowTextDialog(cid, 2580, str)
			return true
		
		end
	elseif param:lower():find('upgrade') == 1 and 3 then
		return doPlayerSendTextMessage(cid,25, "You need ".. math.floor((getPlayerRequiredSkillTries(cid, SKILL_FISHING, getPlayerSkillLevel(cid, SKILL_FISHING))-getPlayerSkillTries(cid, SKILL_FISHING))/35+1).." tries to advance fishing.")
	else
		str = "Fishing System\n\n"
		str = str .. "Commands:\n"
		str = str .. "!fish info\n(Shows informations about fishing, like required level)\n\n"
		str = str .. "!fish upgrade\n(Shows how many tries to upgrade fishing)\n\n"
		str = str .. "!fish show\n(Shows the monsters that you had fished)\n\n"
		str = str .. "!fish show name\n(Shows the monsters that other player had fished)\n\n"
		str = str .. "!fish enable\n(Shows the informations about how to enable something)\n\n"
		str = str .. "!fish disable\n(Shows the informations about how to disable something)\n\n"
		doShowTextDialog(cid, 2580, str)
		return true
	end
end
