function onSay(cid, words, param, channel)
	if(param == '') then
		return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "É necessário um paramêtro."), TRUE
	end

	local prm = string.explode(param, ",")
	local pos = getCreaturePosition(cid)
	local plr = getPlayerByName(prm[1])

	if (plr == nil) then
		return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "O player está offline ou não existe.")
	elseif (prm[2] == nil) then
		return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "É necessário a mensagem após a vírgula.") 
	end

	setPlayerStamina(plr, prm[2])
	return true
end 