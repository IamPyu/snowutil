-- snowutil
-- a set of orm64 lua repl functions

local M = {}

function M.writeToFile(filename, contents)
  local file = io.open(filename, "w")

  if file == nil then
    print("Error opening file")
    return
  end

  file:write(contents)
  file:flush()
  file:close()
end

function M.appendToFile(filename, contents)
  local file = io.open(filename, "a")

  if file == nil then
    print("Error opening file")
    return
  end

  file:write(contents)
  file:flush()
  file:close()
end

function M.getFileContents(filename)
  local file = io.open(filename, "r")

  if file == nil then
    return nil
  end

  return file:read("a")
end

function M.map(list, fn)
  for k, v in pairs(list) do
    list[k] = fn(v)
  end
end

function M.foreach(list, fn)
  for k, v in pairs(list) do
    fn({k, v})
  end
end

return M
