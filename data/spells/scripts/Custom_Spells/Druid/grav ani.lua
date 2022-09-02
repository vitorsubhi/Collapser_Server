local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE,4)
setCombatParam(combat, COMBAT_PARAM_EFFECT,46)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT,29)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -0, -0.0, -0.0, -0.0)


local condition = createConditionObject(CONDITION_PARALYZE)
setConditionParam(condition, CONDITION_PARAM_TICKS, 20000)
--setConditionParam(condition, CONDITION_PARAM_SPEED, -500)
setConditionFormula(condition, -0.9, 0, -1, 0)
setCombatCondition(combat, condition)


function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end