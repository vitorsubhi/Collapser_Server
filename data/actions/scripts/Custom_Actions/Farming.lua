local seeds = {
	{'Tomato'},
	{'Corn'}
}
local config = {
	tileId = 804,
	number = 1,
	exhausted = false,
	exStorage = 6666,
	exTime = 3
}

function onUse(cid, item, frompos, item2, topos)
    if (tileId == item2.itemid) then
		
		return true
	else
		doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
		return false
	end
end