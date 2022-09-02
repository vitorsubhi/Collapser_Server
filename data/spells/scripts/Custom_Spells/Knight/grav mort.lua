local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT,CONST_ME_MAGIC_RED)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -27.28, -27.28, -28.29, 0)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end