local monsters = {
	{"Rat", id='3'}
}

function onSay(cid, words, param, channel)
	if(param == '') then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Command requires param.")
		return true
	end

	local tmp = getCreatureOutfit(pid)
	tmp.lookType = monsters[param]

	doCreatureChangeOutfit(pid, tmp)
	return true
end
