local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_GREEN_RINGS)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -18.14, -18.14, -18.15, 0)

local arr = {
{1, 1, 1},
{1, 3, 1},
{1, 1, 1},
{0, 0, 0},
{0, 0, 0},
{0, 0, 0},
}

local area = createCombatArea(arr)

setCombatArea(combat, area)

function onCastSpell(cid, var)
doPlayerAddSoul(cid, math.random(2, 2))
	return doCombat(cid, combat, var)
end
