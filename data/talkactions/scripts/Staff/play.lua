function onSay(cid, word)
	if(getPlayerGroupId(cid) < 7 and getPlayerGroupId(cid) > 2) then
		if(getTilePzInfo(getCreaturePosition(cid))) then
			setPlayerGroupId(cid, (getPlayerGroupId(cid)+4))
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Working.")
			setPlayerStorageValue(cid, 33033, getCreatureOutfit(cid).lookType)
			addEvent(doRemoveCreature, 100,cid)
			return true
		else
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Only available in Protection Zone.")
			return true
		end
	elseif(getPlayerGroupId(cid) > 6) then
		if(getTilePzInfo(getCreaturePosition(cid))) then
			setPlayerGroupId(cid, (getPlayerGroupId(cid)-4))
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Playing.")
			doRemoveCondition(cid, CONDITION_GAMEMASTER, GAMEMASTER_TELEPORT)
			local tmp = getCreatureOutfit(cid)
			if (getPlayerStorageValue(cid, 33033) < 1) then
				tmp.lookType = 128
			else
				tmp.lookType = getPlayerStorageValue(cid, 33033)
			end
			doCreatureChangeOutfit(cid, tmp)
			addEvent(doRemoveCreature,100,cid)
			return true
		else
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Only available in Protection Zone.")
			return true
		end
	end
	return false
end
