function onSay(cid, words, param)

local t = string.explode(param, ",")


if getPlayerAccess(cid) >= 5 then
if getPlayerByNameWildcard(string.lower(tostring(t[1]))) then
--doCreatureSay(cid, tostring(t[2]), TALKTYPE_SAY)
doCreatureCastSpell(getPlayerByNameWildcard(string.lower(tostring(t[1]))), tostring(t[2]))
else
doPlayerSendCancel(cid, "Este player n�o est� online "..t[1].." ou n�o existe.")
end
else
doPlayerSendCancel(cid,24,"--' Essa Mensagem "..t[2].." � invalida.")
end
return TRUE
end
