local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)    npcHandler:onCreatureAppear(cid)   end
function onCreatureDisappear(cid)   npcHandler:onCreatureDisappear(cid)   end
function onCreatureSay(cid, type, msg)   npcHandler:onCreatureSay(cid, type, msg)  end
function onThink()     npcHandler:onThink()     end

local items = {
          item1 = {2472, 8931}, -- item1 item que ser? pedido e que ser? dado na primeira troca
          item2 = {6500, 8925} -- item2 item que ser? pedido e que ser? dado na segunda troca
}
local counts = {
          count1 = {40, 1}, -- count1 quantidade que ser? pedido e que ser? dado na primeira troca
          count2 = {1000, 1} -- count2 quantidade que ser? pedido e que ser? dado na segunda troca
}

function creatureSayCallback(cid, type, msg)
          if(not npcHandler:isFocused(cid)) then
                    return false
          end
          local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

          if msgcontains(msg, 'flame blade') then
                    if getPlayerItemCount(cid, items.item1[1]) >= counts.count1[1] then
                              doPlayerRemoveItem(cid, items.item1[1], counts.count1[1])
                              doPlayerAddItem(cid, items.item1[2], counts.count1[2])
                              selfSay('You just swap '.. counts.count1[1] ..' '.. getItemNameById(items.item1[1]) ..' for '.. counts.count1[2] ..' '.. getItemNameById(items.item1[2]) ..'.', cid)
                    else
                              selfSay('You need '.. counts.count1[1] ..' '.. getItemNameById(items.item1[1]) ..'.', cid)
                    end

          elseif msgcontains(msg, 'solar axe') then
                    if getPlayerItemCount(cid, items.item2[1]) >= counts.count2[1] then
                              doPlayerRemoveItem(cid, items.item2[1], counts.count2[1])
                              doPlayerAddItem(cid, items.item2[2], counts.count2[2])
                              selfSay('You just swap '.. counts.count2[1] ..' '.. getItemNameById(items.item2[1]) ..' for '.. counts.count2[2] ..' '.. getItemNameById(items.item2[2]) ..'.', cid)
                    else
                              selfSay('You need '.. counts.count2[1] ..' '.. getItemNameById(items.item2[1]) ..'.', cid)
                    end
          end
          return TRUE
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())