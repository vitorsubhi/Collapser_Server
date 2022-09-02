local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT,CONST_ME_ICEATTACK)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 36)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -13.15, -13.15, -15.16, 0)
function onCastSpell(cid, var)
doPlayerAddSoul(cid, math.random(1, 1))
	return doCombat(cid, combat, var)
end
