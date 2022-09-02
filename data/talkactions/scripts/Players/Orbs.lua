function onSay(cid, words, param)
	local t = string.explode(param, ",")
	local target = getCreatureByName(t[1])
	local points = tonumber(t[2])
	
	if words == '!orbs' or words == '/orbs' then
		doPlayerPopupFYI(cid,"You have " ..getAccountPoints(cid).. " collapser orbs.")	
	elseif words == '!tradeorbs' or words == '/tradeorbs' then
		if(param == '') then
			return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Example: !tradeorbs Nick, Orbs.")
		elseif (target ~= nil) and isPlayer(target) and not isPlayerGhost(target) then
			if (points ~= nil) and (type(points) == 'number') and (points>0) then
				if (getAccountPoints(cid) >= points) then
					doTradeOrbs(cid, target, points)
				else
					doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "You do not have enough points.")
				end
			else
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Invalid param specified.")
			end
		else
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Invalid param specified.")
		end
	elseif words == '!transferorbs' or words == '/transferorbs' then
		if(param == '') then
			return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Example: !transferorbs Nick, Orbs.")
		elseif (target ~= nil) and isPlayer(target) and not isPlayerGhost(target) then
			if (points ~= nil) and (type(points) == 'number') and (points>0) then
				if (getAccountPoints(cid) >= points) then
					doAccountRemovePoints(cid, points)
					doPlayerAddPoints(target, points)
					doPlayerSendTextMessage(cid,25,"You had transfered " ..points.. " orbs to ".. getCreatureName(target) ..".")
					doPlayerSendTextMessage(target,25,"You had received " ..points.. " orbs from ".. getCreatureName(cid) ..".")	
				else
					doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "You do not have enough points to transfer.")
				end
			else
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Example: !transferorbs Nick, Orbs.")
			end
		else
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Example: !transferorbs Nick, Orbs.")
		end
	elseif ((words == '!addorbs' or words == '/addorbs') and getPlayerGroupId(cid) == 10) then
		if(param == '')then
			return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Example: !addorbs Nick, Orbs.")
		elseif (target ~= nil) and isPlayer(target) then
				doPlayerAddPoints(target, points)
				doPlayerSendTextMessage(cid, 25, "You had added " ..points.. " orbs to ".. getCreatureName(target) ..".")
				doPlayerSendTextMessage(target, 25, "You had received " ..points.. " orbs from ".. getCreatureName(cid) ..".")
		else
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Example: !addorbs Nick, Orbs.")		
		end
	elseif ((words == '!seeorbs' or words == '/seeorbs') and getPlayerGroupId(cid) == 10) then
		if(param == '')then
			return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Example: !seeorbs Nick.")
		elseif (target ~= nil) and isPlayer(target) then
			return doPlayerPopupFYI(cid, getCreatureName(target) .." have " .. getAccountPoints(target) .. " collapser orbs.")
		else
			return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Example: !seeorbs Nick.")
		end
	end
	return TRUE
end
