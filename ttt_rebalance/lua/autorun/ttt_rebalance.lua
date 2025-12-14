AddCSLuaFile()

--------------------------------------------------
-- Single patches
--------------------------------------------------

local function PatchM16()
    local wep = weapons.GetStored("weapon_ttt_m16")
    if not wep then return false end
    wep.Primary = wep.Primary or {}

    wep.Primary.Delay = 0.1 -- 600 RPM
    print("[TTT ReBalance] Patched M16: Primary.Delay = 0.1")

    return true
end

local function PatchMAC10()
    local wep = weapons.GetStored("weapon_zm_mac10")
    if not wep then return false end
    wep.Primary = wep.Primary or {}

    wep.Primary.Damage = 18
    print("[TTT ReBalance] Patched MAC10: Primary.Damage = 18")

    wep.Primary.Delay = 0.055
    print("[TTT ReBalance] Patched MAC10: Primary.Delay = 0.055")

    return true
end

local function PatchHUGE249()
    local wep = weapons.GetStored("weapon_zm_sledge")
    if not wep then return false end
    wep.Primary = wep.Primary or {}

    wep.Primary.Damage = 25
    print("[TTT ReBalance] Patched HUGE249: Primary.Damage = 25")

    wep.Primary.Cone = 0.025
    print("[TTT ReBalance] Patched HUGE249: Primary.Cone = 0.025")

    return true
end

local function PatchGlock()
    local wep = weapons.GetStored("weapon_ttt_glock")
    if not wep then return false end
    wep.Primary = wep.Primary or {}

    wep.Primary.Delay = 0.045
    print("[TTT ReBalance] Patched Glock: Primary.Delay = 0.045")

    wep.Primary.Damage = 17
    print("[TTT ReBalance] Patched Glock: Primary.Damage = 17")

    wep.Primary.Cone = 0.05
    print("[TTT ReBalance] Patched Glock: Primary.Delay = 0.05")

    return true
end

--------------------------------------------------
-- Deferred Runner
--------------------------------------------------

local alreadyPatched = false

local function RunDeferredPatches()
    if alreadyPatched then return end
    alreadyPatched = true

    timer.Simple(0, function()
        PatchM16()
        PatchMAC10()
        PatchHUGE249()
        PatchGlock()
    end)
end

hook.Add("PostGamemodeLoaded", "TTT_Rebalance_Patches_PGML", RunDeferredPatches)
hook.Add("InitPostEntity",     "TTT_Rebalance_Patches_IPE",  RunDeferredPatches)
