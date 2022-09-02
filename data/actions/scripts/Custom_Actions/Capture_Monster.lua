function onUse(cid, item, frompos, item2, topos)
local r = {
 [28] = 210,
 [29] = 180,
 [30] = 45}
local s = math.random(28,30) 
if item.itemid == 5928 then
   if getTilePzInfo(getThingPos(cid)) == FALSE then
      if isMonster(item2.uid) == TRUE then
		 doItemSetAttribute(item.uid, "article", getCreatureName(item2.uid))
         doRemoveCreature(item2.uid)
         doSendMagicEffect(topos, s)
         doSendAnimatedText(topos, 'Capitured!', r[s])  
         doTransformItem(item.uid, 5929)
         return TRUE
      else
         doSendMagicEffect(frompos, 2)
         doPlayerSendCancel(cid, 'You cannot catch it.')
         return TRUE
      end
      return TRUE
   else
      doPlayerSendCancel(cid, 'You cannot use in protection zone.')
      doSendMagicEffect(frompos, 2)
      return TRUE
   end
elseif item.itemid == 5929 then
     if getTilePzInfo(getThingPos(cid)) == FALSE then
          doCreateMonster(getItemDescriptions(item.uid).article, getThingPos(cid))
          return doRemoveItem(item.uid, 1)
     else
          return doPlayerSendCancel(cid, 'You cannot use in protection zone.')
     end         
end
return TRUE                                                          
end