function onSay(cid, words, param, channel)
	if(param == '') then
		return true
	end
	local level = tonumber(param)
	if level >= 250 and level < getPlayerLevel(cid) then
		doPlayerAddExp(cid, -getPlayerExperience(cid)+getExperienceForLevel(level))
		doCreatureAddHealth(cid, 1)
		doPlayerAddMana(cid, 1)
		doPlayerSetExperienceRate(cid, 0)
	else
		doPlayerBroadcastMessage(cid, "NOT ENOUGH LEVEL")
	end
	return true
end
