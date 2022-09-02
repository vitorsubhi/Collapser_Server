local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SMALLHOLY)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_HOLYDAMAGE)

function onGetFormulaValues(cid, level)
	min = - level*3 - 150
	max = - level*3 - 200	
	return min, max
end
setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")
function onCastSpell(cid, var)
doSendMagicEffect(getThingPos(getCreatureTarget(cid)), 38)
	local min = (getPlayerLevel(cid) * 3) * 0.7 - 30
	local max = (getPlayerLevel(cid) * 3) * 0.7
	return doCombat(cid, combat, var)
end
