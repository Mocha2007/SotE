require("mods.mocha_syntactic_sugar.mocha")

function myMochaFunctionOWO()
    leftCoords = {0, 0}
    rightCoords = {0, 0}
	myMochaText = Spawn(lgo.textField, ui)

	color_red = Color32(255, 0, 0, 255)
	color_blue = Color32(0, 0, 255, 255)
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
	this_color = color_red
	-- disp
	currentDistance = tostring(round(tile_dist(leftTileID, rightTileID), 3))
	-- color/log
	world.tileCalaDebugColors[leftTileID] = this_color
	world.tileCalaDebugColors[rightTileID] = this_color
	local tilecount = 0

	for _, lineTileID in pairs(line_between(leftTileID, rightTileID)) do
		world.tileCalaDebugColors[lineTileID] = this_color
		tilecount = tilecount + 1
	end
	world.UpdateMapMode(mapModes.DEBUG_COLOR_2)
	-- log(currentDistance)
	SetTextField(currentDistance.." km\n"..tilecount.." tiles", myMochaText)
end

local foo = on_world_explorer_loaded
on_world_explorer_loaded = function() foo() myMochaFunctionOWO() end