local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HEALING)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_HOLYAREA)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, FALSE)
setCombatParam(combat, COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 6.6, -5, 6.7, -0)

array = {
{3}
}

local area = createCombatArea(array)
setCombatArea(combat, area)

local function TempoSio(parameters, turn)
	if turn > 0 then
		doCombat(parameters.cid, parameters.combat, parameters.var)
		addEvent(TempoSio, 7500/turn , parameters, turn-1)
	end
	return true
end

function onCastSpell(cid, var)
local parameters = {cid = cid, var = var, combat = combat }
	if (cid ~= variantToNumber(parameters.var)) then
		addEvent(TempoSio, 100, parameters, 20)
		return doCombat(cid, combat1, var)
	else
		doPlayerSendTextMessage(cid, 27, "You can not use on yourself.") 
		return false
	end
end
