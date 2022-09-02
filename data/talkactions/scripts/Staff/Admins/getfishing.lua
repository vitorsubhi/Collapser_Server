monsters_list = {}

function onSay(cid, words, param)
	local qnt = 0
	if param == 'load' then
		local res = db.getResult("select * from `fishing_monsters`;")
		if res:getID() ~= -1 then
		repeat
			getpos = {x = res:getDataInt("pos_x"), y =  res:getDataInt("pos_y"), z = res:getDataInt("pos_z")}
			monsterx = doCreateMonster(res:getDataString("name"), getpos)
			setCreatureMaxHealth(monsterx, res:getDataInt("maxhealth"))
			doCreatureAddHealth(monsterx, -getCreatureMaxHealth(monsterx)+res:getDataInt("health"))
			doCreatureSetStorage(monsterx, 3301, 1)
		until not res:next()
		end
	elseif param == 'clean' then
		db.query("DELETE FROM `fishing_monsters` WHERE 1")
		return true
	else
		for i, tid in ipairs(getMonstersOnline()) do
			if (getCreatureStorage(tid, 3301) == 1) then
				getpos = getCreaturePosition(tid)
				db.query("DELETE FROM `fishing_monsters` WHERE 1")
				db.query("INSERT INTO `fishing_monsters` (`name`, `health`, `maxhealth`, `fished_by`, `pos_x`, `pos_y`, `pos_z`) VALUES ('".. getCreatureName(tid) .."', ".. getCreatureHealth(tid) ..", "..getCreatureMaxHealth(tid) ..", 1, "..getpos.x..", "..getpos.y..", "..getpos.z..")")
				doRemoveCreature(tid)
			end
			qnt = qnt + 1
		end
	end
	return true
end 
