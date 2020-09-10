if SERVER then
  function sls_print_debug_hit(target, damageinfo)
    if not target or not IsValid(target) or not target:IsPlayer() then return end
  	if not target:Alive() then return end

  	local attacker = damageinfo:GetAttacker()

  	if not attacker or not IsValid(attacker) or not attacker:IsPlayer() or attacker:Team() == target:Team() then return end

    print("[DEBUG-HURT] " .. attacker:Nick() .. " damaged " .. target:Nick() .. " [" .. damageinfo:GetDamage() .. "]")
  end
end
