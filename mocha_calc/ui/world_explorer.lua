function myMochaFunctionOWO()
	mem = {0}
	calcText = Spawn(lgo.textField, ui)
	Reorient_TopLeft(calcText)
	-- Move(-155, -140, calcText)
	Resize(100, 20, calcText)
	refreshCalc()

	-- negate
	button_negate = Spawn(lgo.textButton, ui)
	SetCode([[
		mem[#mem] = -mem[#mem]
		refreshCalc()
	]], button_negate)
	Reorient_TopLeft(button_negate)
	Move(0, 20, button_negate)
	Resize(20, 20, button_negate)
	SetTextField("~", button_negate)
	AddTooltip([[
		function get_tooltip()
			return "Negation"
		end
	]], button_negate)

	-- sqrt
	button_sqrt = Spawn(lgo.textButton, ui)
	SetCode([[
		mem[#mem] = mem[#mem]^(1/2)
		refreshCalc()
	]], button_sqrt)
	Reorient_TopLeft(button_sqrt)
	Move(20, 20, button_sqrt)
	Resize(20, 20, button_sqrt)
	SetTextField("R", button_sqrt)
	AddTooltip([[
		function get_tooltip()
			return "Square Root"
		end
	]], button_sqrt)

	-- 7
	button_7 = Spawn(lgo.textButton, ui)
	SetCode([[keypadNum(7)]], button_7)
	Reorient_TopLeft(button_7)
	Move(0, 40, button_7)
	Resize(20, 20, button_7)
	SetTextField("7", button_7)
	AddTooltip([[
		function get_tooltip()
			return "Seven"
		end
	]], button_7)

	-- Clear
	button_clear = Spawn(lgo.textButton, ui)
	SetCode([[
		mem = {0}
		refreshCalc()
	]], button_clear)
	Reorient_TopLeft(button_clear)
	Move(80, 40, button_clear)
	Resize(20, 40, button_clear)
	SetTextField("CLS", button_clear)
	AddTooltip([[
		function get_tooltip()
			return "Memory Clear"
		end
	]], button_clear)

	-- Enter
	button_enter = Spawn(lgo.textButton, ui)
	SetCode([[
		table.insert(mem, 0)
		refreshCalc()
	]], button_enter)
	Reorient_TopLeft(button_enter)
	Move(80, 80, button_enter)
	Resize(20, 40, button_enter)
	SetTextField("Enter", button_enter)
	AddTooltip([[
		function get_tooltip()
			return "Enter"
		end
	]], button_enter)

	-- +
	button_plus = Spawn(lgo.textButton, ui)
	SetCode([[
		mem[#mem - 1] = mem[#mem - 1] + mem[#mem]
		table.remove(mem, #mem)
		refreshCalc()
	]], button_plus)
	Reorient_TopLeft(button_plus)
	Move(60, 100, button_plus)
	Resize(20, 20, button_plus)
	SetTextField("+", button_plus)
	AddTooltip([[
		function get_tooltip()
			return "Addition"
		end
	]], button_plus)
end

function keypadNum(n)
	mem[#mem] = 10*mem[#mem]+n
	refreshCalc()
end

function refreshCalc()
	SetTextField(mem[#mem], calcText)
end

local foo = on_world_explorer_loaded
on_world_explorer_loaded = function() foo() myMochaFunctionOWO() end