local configg = {
		waterIds = {493, 4608, 4609, 4610, 4611, 4612, 4613, 4614, 4615, 4616, 4617, 4618, 4619, 4620, 4621, 4622, 4623, 4624, 4625, 4820, 4821, 4822, 4823, 4824, 4825},
		lavaIds = {598, 599, 600, 601}
    }
local monsterswater = {
    {'Water Elemental'},
    {'tyria'},
    {'hydros'},
    {'Doctor Octagonapus'},
    {'Kingler'},
    {'Triton'},
    {'Jaws'},
    {'Kratos'},
    {'Aegaeus'},
    {'Aekre'},
    {'Sobek'},
    {'Blastoise'}
}
local monsterslava = {
    {'Fire Elemental'},
    {'Fire Devil'},
    {'Krakatoa'},
    {'Fyria'},
    {'Priton'},
    {'Pyria'},
    {'Montoise'}
}
local number = 3500 -- < quanto maior, mais dificil de pescar um monstro 3500
local config = {
    rateSkill = getConfigValue("rateSkill"),
    allowFromPz = false,
    useWorms = false
}
function onUse(cid, item, frompos, item2, topos)
	local chance = math.random(1, number)
    if isInArray(configg.waterIds, item2.itemid) == true then
        -- Fish Water
		if chance == 1 then
			if ((getPlayerSkill(cid, SKILL_FISHING) >=160) and (getPlayerLevel(cid) >= 6000)) then
				chance = math.random(1, 12)
				create = monsterswater[chance][1]
			elseif ((getPlayerSkill(cid, SKILL_FISHING) >=158) and (getPlayerLevel(cid) >= 5500)) then
				chance = math.random(1, 11)
				create = monsterswater[chance][1]
			elseif ((getPlayerSkill(cid, SKILL_FISHING) >=155) and (getPlayerLevel(cid) >= 5000)) then
				chance = math.random(1, 10)
				create = monsterswater[chance][1]
			elseif ((getPlayerSkill(cid, SKILL_FISHING) >=150) and (getPlayerLevel(cid) >= 4500)) then
				chance = math.random(1, 9)
				create = monsterswater[chance][1]
			elseif ((getPlayerSkill(cid, SKILL_FISHING) >=140) and (getPlayerLevel(cid) >= 4000)) then
				chance = math.random(1, 8)
				create = monsterswater[chance][1]
			elseif ((getPlayerSkill(cid, SKILL_FISHING) >=130) and (getPlayerLevel(cid) >= 3000)) then
				chance = math.random(1, 7)
				create = monsterswater[chance][1]
			elseif ((getPlayerSkill(cid, SKILL_FISHING) >=120) and (getPlayerLevel(cid) >= 2000)) then
				chance = math.random(1, 6)
				create = monsterswater[chance][1]
			elseif ((getPlayerSkill(cid, SKILL_FISHING) >=100) and (getPlayerLevel(cid) >= 1000)) then
				chance = math.random(1, 4)
				create = monsterswater[chance][1]
			end
			doSendMagicEffect(topos, 53) -- fish waterIds
			for _, pid in ipairs(getPlayersOnline()) do
				doPlayerSendChannelMessage(pid, getCreatureName(cid), "Blood on Hook ".. getCreatureName(cid) .." surfed in a ".. create ..".", TALKTYPE_CHANNEL_W, 11)
			end   
			doBroadcastMessage("Blood on Hook ".. getCreatureName(cid) .." surfed in a ".. create ..".", MESSAGE_EVENT_ADVANCE)
			local Teste = doCreateMonster(create, getCreaturePosition(cid))
		else
			doPlayerAddSkillTry(cid, SKILL_FISHING, config.rateSkill)
			doSendMagicEffect(topos, CONST_ME_WATERSPLASH)
		end
    elseif isInArray(configg.lavaIds, item2.itemid) == true then
		-- Fish Lava
		if chance == 1 then
			if ((getPlayerSkill(cid, SKILL_FISHING) >=160) and (getPlayerLevel(cid) >= 6000)) then
				chance = math.random(1, 7)
				create = monsterslava[chance][1]
			elseif ((getPlayerSkill(cid, SKILL_FISHING) >=150) and (getPlayerLevel(cid) >= 2000)) then
				chance = math.random(1, 6)
				create = monsterslava[chance][1]
			elseif ((getPlayerSkill(cid, SKILL_FISHING) >=145) and (getPlayerLevel(cid) >= 2000)) then
				chance = math.random(1, 5)
				create = monsterslava[chance][1]
			elseif ((getPlayerSkill(cid, SKILL_FISHING) >=120) and (getPlayerLevel(cid) >= 2000)) then
				chance = math.random(1, 4)
				create = monsterslava[chance][1]
			elseif ((getPlayerSkill(cid, SKILL_FISHING) >=100) and (getPlayerLevel(cid) >= 1000)) then
				chance = math.random(1, 3)
				create = monsterslava[chance][1]
			end
			doSendMagicEffect(topos, 6) -- fish waterIds
			for _, pid in ipairs(getPlayersOnline()) do
				doPlayerSendChannelMessage(pid, getCreatureName(cid), "Blood on Hook ".. getCreatureName(cid) .." surfed in a ".. create ..".", TALKTYPE_CHANNEL_W, 11)
			end   
			doBroadcastMessage("Blood on Hook ".. getCreatureName(cid) .." surfed in a ".. create ..".", MESSAGE_EVENT_ADVANCE)
			local Teste = doCreateMonster(create, getCreaturePosition(cid))
			doPlayerAddSkillTry(cid, SKILL_FISHING, config.rateSkill)
		else
			doPlayerAddSkillTry(cid, SKILL_FISHING, config.rateSkill)
			doSendMagicEffect(topos, 6)
		end
		return true
	else
		return false
	end
end
