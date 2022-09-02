local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HEALING)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, FALSE)
setCombatParam(combat, COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)

function onGetFormulaValues(cid, level, maglevel)
	min = (level * 2 + maglevel * 3) * 2.3
	max = (level * 2 + maglevel * 3) * 2.6

	return min, max
end

setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")


function onCastSpell(cid, var)
doPlayerAddSoul(cid, math.random(1, 1))
	return doCombat(cid, combat, var)
end