--Drop Draco
--fixed by MLD
function c511009737.initial_effect(c)
	--special summon
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_FIELD)
	e1:SetCode(EFFECT_SPSUMMON_PROC)
	e1:SetProperty(EFFECT_FLAG_UNCOPYABLE)
	e1:SetRange(LOCATION_HAND)
	e1:SetCountLimit(1,51109737)
	e1:SetCondition(c511009737.spcon)
	c:RegisterEffect(e1)
	--damage
	local e2=Effect.CreateEffect(c)
	e2:SetDescription(aux.Stringid(511009738,0))
	e2:SetCategory(CATEGORY_DAMAGE)
	e2:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_TRIGGER_O)
	e2:SetProperty(EFFECT_FLAG_DELAY)
	e2:SetRange(LOCATION_MZONE)
	e2:SetCode(EVENT_TO_GRAVE)
	e2:SetCountLimit(1,51109737)
	e2:SetTarget(c511009737.damtg)
	e2:SetOperation(c511009737.damop)
	c:RegisterEffect(e2)
end
function c511009737.spfilter(c)
	return c:IsFaceup() and c:IsLinkAbove(3) 
end
function c511009737.spcon(e,c)
	if c==nil then return true end
	local tp=c:GetControler()
	return Duel.GetLocationCount(tp,LOCATION_MZONE)>0
		and Duel.IsExistingMatchingCard(c511009737.spfilter,tp,LOCATION_MZONE,0,1,nil)
end
function c511009737.damtg(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return eg:IsExists(Card.IsPreviousLocation,1,nil,LOCATION_HAND+LOCATION_DECK+LOCATION_ONFIELD) end
	local ct=eg:FilterCount(Card.IsPreviousLocation,nil,LOCATION_HAND+LOCATION_DECK+LOCATION_ONFIELD)
	Duel.SetTargetParam(ct*300)
	Duel.SetOperationInfo(0,CATEGORY_DAMAGE,nil,0,PLAYER_ALL,ct*300)
end
function c511009737.damop(e,tp,eg,ep,ev,re,r,rp)
	local dam=Duel.GetChainInfo(0,CHAININFO_TARGET_PARAM)
	Duel.Damage(tp,dam,REASON_EFFECT,true)
	Duel.Damage(1-tp,dam,REASON_EFFECT,true)
	Duel.RDComplete()
end
