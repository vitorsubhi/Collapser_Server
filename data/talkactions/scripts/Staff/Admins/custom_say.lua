function onSay(cid, words, param)
	if getPlayerAccess(cid) >= 5 then
		doCreatureSay(cid, tostring(param), TALKTYPE_MONSTER)
		return true
	end
end