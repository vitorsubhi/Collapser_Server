local firstItems = {}
firstItems[0] =	{2530, 2273, 2050, 2458, 2648, 2643}
firstItems[1] = {2173, 2525, 2190, 2124, 2457, 2647, 2643}
firstItems[2] = {2173, 2525, 2182, 2124, 2457, 2647, 2643}
firstItems[3] = {2173, 2525, 2399, 2124, 2457, 2647, 2643}
firstItems[4] = {2173 ,2525, 2428, 2124, 2457, 2647, 2643}

function onLogin(cid)
	if getPlayerStorageValue(cid, 30001) == -1 then
		for i = 1, table.maxn(firstItems[getPlayerVocation(cid)]) do
			doPlayerAddItem(cid, firstItems[getPlayerVocation(cid)][i], 1)
		end
		
		if getPlayerSex(cid) == 0 then
			doPlayerAddItem(cid, 2464, 1)
		else
			doPlayerAddItem(cid, 2464, 1)
		end
		
		local bag = doPlayerAddItem(cid, 1988, 1)
		doAddContainerItem(bag, 2120, 1)
		doAddContainerItem(bag, 2554, 1)
		doAddContainerItem(bag, 2152, 50)
		doAddContainerItem(bag, 7620, 1)
		setPlayerStorageValue(cid, 30001, 1)
	end
	return true
end
