monsters_list = {}

function onSay(cid, words, param)
	local qnt = 1
	local str = "Stronger players online:\n"
	local res = db.getResult("SELECT `level`, `name` FROM `players` WHERE ONLINE = 1 ORDER BY `level` DESC, `experience` DESC LIMIT 5;")
	if res:getID() ~= -1 then
		repeat	
			str = str .. "\n".. qnt .." - " .. res:getDataString("name") .. " [Level: " .. res:getDataString("level") .."]"
			qnt = qnt+1
		until not res:next()
	end
	doBroadcastMessage(str)
	return true
end 
