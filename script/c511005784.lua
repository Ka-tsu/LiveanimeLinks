--Spring of Rebirth (DOR)
--scripted by GameMaster (GM)
function c511005784.initial_effect(c)
--Activate
local e1=Effect.CreateEffect(c)
e1:SetCategory(CATEGORY_ATKCHANGE+CATEGORY_DEFCHANGE)
e1:SetType(EFFECT_TYPE_ACTIVATE)
e1:SetProperty(EFFECT_FLAG_PLAYER_TARGET)
e1:SetCode(EVENT_FREE_CHAIN)
e1:SetTarget(c511005784.target)
e1:SetOperation(c511005784.activate)
c:RegisterEffect(e1)
end


function c511005784.filter(c)
return c:IsRace(RACE_PYRO+RACE_ROCK+RACE_AQUA+RACE_THUNDER) and c:IsFaceup()
end

function c511005784.target(e,tp,eg,ep,ev,re,r,rp,chk)
local tc=Duel.GetFirstTarget()
if chk==0 then return Duel.IsExistingTarget(c511005784.filter,tp,LOCATION_MZONE,0,1,tc) end
Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_TARGET)
Duel.SelectTarget(tp,c511005784.filter,tp,LOCATION_MZONE,0,1,1,tc)
end

function c511005784.activate(e,tp,eg,ep,ev,re,r,rp)
local tc=Duel.GetFirstTarget()
if tc:IsRelateToEffect(e)  then
local e1=Effect.CreateEffect(e:GetHandler())
e1:SetType(EFFECT_TYPE_SINGLE)
e1:SetCode(EFFECT_UPDATE_ATTACK)
e1:SetValue(500)
e1:SetReset(RESET_EVENT+0x1fe0000)
tc:RegisterEffect(e1)
local e2=e1:Clone()
e2:SetCode(EFFECT_UPDATE_DEFENSE)
tc:RegisterEffect(e2)
end
end
