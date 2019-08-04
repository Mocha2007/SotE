require("mods.mocha_syntactic_sugar.mocha")

function myMochaFunctionOWO()
    leftCoords = {0, 0}
    rightCoords = {0, 0}
	myMochaText = Spawn(lgo.textField, ui)
	color_red = Color32(255, 0, 0, 255)
	color_orange = Color32(255, 128, 0, 255)
	color_yellow = Color32(224, 224, 0, 255)
	color_green = Color32(0, 192, 0, 255)
	color_blue = Color32(0, 0, 255, 255)
	color_purple = Color32(128, 0, 128, 255)

	-- paint
	paintMode = false
	paintColor = color_red
	paint_button = Spawn(lgo.textButton, ui)
	SetCode([[toggle_paint()]], paint_button)
	Reorient_TopRight(paint_button)
	Move(-5, -100, paint_button)
	Resize(100, 20, paint_button)
	SetTextField("Paint Mode", paint_button)
	AddTooltip([[
		function get_tooltip()
			return "Paint SotEworld~!"
		end
	]], paint_button)

	-- Red
	paint_button_red = Spawn(lgo.textButton, ui)
	SetCode([[paintColor = color_red]], paint_button_red)
	Reorient_TopRight(paint_button_red)
	Move(-5, -120, paint_button_red)
	Resize(100, 20, paint_button_red)
	SetTextField("Red", paint_button_red)
	AddTooltip([[
		function get_tooltip()
			return "Heretic Blood Red"
		end
	]], paint_button_red)

	-- Orange
	paint_button_orange = Spawn(lgo.textButton, ui)
	SetCode([[paintColor = color_orange]], paint_button_orange)
	Reorient_TopRight(paint_button_orange)
	Move(-5, -140, paint_button_orange)
	Resize(100, 20, paint_button_orange)
	SetTextField("Orange", paint_button_orange)
	AddTooltip([[
		function get_tooltip()
			return "Beaver Puke Orange"
		end
	]], paint_button_orange)

	-- Yellow
	paint_button_yellow = Spawn(lgo.textButton, ui)
	SetCode([[paintColor = color_yellow]], paint_button_yellow)
	Reorient_TopRight(paint_button_yellow)
	Move(-5, -160, paint_button_yellow)
	Resize(100, 20, paint_button_yellow)
	SetTextField("Yellow", paint_button_yellow)
	AddTooltip([[
		function get_tooltip()
			return "Gamer Girl Piss Yellow"
		end
	]], paint_button_yellow)

	-- Green
	paint_button_green = Spawn(lgo.textButton, ui)
	SetCode([[paintColor = color_green]], paint_button_green)
	Reorient_TopRight(paint_button_green)
	Move(-5, -180, paint_button_green)
	Resize(100, 20, paint_button_green)
	SetTextField("Green", paint_button_green)
	AddTooltip([[
		function get_tooltip()
			return "Orc Green"
		end
	]], paint_button_green)

	-- Blue
	paint_button_blue = Spawn(lgo.textButton, ui)
	SetCode([[paintColor = color_blue]], paint_button_blue)
	Reorient_TopRight(paint_button_blue)
	Move(-5, -200, paint_button_blue)
	Resize(100, 20, paint_button_blue)
	SetTextField("Blue", paint_button_blue)
	AddTooltip([[
		function get_tooltip()
			return "Merfolk Blue"
		end
	]], paint_button_blue)

	-- Purple
	paint_button_purple = Spawn(lgo.textButton, ui)
	SetCode([[paintColor = color_purple]], paint_button_purple)
	Reorient_TopRight(paint_button_purple)
	Move(-5, -220, paint_button_purple)
	Resize(100, 20, paint_button_purple)
	SetTextField("Purple", paint_button_purple)
	AddTooltip([[
		function get_tooltip()
			return "Calandiel Purple"
		end
	]], paint_button_purple)
end

-- mocha 2019 aug 03

function on_tile_left_clicked()
	log("TILE LEFT-CLICKED")
	leftTileID = world.selectedTileID
	if paintMode then
		world.tileCalaDebugColors[leftTileID] = paintColor
		return world.UpdateMapMode(mapModes.DEBUG_COLOR_2)
	end
	-- highlight
	for _, dotTileID in pairs(neighbors(leftTileID)) do
		world.tileCalaDebugColors[dotTileID] = color_blue
	end
	world.UpdateMapMode(mapModes.DEBUG_COLOR_2)
end

function on_tile_right_clicked()
	log("TILE RIGHT-CLICKED")
	rightTileID = world.selectedTileID
	if paintMode then
		this_color = paintColor
	else
		this_color = color_red
	end
	-- disp
	currentDistance = tostring(round(tile_dist(leftTileID, rightTileID), 3))
	SetTextField(currentDistance.." km", myMochaText)
	-- color/log
	world.tileCalaDebugColors[leftTileID] = this_color
	world.tileCalaDebugColors[rightTileID] = this_color

	for _, lineTileID in pairs(line_between(leftTileID, rightTileID)) do
		world.tileCalaDebugColors[lineTileID] = this_color
	end
	world.UpdateMapMode(mapModes.DEBUG_COLOR_2)
	-- log(currentDistance)
end

function toggle_paint()
	paintMode = not paintMode
end

local foo = on_world_explorer_loaded
on_world_explorer_loaded = function() foo() myMochaFunctionOWO() end