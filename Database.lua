local file = fs.open("disk/database.db", "a")
local names = { "one", "two", "three" }
for i = 1, #names, 1 do
    file.write("\n"..names[i])
end
file.close()

local readingLines = fs.open("disk/database.db", "r")
local lines = {}

while true do
  local line = readingLines.readLine()

  if not line then
    break
  end

  lines[#lines + 1] = line
end

readingLines.close()
