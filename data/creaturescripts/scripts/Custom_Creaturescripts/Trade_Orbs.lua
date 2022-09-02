function CompleteTrade(fromplayer, toplayer, points)
	if doPlayerRemoveItem(toplayer, 7722, 1) then
    		if doAccountRemovePoints(fromplayer, points) then
			doPlayerAddPoints(toplayer, points)
			doPlayerSendTextMessage(toplayer, MESSAGE_STATUS_WARNING, "You have received ".. points .." Collapser Orbs.")
			return true
		else
			return false
		end
	end
end


function CollapserOrbs(item)
	return tonumber(string.match(getItemDescriptions(item.uid).special, "You see (%w+) Collapser Orbs."))
end

function onTradeAccept(cid, target, item, targetItem)
	if isPlayer(cid) and isPlayer(target) then
		if item.itemid == 7722 then
			local points = CollapserOrbs(item)
			addEvent(CompleteTrade, 1, cid, target, points)
		end
		if targetItem.itemid == 7722 then
			local points = CollapserOrbs(targetItem)
			addEvent(CompleteTrade, 1, target, cid, points)
		end
	end
	return true
end 
