function onSay(cid, words, param, channel)
	local valor
	if(param == '') then
		valor = 1
	else
		valor = param
	end
	if (getPlayerStamina(cid)+(valor*840) <= 2521) then
		if (getPlayerMoney(cid) >= (valor*(getPlayerLevel(cid)*1000))) then
			doPlayerRemoveMoney(cid, valor*(getPlayerLevel(cid)*1000))
			setPlayerStamina(cid, getPlayerStamina(cid)+(valor*840))
			doCreatureAddHealth(cid, valor)
		else
			return doPlayerSendCancel(cid, "You don't have enough money. It's necessary ".. (valor*(getPlayerLevel(cid)*100)) .." gold coins, but you have only ".. getPlayerMoney(cid).." gold coins.")
		end
	else
		return doPlayerSendCancel(cid, "You can not buy ".. valor .." Stamina. Maximum: 3 Stamina")
	end
	return true
end 
