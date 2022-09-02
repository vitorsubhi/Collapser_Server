local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, true)
setCombatParam(combat, COMBAT_PARAM_EFFECT,CONST_ME_MAGIC_RED)

function onGetFormulaValues(cid, level)
	min = - level*3 - 250
	max = - level*3 - 250	
	return min, max
end
setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")
function onCastSpell(cid, var)
doSendMagicEffect(getThingPos(getCreatureTarget(cid)), 13)
	local min = (getPlayerLevel(cid) * 3) * 0.8 - 30
	local max = (getPlayerLevel(cid) * 3) * 0.8
	return doCombat(cid, combat, var)
end
