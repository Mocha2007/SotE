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

	-- square
	button_square = Spawn(lgo.textButton, ui)
	SetCode([[
		mem[#mem] = mem[#mem]^2
		refreshCalc()
	]], button_square)
	Reorient_TopLeft(button_square)
	Move(40, 20, button_square)
	Resize(20, 20, button_square)
	SetTextField("S", button_square)
	AddTooltip([[
		function get_tooltip()
			return "Square"
		end
	]], button_square)

	-- pow
	button_pow = Spawn(lgo.textButton, ui)
	SetCode([[
		mem[#mem - 1] = mem[#mem - 1] ^ mem[#mem]
		table.remove(mem, #mem)
		refreshCalc()
	]], button_pow)
	Reorient_TopLeft(button_pow)
	Move(60, 20, button_pow)
	Resize(20, 20, button_pow)
	SetTextField("^", button_pow)
	AddTooltip([[
		function get_tooltip()
			return "Exponentiation"
		end
	]], button_pow)

	-- log
	button_log = Spawn(lgo.textButton, ui)
	SetCode([[
		mem[#mem] = math.log(mem[#mem])
		refreshCalc()
	]], button_log)
	Reorient_TopLeft(button_log)
	Move(80, 20, button_log)
	Resize(20, 20, button_log)
	SetTextField("L", button_log)
	AddTooltip([[
		function get_tooltip()
			return "Natural Logarithm"
		end
	]], button_log)

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

	-- 8
	button_8 = Spawn(lgo.textButton, ui)
	SetCode([[keypadNum(8)]], button_8)
	Reorient_TopLeft(button_8)
	Move(20, 40, button_8)
	Resize(20, 20, button_8)
	SetTextField("8", button_8)
	AddTooltip([[
		function get_tooltip()
			return "Eight"
		end
	]], button_8)

	-- 9
	button_9 = Spawn(lgo.textButton, ui)
	SetCode([[keypadNum(9)]], button_9)
	Reorient_TopLeft(button_9)
	Move(40, 40, button_9)
	Resize(20, 20, button_9)
	SetTextField("9", button_9)
	AddTooltip([[
		function get_tooltip()
			return "Nine"
		end
	]], button_9)

	-- div
	button_div = Spawn(lgo.textButton, ui)
	SetCode([[
		mem[#mem - 1] = mem[#mem - 1] / mem[#mem]
		table.remove(mem, #mem)
		refreshCalc()
	]], button_div)
	Reorient_TopLeft(button_div)
	Move(60, 40, button_div)
	Resize(20, 20, button_div)
	SetTextField("/", button_div)
	AddTooltip([[
		function get_tooltip()
			return "Division"
		end
	]], button_div)

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