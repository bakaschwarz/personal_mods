AddPrefabPostInit("minerhat", function(inst)
    inst.entity:AddLight()
    inst.Light:SetRadius(20.0)
    inst.Light:SetFalloff(.9)
    inst.Light:SetIntensity(0.65)
    inst.Light:SetColour(1, 1, 1)
    inst.Light:EnableClientModulation(true)
    inst.percent = 100
    inst:ListenForEvent("percentusedchange", function(inst, data) inst.percent = data.percent end)
    inst:DoPeriodicTask(0.5, function(inst)
        print(inst.percent)
        if inst.replica.equippable:IsEquipped() and inst.percent > 0 then
            inst.Light:Enable(true)
        else
            inst.Light:Enable(false)
        end
    end)
end)

AddPrefabPostInit("lantern", function(inst)
    inst.entity:AddLight()
    inst.Light:SetRadius(20.0)
    inst.Light:SetFalloff(.9)
    inst.Light:SetIntensity(0.65)
    inst.Light:SetColour(1, 1, 1)
    inst.Light:EnableClientModulation(true)
    inst.percent = 100
    inst:ListenForEvent("percentusedchange", function(inst, data) inst.percent = data.percent end)
    inst:DoPeriodicTask(0.5, function(inst)
        print(inst.percent)
        if inst.replica.equippable:IsEquipped() and inst.percent > 0 then
            inst.Light:Enable(true)
        else
            inst.Light:Enable(false)
        end
    end)
end)

local _G = GLOBAL
local require = _G.require
local attack_shadow = true
local PlayerController = require "components/playercontroller"

local function ShadowAttackToggle()
    local player = _G.ThePlayer
    if not player or player.HUD:HasInputFocus() then return end
    attack_shadow = not attack_shadow
    local atack_shadow_str = attack_shadow and "on" or "off"
    player.components.talker:Say("Attack shadows: " .. atack_shadow_str)
end
_G.TheInput:AddKeyDownHandler(GetModConfigData("ATTACK"), ShadowAttackToggle)

local comb_rep = GLOBAL.require "components/combat_replica"
local old_IsAlly = comb_rep.IsAlly
function comb_rep:IsAlly(guy,...)
    if not attack_shadow and guy:HasTag("shadow") then
        return true
    end
	return old_IsAlly(self,guy,...)
end