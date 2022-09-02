local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT,CONST_ME_GROUNDSHAKER)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_WHIRLWINDSWORD)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -35.36, -36.37, -34.36, 0)

local arr = {
{0, 0, 0},
{0, 0, 0},
{1, 3, 1},
{0, 0, 0},
{0, 0, 0},
{0, 0, 0},
}

local area = createCombatArea(arr)

setCombatArea(combat, area)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end