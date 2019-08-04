require("mods.mocha_syntactic_sugar.mocha")

function myMochaFunctionOWO()
    leftCoords = {0, 0}
    rightCoords = {0, 0}
	myMochaText = Spawn(lgo.textField, ui)
	color_blue = Color32(0, 0, 255, 255)
	color_red = Color32(255, 0, 0, 255)
end

-- mocha 2019 aug 03

function on_tile_left_clicked()
	log("TILE LEFT-CLICKED")
	leftTileID = world.selectedTileID
	-- highlight
	for _, dotTileID in pairs(neighbors(leftTileID)) do
		world.tileCalaDebugColors[dotTileID] = color_blue
	end
	world.UpdateMapMode(mapModes.DEBUG_COLOR_2)
end

function on_tile_right_clicked()
	log("TILE RIGHT-CLICKED")
	rightTileID = world.selectedTileID
	-- disp
	currentDistance = tostring(round(tile_dist(leftTileID, rightTileID), 3))
	SetTextField(currentDistance.." km", myMochaText)
	-- color/log
	world.tileCalaDebugColors[leftTileID] = color_red
	world.tileCalaDebugColors[rightTileID] = color_red

	for _, lineTileID in pairs(line_between(leftTileID, rightTileID)) do
		world.tileCalaDebugColors[lineTileID] = color_red
	end
	world.UpdateMapMode(mapModes.DEBUG_COLOR_2)
	-- log(currentDistance)
end

local foo = on_world_explorer_loaded
on_world_explorer_loaded = function() foo() myMochaFunctionOWO() end