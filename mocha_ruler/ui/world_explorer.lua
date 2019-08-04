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
	color_white = Color32(255, 255, 255, 255)
	color_black = Color32(0, 0, 0, 255)
	color_grey = Color32(128, 128, 128, 255)
	color_brown = Color32(128, 64, 0, 255)

	-- paint
	paintMode = false
	brushMode = false
	brushRadius = 1
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

	-- brush mode
	brushSizeText = Spawn(lgo.textField, ui)
	Reorient_TopRight(brushSizeText)
	Move(-155, -140, brushSizeText)
	Resize(25, 20, brushSizeText)
	SetTextField(brushRadius, brushSizeText)

	brush_button = Spawn(lgo.textButton, ui)
	SetCode([[brushMode = not brushMode]], brush_button)
	Reorient_TopRight(brush_button)
	Move(-105, -120, brush_button)
	Resize(50, 20, brush_button)
	SetTextField("Brush Mode", brush_button)
	AddTooltip([[
		function get_tooltip()
			return "Paint Blobs"
		end
	]], brush_button)

	-- brush mode INC
	brush_button_plus = Spawn(lgo.textButton, ui)
	SetCode([[
		brushRadius = brushRadius + 1
		SetTextField(brushRadius, brushSizeText)
	]], brush_button_plus)
	Reorient_TopRight(brush_button_plus)
	Move(-105, -140, brush_button_plus)
	Resize(25, 20, brush_button_plus)
	SetTextField("+", brush_button_plus)
	AddTooltip([[
		function get_tooltip()
			return "Increase Brush Size"
		end
	]], brush_button_plus)

	-- brush mode DEC
	brush_button_minus = Spawn(lgo.textButton, ui)
	SetCode([[
		brushRadius = brushRadius - 1
		SetTextField(brushRadius, brushSizeText)
	]], brush_button_minus)
	Reorient_TopRight(brush_button_minus)
	Move(-130, -140, brush_button_minus)
	Resize(25, 20, brush_button_minus)
	SetTextField("-", brush_button_minus)
	AddTooltip([[
		function get_tooltip()
			return "Decrease Brush Size"
		end
	]], brush_button_minus)

	-- Red
	paint_button_red = Spawn(lgo.textButton, ui)
	SetCode([[paintColor = color_red]], paint_button_red)
	Reorient_TopRight(paint_button_red)
	Move(-55, -120, paint_button_red)
	Resize(50, 20, paint_button_red)
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
	Move(-5, -120, paint_button_orange)
	Resize(50, 20, paint_button_orange)
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
	Move(-55, -140, paint_button_yellow)
	Resize(50, 20, paint_button_yellow)
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
	Move(-5, -140, paint_button_green)
	Resize(50, 20, paint_button_green)
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
	Move(-55, -160, paint_button_blue)
	Resize(50, 20, paint_button_blue)
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
	Move(-5, -160, paint_button_purple)
	Resize(50, 20, paint_button_purple)
	SetTextField("Purple", paint_button_purple)
	AddTooltip([[
		function get_tooltip()
			return "Calandiel Purple"
		end
	]], paint_button_purple)

	-- White
	paint_button_white = Spawn(lgo.textButton, ui)
	SetCode([[paintColor = color_white]], paint_button_white)
	Reorient_TopRight(paint_button_white)
	Move(-55, -180, paint_button_white)
	Resize(50, 20, paint_button_white)
	SetTextField("White", paint_button_white)
	AddTooltip([[
		function get_tooltip()
			return "Demian Blanket White"
		end
	]], paint_button_white)

	-- Black
	paint_button_black = Spawn(lgo.textButton, ui)
	SetCode([[paintColor = color_black]], paint_button_black)
	Reorient_TopRight(paint_button_black)
	Move(-5, -180, paint_button_black)
	Resize(50, 20, paint_button_black)
	SetTextField("Black", paint_button_black)
	AddTooltip([[
		function get_tooltip()
			return "Gnoll Black"
		end
	]], paint_button_black)

	-- Grey
	paint_button_grey = Spawn(lgo.textButton, ui)
	SetCode([[paintColor = color_grey]], paint_button_grey)
	Reorient_TopRight(paint_button_grey)
	Move(-55, -200, paint_button_grey)
	Resize(50, 20, paint_button_grey)
	SetTextField("Grey", paint_button_grey)
	AddTooltip([[
		function get_tooltip()
			return "Dwarven Cavern Grey"
		end
	]], paint_button_grey)

	-- Brown
	paint_button_brown = Spawn(lgo.textButton, ui)
	SetCode([[paintColor = color_brown]], paint_button_brown)
	Reorient_TopRight(paint_button_brown)
	Move(-5, -200, paint_button_brown)
	Resize(50, 20, paint_button_brown)
	SetTextField("Brown", paint_button_brown)
	AddTooltip([[
		function get_tooltip()
			return "Vermen Feces Brown"
		end
	]], paint_button_brown)
end

-- mocha 2019 aug 03

function on_tile_left_clicked()
	log("TILE LEFT-CLICKED")
	leftTileID = world.selectedTileID
	if paintMode then
		if brushMode then
			for _, dotTileID in pairs(neighbors_in_radius(leftTileID, brushRadius)) do
				world.tileCalaDebugColors[dotTileID] = paintColor
			end
		else
			world.tileCalaDebugColors[leftTileID] = paintColor
		end
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
	brush_button.SetActive(paintMode)
	brushSizeText.SetActive(paintMode)
	brush_button_plus.SetActive(paintMode)
	brush_button_minus.SetActive(paintMode)
	paint_button_red.SetActive(paintMode)
	paint_button_orange.SetActive(paintMode)
	paint_button_yellow.SetActive(paintMode)
	paint_button_green.SetActive(paintMode)
	paint_button_blue.SetActive(paintMode)
	paint_button_purple.SetActive(paintMode)
	paint_button_white.SetActive(paintMode)
	paint_button_black.SetActive(paintMode)
	paint_button_grey.SetActive(paintMode)
	paint_button_brown.SetActive(paintMode)
end

local foo = on_world_explorer_loaded
on_world_explorer_loaded = function() foo() myMochaFunctionOWO() end