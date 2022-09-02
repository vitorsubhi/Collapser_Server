local tiles = {
		waterIds = {493, 4608, 4609, 4610, 4611, 4612, 4613, 4614, 4615, 4616, 4617, 4618, 4619, 4620, 4621, 4622, 4623, 4624, 4625, 4664, 4665, 4666, 4820, 4821, 4822, 4823, 4824, 4825, 7236},
		lavaIds = {598, 599, 600, 601}
    }

function onUse(cid, item, frompos, item2, topos)
	if (item.itemid == _Lib_Fishing_Config.item.rod) then
		chance = math.random(1, _Lib_Fishing_Config.number)
		effect = 1;
	else
		chance = math.random(1, _Lib_Fishing_Config.number)
		effect = CONST_ME_WATERSPLASH;
	end
	if (_Lib_Fishing_Config.exhausted) then
		if exhaustion.check(cid, exStorage) then
			doPlayerSendDefaultCancel(cid, RETURNVALUE_YOUAREEXHAUSTED)
			return true
		end
		exhaustion.set(cid, exStorage, _Lib_Fishing_Config.exTime)
	end
	if (not (_Lib_Fishing_Config.allowFromPz or not getTileInfo(getThingPosition(cid)).protection)) then
		return doPlayerSendCancel(cid, "You cannot fish in a protection zone")
	end
    if isInArray(tiles.waterIds, item2.itemid) then
        -- Fish Water
		if chance == 1 then
			chance = getFishingWater(getMaxWater(cid, item.itemid))
			create = _Lib_Monsters_Info.water[chance][1]
			monster = doCreateMonster(create, getCreaturePosition(cid))
			if (monster ~= LUA_ERROR) then
				for _, pid in ipairs(getPlayersOnline()) do
					doPlayerSendChannelMessage(pid, getCreatureName(cid), "Blood on Hook ".. getCreatureName(cid) .." surfed in a ".. create ..".", TALKTYPE_CHANNEL_W, 11)
				end
				setPlayerStorageValue(cid, _Lib_Monsters_Info.water[chance].storage, getPlayerStorageValue(cid, _Lib_Monsters_Info.water[chance].storage)+1)
				if (_Lib_Fishing_Config.broadcastAll or (_Lib_Monsters_Info.water[chance].broadcast)) then
					doBroadcastMessage("Blood on Hook ".. getCreatureName(cid) .." surfed in a ".. create ..".", MESSAGE_EVENT_ADVANCE)
				end
			end
			doCreatureSetStorage(monster, 3301, 1)
		end
		doPlayerAddSkillTry(cid, SKILL_FISHING, 1)
		doSendMagicEffect(topos, effect)
		return true
    elseif isInArray(tiles.lavaIds, item2.itemid) then
		-- Fish Lava
		if (item.itemid == _Lib_Fishing_Config.item.rod) then
			chance = math.random(1, _Lib_Fishing_Config.number)
			effect = 36;
		else
			chance = math.random(1, _Lib_Fishing_Config.number)
			effect = 6;
		end
		if chance == 1 then
			chance = getFishingLava(getMaxLava(cid, item.itemid))
			create = _Lib_Monsters_Info.lava[chance][1]
			monster = doCreateMonster(create, getCreaturePosition(cid))
			if (monster ~= LUA_ERROR) then
				for _, pid in ipairs(getPlayersOnline()) do
					doPlayerSendChannelMessage(pid, getCreatureName(cid), "Blood on Hook ".. getCreatureName(cid) .." surfed in a ".. create ..".", TALKTYPE_CHANNEL_W, 11)
				end
				setPlayerStorageValue(cid, _Lib_Monsters_Info.lava[chance].storage, getPlayerStorageValue(cid, _Lib_Monsters_Info.lava[chance].storage)+1)
				if (_Lib_Fishing_Config.broadcastAll or (_Lib_Monsters_Info.lava[chance].broadcast)) then
					doBroadcastMessage("Blood on Hook ".. getCreatureName(cid) .." surfed in a ".. create ..".", MESSAGE_EVENT_ADVANCE)
				end
			end
			doCreatureSetStorage(monster, 3301, 1)
		end
		doPlayerAddSkillTry(cid, SKILL_FISHING, 1)
		doSendMagicEffect(topos, effect)
		return true
	else
		doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
		return false
	end
end