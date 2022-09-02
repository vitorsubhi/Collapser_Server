function onSay(cid, words, param, channel)
	local t = string.explode(param, ',')
	if (t[2] == "cid") then
		t[2] = cid
	else
		t[2] = getPlayerByNameWildcard(t[2])
	end
	_G[t[1]](t[2], t[3], t[4])
	--_G[t[1]](_G[t[2]],t[3],t[4])
	--loadstring(param)
	--addEvent(_G[t[1]], 1, cid, tonumber(t[2]), " "..t[3])
	return true
end
