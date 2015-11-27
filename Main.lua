--[[
	Name: Main
	Author: Wassil Janssen
	Description: Test how proficient the network is.
]]--

os.loadAPI("CC/AI.lua")
os.loadAPI("Char/bin")
local AI = _G["AI.lua"]
local input = {}
local function round(num)
	if num < 0.5 then
		return 0
	else
		return 1
	end
end

local file = fs.open("Char/NN.lua","r")
local data = file.readAll()
file.close()
local myNet = AI.unserialize(textutils.unserialize(data))


while true do
	local count = 1
	local input2d = {
		{0,0,0},
		{0,0,0},
		{0,0,0},
		{0,0,0},
		{0,0,0},
	}
	term.setBackgroundColor(colors.black)
	term.clear()
	paintutils.drawLine(4,1,4,6,colors.white)
	paintutils.drawLine(1,6,4,6)
	term.setBackgroundColor(colors.black)
	while true do
		local event = {os.pullEvent()}
		if event[1] == "key" then
			if event[2] == 28 then
				break
			end
		elseif event[1] == "mouse_click" then
			if event[3] <= 3 and event[4] <= 5 then
				input2d[event[4]][event[3]] = 1
				term.setCursorPos(event[3],event[4])
				term.write("x")
			end
		elseif event[1] == "mouse_drag" then
			if event[3] <= 3 and event[4] <= 5 then
				input2d[event[4]][event[3]] = 1
				term.setCursorPos(event[3],event[4])
				term.write("x")
			end
		end
	end
	print(textutils.serialize(input2d))
	for i,v in pairs(input2d) do
		for k,m in pairs(v) do
			input[count] = m
			count = count+1
		end
	end
	print(#input)
	myNet.feedForward(input)
	local results = myNet.getResults()
	print(textutils.serialize(results))
	local str = ""
	for i,v in pairs(results) do
		str = str..tostring(round(v))
		print(v," ",round(v))
	end
	print(str)
	str = bin.binary2byte(str)
	term.setCursorPos(1,7)
	print(string.char(str))
	print(string.byte(str))
	os.pullEvent()
end