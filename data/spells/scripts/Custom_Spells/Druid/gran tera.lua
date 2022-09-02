local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, 4)
setCombatParam(combat, COMBAT_PARAM_EFFECT,46)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 29)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -6.6, -6.6, -6.7, 0)

function onCastSpell(cid, var)
doPlayerAddSoul(cid, math.random(1, 1))
	return doCombat(cid, combat, var)
end