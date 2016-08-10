
info = {["a"]=1,2,3}
d = {}
table.insert(d, info)
table.insert(d, info)

for k,v in pairs(d) do
	print( v["a"] )
end
