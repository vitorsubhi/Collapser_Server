function onLogin(cid)
registerCreatureEvent(cid, "EffectOutLogin")
registerCreatureEvent(cid, "OutfitEffects")
return doCreatureChangeOutfit(cid,{lookType = getCreatureOutfit(cid).lookType, lookHead =  getCreatureOutfit(cid).lookHead, lookBody = getCreatureOutfit(cid).lookBody, lookLegs = getCreatureOutfit(cid).lookLegs, lookFeet = getCreatureOutfit(cid).lookFeet, lookAddons = getCreatureOutfit(cid).lookAddons})
end
local events = {}
function onOutfit(cid, old, current)
local effect = {
[136] = 19, [128] = 19, -- citizen
[270] = 19,[273] = 19, -- jester
[156] = 66,[152] = 66, -- assassin
[147] = 19,[143] = 19, -- barbarian
[148] = 19,[144] = 19, -- druid
[157] = 19,[153] = 19, -- beggar
[149] = 19,[145] = 19, -- wizard
[279] = 19,[278] = 19, -- brotherwood
[137] = 19,[129] = 19, -- hunter
[141] = 19,[133] = 19, -- summoner
[142] = 19,[134] = 19, -- warrior
[155] = 19,[151] = 19, -- pirate
[158] = 19,[154] = 19, -- shaman
[138] = 19,[130] = 19, -- mage
[146] = 19,[150] = 19, -- oriental
[252] = 19,[251] = 19, -- norseman
[288] = 19,[289] = 19 -- demonhunter
}
                local o,c= effect[old.lookType],effect[current.lookType]
                if getPlayerAccess(cid) > 2 then return true
                elseif (not o or not c or old.lookAddons == 3 and o) then stopEvent(events[getPlayerGUID(cid)]) end
           if current.lookAddons == 3 and c then
                                function WalkEffect(cid, c, pos)
                                if not isCreature(cid) then return LUA_ERROR end
                                if c then frompos = getThingPos(cid)
                                if frompos.x ~= pos.x or frompos.y ~= pos.y or frompos.z ~= pos.z then doSendMagicEffect(frompos, c) end
                                events[getPlayerGUID(cid)] = addEvent(WalkEffect, 100, cid, c, frompos)
                                end return true end
WalkEffect(cid, c, {x=0, y=0, z=0}) end
return true
end