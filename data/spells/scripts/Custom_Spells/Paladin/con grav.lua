local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_FIREWORK_BLUE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SHIVERARROW)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -32.33, -33.34, -32.33, 0)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end