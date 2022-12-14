function getGuildMembersOnline(GuildId)
local players = {}
for _, pid in pairs(getPlayersOnline()) do
if getPlayerGuildId(pid) == tonumber(GuildId) then
table.insert(players, getPlayerName(pid))
end
end
return #players > 0 and players or false
end

function onLogout(cid)

	if getPlayerGuildId(cid) == 0 then
		return true
	else
		local guild_id = getPlayerGuildId(cid)
		local membros_online = table.maxn(getGuildMembersOnline(guild_id))
		local tabela_membros = getGuildMembersOnline(guild_id)
		local porcentagem = 1
		local minimo = 2
		-----------------------------------------		
		for var = 1, #tabela_membros do
			local nomes = getCreatureByName(tabela_membros[var])
			local membros_online = membros_online - 1
			
			if membros_online <= minimo then
				doPlayerSetExperienceRate(nomes, 1.0)	
				doPlayerSendTextMessage(nomes, MESSAGE_STATUS_CONSOLE_RED,"[GUILD] There are no more players needed to win the experience bonus. Member: "..getCreatureName(cid).." has logged out.")
			end
			
			if membros_online > minimo then
				local XP = ((membros_online*porcentagem) / 100) + 1.00		
				doPlayerSetExperienceRate(nomes, XP)	
				doPlayerSendTextMessage(nomes, MESSAGE_STATUS_CONSOLE_RED, "[GUILD] Experience from guild members has been adjusted to "..membros_online*porcentagem.."% - Member: "..getCreatureName(cid).." has logged out.")
			end
		end
		return true
	end
end