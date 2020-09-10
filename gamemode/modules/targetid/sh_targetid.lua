if CLIENT then
  local function HUDPaint()
    local ply = LocalPlayer()
    if !ply:Alive() then return end
    if !GAMEMODE.ROUND.Active then return end
    draw.DrawText("HP: " .. tostring(ply:Health()), "TFASleek", ScrW() * 0.5, ScrH() - 100, Color(255,0,0,255), TEXT_ALIGN_CENTER)
  end
  hook.Add("HUDPaint", "sls_health_HUDPaint", HUDPaint)

  local function HUDPaint2()
    local ply = LocalPlayer()
    if !ply:Alive() then return end
    if !GAMEMODE.ROUND.Active then return end

    local tr = util.TraceLine( {
      start = ply:EyePos(),
      endpos = ply:EyePos() + EyeAngles():Forward() * 700,
      filter = ply
    } )

    local ent = tr.Entity

    if not ent or not IsValid(ent) or not ent:IsPlayer() then return end

    if not ent:Alive() then return end

    draw.DrawText(ent:Nick(), "TFASleekSmall", ScrW() * 0.5, ScrH() * 0.25, Color(255,255,255,255), TEXT_ALIGN_CENTER)
  end
  hook.Add("HUDPaint", "sls_name_HUDPaint", HUDPaint2)
end
