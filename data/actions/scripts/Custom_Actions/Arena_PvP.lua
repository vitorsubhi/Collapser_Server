local config = {
	minlevel = 30,
	countdown = 3
}

function enterArena(cid, frompos, topos)
	addEvent(startCountdown, 500, cid, config.countdown)
	doSendMagicEffect(frompos, 10)
	doTeleportThing(cid, topos)
	doSendMagicEffect(topos, 10)
	doCreatureSetNoMove(cid, true)
end

function startCountdown(cid, number)
	doSendMagicEffect(getCreaturePosition(cid), 13)
	if number == 0 then
		doCreatureSetNoMove(cid, false)
		return doSendAnimatedText(getCreaturePosition(cid), "FIGHT!", 151)
	else
		doSendAnimatedText(getCreaturePosition(cid), number, 151)
		addEvent(startCountdown, 1000, cid, number-1)
	end
	return true
end

function onUse(cid, item, frompos, item2, topos)
	player1 = getThingfromPos({x=frompos.x-1, y=frompos.y, z=frompos.z, stackpos=253})
	player2 = getThingfromPos({x=frompos.x+1, y=frompos.y, z=frompos.z, stackpos=253})
	if player1.itemid > 0 and player2.itemid > 0 then
		if getPlayerLevel(player1.uid) >= config.minlevel and getPlayerLevel(player2.uid) >= config.minlevel then	
				enterArena(player1.uid, getCreaturePosition(player1.uid), {x=frompos.x-1, y=frompos.y+1, z=frompos.z})
				enterArena(player2.uid, getCreaturePosition(player2.uid), {x=frompos.x+1, y=frompos.y+1, z=frompos.z})
		else
			return doPlayerSendCancel(cid,"Both fighters must have level 30.")
		end
	else
		return doPlayerSendCancel(cid,"You need 2 players for a duel.")
	end

end
