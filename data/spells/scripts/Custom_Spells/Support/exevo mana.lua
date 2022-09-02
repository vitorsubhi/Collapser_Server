local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_MANADRAIN)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 35)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, FALSE)
setCombatParam(combat, COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end

