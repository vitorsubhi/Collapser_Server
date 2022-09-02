function onLogin(cid)
	local rate = 1.3 -- 30%
	local config = {
		vip = "Você tem "..((rate - 1)*100).."% de exp a mais agora!",
		notvip = "Tornesse vip e ganhe "..((rate - 1)*100).."% a mais de experiencia!",
	}
	if vip.hasVip(cid) == FALSE then
		doPlayerPopupFYI(cid, config.notvip)
	else
		doPlayerSetExperienceRate(cid, rate)
		doPlayerPopupFYI(cid, config.vip)
	end
	return TRUE
end