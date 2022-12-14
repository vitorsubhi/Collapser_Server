function getGuildMembersOnline(GuildId)
local players,query = {},db.getResult("SELECT `name` FROM `players` WHERE `rank_id` IN (SELECT `id` FROM `guild_ranks` WHERE `guild_id` = " .. GuildId .. ");")
if (query:getID() ~= -1) then
repeat
table.insert(players,query:getDataString("name"))
until not query:next()
query:free()
end
return #players > 0 and players or false
end

function onLogin(cid)

	local guild_id = getPlayerGuildId(cid)
	local minimo = 2
	local max = 2
	local porcentagem = 1
	-----------------------------------------
	doPlayerSetExperienceRate(cid, 1)
	if guild_id == 0 then
		addEvent(doPlayerSendTextMessage, 200,cid, MESSAGE_STATUS_CONSOLE_RED,"[GUILD] Join a Guild, to receive more experience.")
		return true
	end
	
	if guild_id > 0 then
		local membros_online = table.maxn(getGuildMembersOnline(guild_id))
		local tabela_membros = getGuildMembersOnline(guild_id)
		
		--if #getPlayersByIp(getPlayerIp(cid)) >= max then
			--doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED,"[GUILD] Players com Multi-Cliente nao contam para ganhar o bonus de experiencia.")
		--return true
		--end
		
		if membros_online <= minimo then
			addEvent(doPlayerSendTextMessage, 2000, cid, MESSAGE_STATUS_CONSOLE_RED,"[GUILD] It's required "..minimo.." Guild members online for bonus experience. Guild members online: ["..membros_online.."]")
			return true
		end
	
		if membros_online > minimo then
			for var = 1, #tabela_membros do
				local nomes = getCreatureByName(tabela_membros[var])
				local XP = ((membros_online*porcentagem) / 100) + 1.00		
				doPlayerSetExperienceRate(nomes, XP)	
				addEvent(doPlayerSendTextMessage,1000,nomes, MESSAGE_STATUS_CONSOLE_RED, "[GUILD] Experience from guild members has been increased +"..membros_online*porcentagem.."% - Member: "..getCreatureName(cid).." has logged in.")		
			end
			return true
		end
	end
end