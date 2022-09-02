function onPrepareDeath(cid, lastHitKiller, mostDamageKiller)
local level = 80
if isPlayer(cid) and getPlayerLevel(cid) < level then
doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
doCreatureAddHealth(cid, getCreatureMaxHealth(cid), 65535, 256, true)
doCreatureAddMana(cid, getCreatureMaxMana(cid))
doPlayerSendTextMessage(cid,22,"Blessing: Are you protected from experience loss, until reach level "..level..".")
doRemoveConditions(cid, false)
return false
end
return true
end