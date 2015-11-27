--[[
	The test program to see if it works.
]]--

os.loadAPI("CC/AI.lua")
local AI = _G["AI.lua"]

local myNet = AI.Net({15,32,32,32,8})

myNet.trainFromDir("Char/Data",10000,true)

local file = fs.open("Char/CharNN.lua","w")
file.write(textutils.serialize(myNet.serialize()))
file.close()