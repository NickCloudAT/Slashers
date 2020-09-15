if SERVER then
  function sls_print_debug_hit(target, damageinfo)
    if not target or not IsValid(target) or not target:IsPlayer() then return end
  	if not target:Alive() then return end

  	local attacker = damageinfo:GetAttacker()

  	if not attacker or not IsValid(attacker) or not attacker:IsPlayer() or attacker:Team() == target:Team() then return end

    local survString = "SURVIV"
    local killString = "KILLER"

    local attackerNick = attacker:Team() == TEAM_KILLER and attacker:Nick() .. "(" .. killString .. ")" or attacker:Nick() .. "(" .. survString .. ")"
    local targetNick = target:Team() == TEAM_KILLER and target:Nick() .. "(" .. killString .. ")" or target:Nick() .. "(" .. survString .. ")"

    print("[DEBUG-HURT] " .. attackerNick .. " damaged " .. targetNick .. " [" .. damageinfo:GetDamage() .. "]")
  end
end
