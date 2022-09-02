local number = 3500 -- < quanto maior, mais dificil de pescar um monstro 3500
local config = {
    rateSkill = getConfigValue("rateSkill")
}
function onUse(cid, item, frompos, item2, topos)
	local newpos = {x=topos.x, y=topos.y-1, z=topos.z}
	--doPlayerAddSkillTry(cid, SKILL_FISHING, config.rateSkill)[
	doSendMagicEffect(newpos, 53)
    return 1
end
