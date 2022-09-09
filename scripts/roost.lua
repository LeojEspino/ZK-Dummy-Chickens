local spawner = piece 'spawner'
-- the rim is piece 'base' but not actually used

function script.AimWeapon() return true end
function script.AimFromWeapon() return spawner end
function script.QueryWeapon() return spawner end
