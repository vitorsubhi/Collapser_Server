local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 27)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 40)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -0.1, -0, -0.0, 0)

local condition = createConditionObject(CONDITION_DRUNK)
setConditionParam(condition, CONDITION_PARAM_TICKS, 10000)
setCombatCondition(combat, condition)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end