include 'constants.lua'

local plane = piece 'plane'

function script.QueryWeapon(num)
    return plane
end

function script.AimFromWeapon(num)
	return plane
end

function script.FireWeapon(num)
	Sleep(50)	-- delay before clearing attack order; else bomb loses target and fails to home
	return true
end