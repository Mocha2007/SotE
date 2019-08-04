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

function line_between(tile1ID, tile2ID)
	local line_array = {tile1ID}
	while line_array[#line_array] != tile2ID and line_array[#line_array] != line_array[#line_array - 1] do
		log("lb3 "..tostring(line_array[#line_array]))
		table.insert(line_array, tile_neighbor_closest_to(line_array[#line_array], tile2ID));
	end
	log("lb4")
	return line_array
end

function neighbors(tileID)
	return table.slice(world.tileNeighbors, 6*tileID, 6*tileID+5)
end

function neighbors_in_radius(tileID, radius)
	if radius <= 1 then
		return neighbors(tileID)
	end
	local a = neighbors_in_radius(tileID, radius-1)
	for _, cell in pairs(neighbors_in_radius(tileID, radius-1)) do
		table.add(a, neighbors(cell))
	end
	return a
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

function tile_neighbor_closest_to(tile1ID, tile2ID)
	-- returns the ID of the neighbor of tile1 which is CLOSEST to tile2
	-- world.tileNeighbors[tile1ID]
	local tile1_neighbors = neighbors(tile1ID)
	local best_id = tile1ID
	local best_dist = tile_dist(tile1ID, tile2ID)
	-- log(tile1ID)
	-- log(type(tile1_neighbors))
	log('OwOcean cUwUents')
	log(table.string(tile1_neighbors))
	for _, t1n in pairs(tile1_neighbors) do
		local new_dist = tile_dist(t1n, tile2ID)
		log(tostring(new_dist)..' ? '..tostring(best_dist))
		if new_dist < best_dist then
			best_id = t1n
			best_dist = new_dist
		end
	end
	return best_id
end

-- men

-- in-place concatenation
function table.add(a, b)
	for _, v in pairs(b) do
		table.insert(a, v)
	end
end

-- https://stackoverflow.com/a/24823383/2579798
function table.slice(tbl, first, last, step)
	local sliced = {}
	for i = first or 1, last or #tbl, step or 1 do
		sliced[#sliced+1] = tbl[i]
	end
	return sliced
end

-- https://stackoverflow.com/a/27028488/2579798
function table.string(o)
	if type(o) == 'table' then
		local s = '{ '
		for k,v in pairs(o) do
			if type(k) ~= 'number' then k = '"'..k..'"' end
			s = s .. '['..k..'] = ' .. table.string(v) .. ','
		end
		return s .. '} '
	else
		return tostring(o)
	end
end