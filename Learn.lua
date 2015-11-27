--[[
	Name: Learn
	Author: Creator
	Description: How else do you learn, man?
]]--

os.loadAPI("CC/AI.lua")
local AI = _G["AI.lua"]

if fs.exists("Char/NN.lua") then
	local file = fs.open("Char/NN.lua","r")
	local data = file.readAll()
	file.close()
	local myNet = AI.unserialize(textutils.unserialize(data))
else
	local myNet = AI.Net({15,32,32,32,8})
end

myNet.trainFromDir("Char/Data",10000,true)

local file = fs.open("Char/temp/NN.lua","w")
file.write(textutils.serialize(myNet.serialize()))
file.close()