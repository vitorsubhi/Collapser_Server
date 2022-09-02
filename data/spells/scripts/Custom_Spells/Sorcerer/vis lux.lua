local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, 43)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SUDDENDEATH)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -24.25, -24.24, -25.26, 0)

local condition = createConditionObject(CONDITION_PARALYZE)
setConditionParam(condition, CONDITION_PARAM_TICKS, 20000)
--setConditionParam(condition, CONDITION_PARAM_SPEED, -500)
setConditionFormula(condition, -0.4, 0, -0.4, 0)
setCombatCondition(combat, condition)


function onCastSpell(cid, var) 
doPlayerAddSoul(cid, math.random(3, 3)) 
	return doCombat(cid, combat, var)
end

