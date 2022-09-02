local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, true)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_FLASHARROW)

function onGetFormulaValues(cid, level)
	min = - level*5 - 150
	max = - level*6 - 180	
	return min, max
end
setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")
function onCastSpell(cid, var)
doSendMagicEffect(getThingPos(getCreatureTarget(cid)), 38)
	local min = (getPlayerLevel(cid) * 4) * 0.6 - 30
	local max = (getPlayerLevel(cid) * 5) * 0.6
    doCreatureAddHealth(cid, math.random(min, max))
	return doCombat(cid, combat, var)
end
