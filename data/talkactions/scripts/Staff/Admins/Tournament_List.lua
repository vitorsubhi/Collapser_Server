tournament_list = {}
function onSay(cid, words, param)
local str = ""
	if param == "add" then
		table.insert(tournament_list, cid)
	elseif param == "see" then
		for players_tournament in ipairs(tournament_list) do
			str = str .. "Name: "..tournament_list[1].."\n"
		end
		doShowTextDialog(cid, 2580, str)
	end
	return true
end 
