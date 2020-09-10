if SERVER then

  local GM = GM or GAMEMODE

  function sls_start_regen()
    timer.Create("sls_regen_timer", 0.1, 0, function()
      if not GM.ROUND.Active then return end

      for k,v in ipairs(player.GetAll()) do
        if not v:Alive() then continue end

        if not v.health_regen_time then v.health_regen_time = CurTime() end

        if v:Team() == TEAM_KILLER then
          if v.health_regen_time+5 < CurTime() then
            local newHealth = v:Health()+1 <= v:GetMaxHealth() and v:Health()+1 or v:GetMaxHealth()
            v:SetHealth(newHealth)
            v.health_regen_time = CurTime()
          end
          continue
        end

        local regen_delay = GM.CLASS.Survivors[v.ClassID].health_regen_delay
        local regen_amount = GM.CLASS.Survivors[v.ClassID].health_regen_amount

        if v.health_regen_time+regen_delay < CurTime() then
          local newHealth = v:Health()+regen_amount <=v:GetMaxHealth() and v:Health()+regen_amount or v:GetMaxHealth()
          v:SetHealth(newHealth)
          v.health_regen_time = CurTime()
        end
      end
    end)
  end

  function sls_reset_regen()
    for k,v in ipairs(player.GetAll()) do
      v.health_regen_time = nil
    end
  end

  function sls_kill_regen()
    timer.Remove("sls_regen_timer")
  end

end
