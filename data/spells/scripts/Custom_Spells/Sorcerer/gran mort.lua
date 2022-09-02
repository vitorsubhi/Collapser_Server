local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT,CONST_ME_MORTAREA)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SUDDENDEATH)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -14.14, -18.14, -25.15, 0)

function onCastSpell(cid, var)
doPlayerAddSoul(cid, math.random(1, 1))
	return doCombat(cid, combat, var)
end
