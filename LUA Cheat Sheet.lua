

-- Operator
=	assignment
==	equality comparison
~= 	negation of equality comparison
>	greater than
>=	greater than or equal to
<	less than
<=	less than or equal to
+	add
-	subtract
*	multiply
/	divide
%	modulus (remainder)
^	exponent
and
or
not
..	concatenation, eg: "Hello " .. "World" .. 12345
#	return the length of string or table, eg: #"Hello" will return 5



print(123)	-- print with newline
print("abc")	-- print with newline

io.write(x)	-- print without new line
write = io.write
write("ok")
write("123")

local var5 = 123	-- local variable
var6 = 456	-- global  variable, automatically destroyed if out of function scope

var0 = nil
var1 = "ok"
var2 = 555
var3 = "hello" + 123

if var1 == "ok" and var2 == 555 then
	print("aaa")
elseif var1 == "no" or var2 == 2 then
	print("bbb")
else 
	print("ccc")
end

a = {"aaa", "bbb", "ccc"}	-- array
print(a[1])	-- array index start from 1

var_array = {}	-- declare var as array/table
table.insert(var_array, 111)
table.insert(var_array, 222)
table.insert(var_array, 333)

table.remove(var_array, 2)

print(var_array[1])
print(var_array[2])
print(var_array[3])

-- class, OOP
local obj = {}
obj = { ["foo"]=555, ["bar"]=888 }	-- hash / assosiative array
obj["baz"] = 999
print(obj["foo"])

obj.hello = function (self) 
	print("hello")
	print(self.baz)
end

obj.hello(obj)
obj:hello()		-- automatically pass 'obj' as the first parameter

--loop
names = {'John', 'Joe', 'Steve'}
for names = 1, 3 do
  print (names)
end

names = {'John', 'Joe', 'Steve'}
for i, name in ipairs(names) do
  print (name)
end

while true do

end

function test1 (x, y)
	return x, y
end

test2 = function (a)
	print(a .. " from test")
end

x, y = test1(123, 456)
test2("aaa")


arr =
{
  apples = { 'a', "red", 5 },
  oranges = { 'o', "orange", 12 },
  pears = { 'p', "green", 7 }
}

for k, v in pairs(arr) do
  print(k, v[1], v[2], v[3])
end

d = {1,2,3}
for _,k in pairs(d) do
	print(d[k])
end

var4 = "very large string"
var4 = nil	-- destroy variable

require("test2")   -- include file test2.lua

-- This is line comment

--[[

This is block comment

--]]

--[=[

This is block comment

--]=]

--[==[

This is block comment

--]==]

--[===[

This is block comment

--]===]

-- Callback function
function test ()
	print 'ok'
end

function func1 (callback)
	callback()
end

func1(test)

goto label1
::label1::

-- Semi-colons in Lua are generally only required when writing multiple statements on a line.
local a,b=1,2; print(a+b)


