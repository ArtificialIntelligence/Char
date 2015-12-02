--[[
	Name: Learn
	Author: Creator
	Description: How else do you learn, man?
]]--

os.loadAPI("CC/AI.lua")
local AI = _G["AI.lua"]

local myNet = AI.Net({15,32,32,32,8})

myNet.trainFromDir("Char/Data",100,true)

local file = fs.open("Char/temp/NN.lua","w")
file.write(textutils.serialize(myNet.serialize()))
file.close()