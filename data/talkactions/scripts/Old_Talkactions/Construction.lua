function isWalkable(pos, creature, proj)-- by Nord
	if getTileThingByPos({x = pos.x, y = pos.y, z = pos.z, stackpos = 0}).itemid == 0 then return false end
		if getTopCreature(pos).uid > 0 and creature then 
			return false 
		end
		local n = not proj and 3 or 2
		for i = 0, 255 do
			pos.stackpos = i
			local tile = getTileThingByPos(pos)
			if tile.itemid ~= 0 and not isCreature(tile.uid) then
				if hasProperty(tile.uid, n) or hasProperty(tile.uid, 7) then
					return false
				end
			end
		end
	return true
end

function getCreaturesInPos(pos)
   local ret =  {}
   for a = 0, 255 do
      local pos_check = {x = pos.x, y = pos.y, z = pos.z, stackpos = a}
      local crea = getThingFromPos(pos_check).uid 
      if (isCreature(crea)) and not(isInArray(ret, crea)) then
         table.insert(ret, crea)
      end
   end
   return ret
end 

function doFindItemInPos(ids,pos) -- By Undead Slayer
   local results = {}
   for _ = 0, 255 do
       local findPos = {x = pos.x, y = pos.y, z = pos.z, stackpos = _}
       if isInArray(ids, getThingFromPos(findPos).itemid) then
          table.insert(results, getThingFromPos(findPos))
       end
   end
   
   return results
end

function doCreateTile(id,pos) --- By mock the bear
    doAreaCombatHealth(0,0,pos,0,0,0,255)
    doCreateItem(id,1,pos)
end
local function onMove(cid, fromPosition, toPosition, go)
   local fpTile = getTileThingByPos(fromPosition)

   local tpos_check = {x = toPosition.x, y = toPosition.y, z = toPosition.z, stackpos = 0}      
   
   local tpTile = getTileThingByPos(toPosition)
   if (go == "up") then
      if (tpTile.itemid ~= 0) then
         return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You can not climb!") 
      end

      if (fpTile.itemid == 460) and (#getCreaturesInPos(fromPosition) < 2) then            
         doRemoveItem(fpTile.uid, 1)
      end
           
      if (tpTile.itemid == 0) then
		 doCreateTile(460, toPosition)         
      end
      doTeleportThing(cid, toPosition)      
   elseif (go == "down") then
      local fpTile = doFindItemInPos({460}, getThingPos(cid))[1]
      if (tpTile.itemid ~= 0 and not isWalkable(toPosition,true,false) or fpTile.itemid ~= 460) then
         return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You can not go down!") 
	  end

      if (fpTile.itemid == 460) and (#getCreaturesInPos(fromPosition) < 2) then            
         doRemoveItem(fpTile.uid, 1)
      end
           
      if (tpTile.itemid == 0) then 
         doCreateTile(460, toPosition)         
      end
      doTeleportThing(cid, toPosition)    
   end
   
end

function onSay(cid, words, param)
  if (words:lower() == "!construction") then
		if (getPlayerStorageValue(cid, 73732) > 0) then
    		setPlayerStorageValue(cid, 73732, -1)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You have stop the construction mode!")
		else     
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You have start the construction mode!")
			setPlayerStorageValue(cid, 73732, 1)
		end
		
  elseif (words:lower() == "stair") then
     if (getPlayerStorageValue(cid, 73732) < 1) then
        return false
     end

     local cp = getThingPos(cid)
     local topos = {x = cp.x, y = cp.y, z = cp.z - 1}
     local topos2 = {x = cp.x, y = cp.y-1, z = cp.z - 1}
     doCreateTile(8281, topos)
     doCreateTile(407, topos2)
	 doCreateItem(5259, 1, cp)
  elseif (words:lower() == "h2") then
     if (getPlayerStorageValue(cid, 73732) < 1) then
        return false
     end

     local cp = getThingPos(cid)
     local topos = {x = cp.x, y = cp.y, z = cp.z + 1}
     onMove(cid, cp, topos, "down")               
  end
  
  return true
end