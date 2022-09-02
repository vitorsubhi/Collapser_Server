function onDeath(cid, corpse, deathList)
	function HaveBless(cid)
		for i = 1,5 do
			if getPlayerBlessing(cid, i) then
				return true
			end
		end
	end
	if isPlayer(cid) and HaveBless(cid) and getPlayerSkullType(cid) < SKULL_RED then
		doCreatureSetDropLoot(cid, false)
	end
	if getPlayerStamina(cid) >= 840 then
		setPlayerStamina(cid, getPlayerStamina(cid) - 840)
	end
	return true
end