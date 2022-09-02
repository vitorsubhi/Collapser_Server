function OnUse(cid,item, frompos, item2,pos)
	doPlayerSendCancel(cid, "haha")
	return true
	if (item.uid == 31100) then
		player1 = getThingfromPos({x=92, y=219, z=8, stackpos=253})
		player2 = getThingfromPos({x=91, y=219, z=8, stackpos=253})
		player3 = getThingfromPos({x=90, y=219, z=8, stackpos=253})
		player4 = getThingfromPos({x=89, y=219, z=8, stackpos=253})
		if (player1.itemid > 0 and player2.itemid > 0 and player3.itemid > 0 and player4.itemid > 0) then
			doTeleportThing(player1.uid, {x=107, y=219, z=9})
			doTeleportThing(player2.uid, {x=106, y=219, z=9})
			doTeleportThing(player3.uid, {x=105, y=219, z=9})
			doTeleportThing(player4.uid, {x=104, y=219, z=9})
		else
			doPlayerSendCancel(cid, "You need four players to start Annihilator")
		end
		return true
	end
	return false
end
