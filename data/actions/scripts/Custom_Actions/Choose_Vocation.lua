local config = {
	[29001] = {name = "Sorcerer", id = 1, item = 2190},
	[29002] = {name = "Druid", id = 2, item = 2182},
	[29003] = {name = "Paladin", id = 3, item = 2389},
	[29004] = {name = "Knight", id = 4, item = 2383}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local vocation = config[item.uid]
	if (getPlayerVocation(cid) == 0) then
		doPlayerSetVocation(cid, vocation.id)
		doPlayerSendTextMessage(cid, 22, "Congratulations, you made a good choice in becoming a ".. vocation.name .."!")
		doPlayerAddItem(cid, vocation.item, 1)
		doTeleportThing(cid, {x=1758, y=2258, z=7, stackpos=0})
		doSendMagicEffect(getPlayerPosition(cid), CONST_ME_MAGIC_BLUE)
	else
		doPlayerSendTextMessage(cid, 22, "You already have a vocation.")
		doTeleportThing(cid, {x=1758, y=2258, z=7, stackpos=0})
	end
	
	
end
