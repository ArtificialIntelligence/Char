--[[
	The test program to see if it works.
]]--

os.loadAPI("CC/AI")

local myNet = AI.Net({15,32,32,32,8})

myNet.trainFromDir("Char/Data",10)
