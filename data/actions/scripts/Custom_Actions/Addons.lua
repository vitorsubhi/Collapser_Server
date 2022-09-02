local config = {
	[50001] = {name = "Citizen Addon", addon_type = 3, outfit = {136,128}, cost = 5000,	items = {{2798,1}}},
	[50002] = {name = "Hunter Addon", addon_type = 3, outfit = {137,129}, cost = 0, items = {{5947,1},{5876,100},{5948,100},{5889,1},{5887,1},{5888,1},{5891,5}}},
	[50003] = {name = "Mage Addon", addon_type = 3, outfit = {138,130}, cost = 0, items = {{7899,1}}},
	[50004] = {name = "Knight Addon", addon_type = 3, outfit = {139,131}, cost = {2396,5}, items = {{7763,1}}},
	[50005] = {name = "Nobleman Addon", addon_type = 3, outfit = {140,132}, cost = 1000000, items = {{}}},
	[50006] = {name = "Summoner Addon", addon_type = 3, outfit = {141,133}, cost = 0, items = {{5958,1}}},
	[50007] = {name = "Warrior Addon", addon_type = 3, outfit = {142,134}, cost = 0, items = {{5899,100},{5925,100},{5884,1},{5919,1}}},
	[50008] = {name = "Barbarian Addon", addon_type = 3, outfit = {147,143}, cost = 0, items = {{7771,1}}},
	[50009] = {name = "Druid Addon", addon_type = 3, outfit = {148,144}, cost = 0, items = {{5897,50},{5896,50}}},
	[50010] = {name = "Wizard Addon", addon_type = 3, outfit = {149,145}, cost = 500000, items = {{}}},
	[50011] = {name = "Oriental Addon", addon_type = 3, outfit = {150,146}, cost = 0, items = {{2472,1}}},
	[50012] = {name = "Pirate Addon", addon_type = 3, outfit = {155,151}, cost = 0, items = {{2146,10},{2147,10}}},
	[50013] = {name = "Assassin Addon", addon_type = 3, outfit = {156,152}, cost = 0, items = {{5898,30},{5882,10},{5881,30},{5895,20},{5905,20},{5906,10},{5885,1}}},
	[50014] = {name = "Beggar Addon", addon_type = 3, outfit = {157,153}, cost = 20000, items = {{5883,100}}},
	[50015] = {name = "Shaman Addon", addon_type = 3, outfit = {158,154}, cost = 0, items = {{7776,1}}},
	[50016] = {name = "Norseman Addon", addon_type = 3, outfit = {252,251}, cost = 0, items = {{2667,500}}},
	[50017] = {name = "Nightmare Addon", addon_type = 3, outfit = {269,268}, cost = 0, items = {{6391,3}}},
	[50018] = {name = "Jester Addon", addon_type = 3, outfit = {270,273}, cost = 0, items = {{5480,1}}},
	[50019] = {name = "Brotherhood Addon", addon_type = 3, outfit = {279,278}, cost = 0, items = {{6500,2000}}},
	[50020] = {name = "Demonhunter Addon", addon_type = 3, outfit = {288,289}, cost = 150000, items = {{}}},
	[50021] = {name = "Yalaharian Addon", addon_type = 3, outfit = {324,325}, cost = 150000, items = {{}}}
}

function checkRequirements(cid, addon)
	if getPlayerMoney(cid) < addon.cost then
		return false
	else
		for req in ipairs(addon.items) do
			if (addon.items[req][2] ~= nil) then
				if (getPlayerItemCount(cid, addon.items[req][1]) < addon.items[req][2]) then
					return false
				end
			end
		end
	end
	return true
end

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local addon, removeItems, removeMoney = config[item.uid], 0, 0
	
	if canPlayerWearOutfit(cid, addon.outfit[1], addon.addon_type) then
		doPlayerSendTextMessage(cid, 21, "You already have the "..addon.name..".")
	elseif (checkRequirements(cid, addon)) then
		for req in ipairs(addon.items) do
			doPlayerRemoveItem(cid, addon.items[req][1], addon.items[req][2])
		end
		doPlayerRemoveMoney(cid, addon.cost)
		doPlayerAddOutfit(cid, addon.outfit[1], addon.addon_type)
		doPlayerAddOutfit(cid, addon.outfit[2], addon.addon_type)
		doPlayerSendTextMessage(cid, 21, "Now you can use the "..addon.name..".")
	else
		msg = "You need:\n"
		if addon.cost ~= 0 then
			msg = msg ..addon.cost.." gold coins\n"
		end
		for reqitem in ipairs(addon.items) do
			if (addon.items[reqitem][2] ~= nil) then
				msg = msg ..addon.items[reqitem][2].."x "..getItemNameById(addon.items[reqitem][1]).."\n"
			end
		end
		doShowTextDialog(cid, 9693, msg.."for the "..addon.name..".")
	end
end