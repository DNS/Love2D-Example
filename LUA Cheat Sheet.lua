

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
^	exponent (power & root)
and
or
not
..	concatenation, eg: "Hello " .. "World" .. 12345
#	return the length of string or table, eg: #"Hello" will return 5

math.abs(-15)	-- return 15 (absolute number)
math.pi			-- return PI constant number = 3.1415926535898
math.exp(1)		-- return e^1 = 2.718281828459
math.floor(4.66)	-- returns 4.66 rounded down to 4
math.ceil(4.66)	-- returns 4.66 rounded up to 5
math.sin()

radians = degrees * math.pi / 180	-- To convert degrees to radians

print(123)		-- print with newline
print("abc")	-- print with newline
io.write(123)	-- print without newline

io.write("abc") 	-- write to STDOUT without newline
var1 = io.read() 	-- read STDIN, newline terminated
io.flush()			-- flush IO

-- file operation
file1 = io.open("dummy.txt", "r")	-- [rwa][+]  ; [+] is update mode 
str = file1:read("a")
file1:close()
print(str)
--[[
io.open(file, ...)
•"r":  read mode (the default);
•"w":  write mode;
•"a":  append mode;
•"r+":  update mode, all previous data is preserved;
•"w+":  update mode, all previous data is erased;
•"a+":  append update mode, previous data is preserved, writing is only allowed at the end of file.

file:read(...)
"n":  reads a numeral and returns it as a float or an integer, following the lexical conventions of Lua. (The numeral may have leading spaces and a sign.) This format always reads the longest input sequence that is a valid prefix for a numeral; if that prefix does not form a valid numeral (e.g., an empty string, "0x", or "3.4e-"), it is discarded and the function returns nil. 
•"a":  reads the whole file, starting at the current position. On end of file, it returns the empty string. 
•"l":  reads the next line skipping the end of line, returning nil on end of file. This is the default format. 
•"L":  reads the next line keeping the end-of-line character (if present), returning nil on end of file. 
•number:  reads a string with up to this number of bytes, returning nil on end of file. If number is zero, it reads nothing and returns an empty string, or nil on end of file. 

]]




local var5 = 123	-- local variable
var6 = 456			-- global  variable, automatically destroyed if out of function scope

var0 = nil
var1 = "ok"
var2 = 555
var3 = "hello" .. 123	-- concatenation

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
for i=1, 3 do
  print (names[i])
end

names = {'John', 'Joe', 'Steve'}
for i=1, 3 do print( names[i] ) end

-- iterate array
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

-- iterate key-value
for k, v in pairs(arr) do
  print(k, v[1], v[2], v[3])
end

-- iterate array
d = {1,2,3}
for _,k in pairs(d) do
	print(d[k])
end

var4 = "very large string"
var4 = nil	-- destroy variable (call garbage collector to free memory)

require("test2")   -- include file test2.lua


-- Lua processes and executes files line by line so the order you define them and use them can be important.
function test1 ()
	print ("OK")
end

test1()

test2 = function ()
	print ("OK")
end

test2()


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

----------------------------------------
-- Trigonometry

-- hardware error
math.pi				-- return pi
math.sin(math.pi)	-- should return 0, but return 1.2246467991474e-016 (must be rounded)

-- radian & degree conversion
r = math.deg(x)
r = math.rad(x)

--------------------------------------------
-- Random

math.randomseed(os.time())
value = math.random(1, 100)		-- return random number between 1-100
print(value)




