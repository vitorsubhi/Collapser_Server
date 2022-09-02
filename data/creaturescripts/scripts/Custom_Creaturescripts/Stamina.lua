function onDeath(cid, corpse, deathList)
	if (getPlayerSkullType(cid) < SKULL_RED) then
		doCreatureSetDropLoot(cid, false)
	end
	local killer = deathList[1]
	if isPlayer(killer) == TRUE or isPlayer(getCreatureMaster(killer))then
		if getPlayerStamina(cid) >= 840 then
			setPlayerStamina(cid, getPlayerStamina(cid) - 840)
			doPlayerSetLossPercent(cid, PLAYERLOSS_EXPERIENCE, 0)
			return true
		end
		return false
	else
		-- Killed by Monster
		doPlayerSetLossPercent(cid, PLAYERLOSS_EXPERIENCE, 0)
		return true
	end
end
