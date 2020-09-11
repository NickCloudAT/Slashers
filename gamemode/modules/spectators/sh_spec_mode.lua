local plymeta = FindMetaTable("Player")

if SERVER then
  concommand.Add("sls_toggle_specmode", function(ply)
    if not ply or not IsValid(ply) then return end

    local isFSpec = ply:GetNWBool("sls_forcespec", false)

    if isFSpec then
      ply:SetNWBool("sls_forcespec", false)
    else
      ply:SetNWBool("sls_forcespec", true)
      if ply:Alive() then
        ply:Kill()
      end
    end

    ply:ChatPrint("Spectator Mode: " .. tostring(not isFSpec))
  end)
else

end


function plymeta:IsSpec(ply)
  return self:GetNWBool("sls_forcespec", false)
end

function sls_get_specs()
  local specs = {}
  for k,v in ipairs(player.GetAll()) do
    if not v:IsSpec() then continue end
    table.insert(specs, v)
  end

  return specs
end
