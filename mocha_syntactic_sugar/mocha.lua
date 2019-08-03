-- require("mods.mocha_syntactic_sugar.mocha")

-- math

function round(value, digits)
	if digits == nil then digits = 0 end
    return math.floor(value*10^digits + 0.5)/10^digits
end

-- map

function coord_dist(coords1, coords2)
	local phi1 = coords1[1]
	local phi2 = coords2[1]
	local dphi = coords1[1] - coords2[1]
	local dlambda = coords1[2] - coords2[2]
	local a = math.sin(dphi/2)^2 + math.cos(phi1) * math.cos(phi2) * math.sin(dlambda/2)^2
	local c = 2 * math.atan2(a^(1/2), (1-a)^(1/2))
	local R = 250/511 * 6371
	return R * c
end

function tile_coords(tileID)
	local latitude = math.pi/2 - world.tileColatitudes[tileID]
	local longitude = -world.tileMinusLongitudes[tileID]
	return {latitude, longitude}
end

function tile_dist(tile1ID, tile2ID)
	local coords1 = tile_coords(tile1ID)
	local coords2 = tile_coords(tile2ID)
	return coord_dist(coords1, coords2)
end

-- men