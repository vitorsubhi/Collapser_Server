local blessLevel = 30
function onLogin(cid)
	if getPlayerLevel(cid) <= blessLevel then
		for bless = 1, 5 do
			doPlayerAddBlessing(cid, bless)
		end
		doSendMagicEffect(getPlayerPosition(cid), CONST_ME_HOLYDAMAGE)
	end
	return true
end