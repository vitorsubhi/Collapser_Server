function onSay(cid, words, param, channel)
	local t = string.explode(param, ",")
	if t[1] ~= nil and t[2] ~= nil then
		local list = {}
		for i, tid in ipairs(getPlayersOnline()) do
			doPlayerAddItem(tid,t[1],t[2])
		end
		doBroadcastMessage(getPlayerName(cid) .. " gave " .. t[2] .."x ".. getItemNameById(t[1]) .. " for all players online!")
	else
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Example: /itemforall item, amount")
	end
	return true
end