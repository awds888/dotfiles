#!/opt/homebrew/bin/lua
print("Hello") -- 这是行注释
--[[
这是块注释
跟C语言的/*   */类似
--]]
num = 1024
num = 3.1415926535897932384626
num = 314.16e-2
num = 0.31416E1
num = 0xff
str = 'abc\n123"'
str = "abc\n123\""
str =[[abc
123]]
theGlobalVar = 10
local theLocalvar = 'Jordan'

sum = 0
i = 1
while i <= 10 do
  sum = sum + i
  i = i + 1
end
print("sum = ",sum)

sex = "male"
age = 40

if age == 40 and sex == "male" then
  print("男人四十一枝花o")
elseif age > 60 and sex ~= "female" then
  print("old man")
elseif age < 20 then
  io.write("too young, too naive!\n")
else
  local age = io.read()
  print("Your age is :"..age)
end

sum = 0
for i = 1,100 do
  sum=sum +i  
end
print(sum)

sum = 0
for i = 1, 10, 2 do
  sum = sum + i  
end
print(sum)

for i = 100, 1, -2 do
  sum = sum + i
end
print(sum)

sum = 2
repeat
  sum = sum^2 --幂操作
  print(sum)
until sum > 50000 

function fibsum(n)
  if n<2 then return 1 end
  return fibsum(n-2)+fibsum(n-1)
end
