function onSay(cid, words, param)
	local param = param.explode(param, ',')
	if param then
		if isPlayer(getCreatureByName(param[1])) == TRUE then
			doPlayerSendTextMessage(getCreatureByName(param[1]), 22, getPlayerName(cid) .. " gave " .. param[3] .."x ".. getItemNameById(param[2]) .. " for you!")
			doPlayerAddItem(getCreatureByName(param[1]), param[2], param[3])
		end
	else
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Example: /itemfor nick, item, amount")
	end
	return TRUE
end