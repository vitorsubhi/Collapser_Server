-- Credits to LeozeraRox
function onDeath(cid, corpse, deathList)
if isPlayer(cid) and isPlayer(deathList[1]) then
local v = { 
rewardid = 5943,
killer_name = getCreatureName(deathList[1]),
killer_level = getPlayerLevel(deathList[1]), 
target_name = getCreatureName(cid), 
target_level = getPlayerLevel(cid),
pos = getCreaturePosition(cid),
text = 'TO HELL!'
} 
local reward = doPlayerAddItem(deathList[1], v.rewardid, 1)
if getCreatureSkull(deathList[1]) > SKULL_WHITE then
	for _, pid in ipairs(getPlayersOnline()) do
		doPlayerSendChannelMessage(pid, getCreatureName(cid), " I was killed at level ".. v.target_level .." by ".. v.killer_name .. " level " ..v.killer_level .. ".", TALKTYPE_CHANNEL_RN, 10)
	end
elseif getCreatureSkull(deathList[1]) == SKULL_WHITE then
	for _, pid in ipairs(getPlayersOnline()) do
		doPlayerSendChannelMessage(pid, getCreatureName(cid), v.target_name ..": I was killed at level ".. v.target_level .." by ".. v.killer_name .." level " ..v.killer_level .. ".", TALKTYPE_CHANNEL_W, 10)
	end
else
	for _, pid in ipairs(getPlayersOnline()) do
		doPlayerSendChannelMessage(pid, getCreatureName(cid), "I was killed at level ".. v.target_level .." by ".. v.killer_name .. " level " ..v.killer_level .. ".", TALKTYPE_CHANNEL_O, 10)
	end
end
doItemSetAttribute(reward, "description", "Killed at level " .. v.target_level .. " by " .. v.killer_name .. " I was at level " .. v.killer_level .. " when. " .. (getCreatureSkullType(cid) <= SKULL_GREEN and "[Not-Justified]" or "[Justified]"))
doItemSetAttribute(reward, "name", v.target_name .."'s Heart")
doPlayerSendTextMessage(deathList[1], MESSAGE_STATUS_CONSOLE_ORANGE, "You killed ".. v.target_name .." " .. (getCreatureSkullType(cid) <= SKULL_GREEN and "wrong." or "just."))
doSendAnimatedText(v.pos, v.text, TEXTCOLOR_RED)
end
return true
end