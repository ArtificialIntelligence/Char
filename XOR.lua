os.loadAPI("CC/AI.lua")
local AI = _G["AI.lua"]
local myNet = AI.Net({2,4,1})
local cycle =1
while true do
  myNet.feedForward({1,0})
  myNet.backProp({1})
  print("1,0")
  print(textutils.serialize(myNet.getResults()))
  myNet.feedForward({0,1})
  myNet.backProp({1})
  print("0,1")
  print(textutils.serialize(myNet.getResults()))
  myNet.feedForward({0,0})
  myNet.backProp({0})
  print("0,0")
  print(textutils.serialize(myNet.getResults()))
  myNet.feedForward({1,1})
  myNet.backProp({0})
  print("1,1")
  print(textutils.serialize(myNet.getResults()))
  print(os.clock())
  print(cycle)
  cycle = cycle + 1
  os.queueEvent("Lol")
  event = os.pullEvent()
  if event == "key" then break end
end

while true do
	print("Input the input for the first neuron: a number!")
	first = tonumber(read())
	print("Input the input for the second neuron: a number!")
	second = tonumber(read())
	myNet.feedForward({first,second})
	print(textutils.serialize(myNet.getResults()))
end