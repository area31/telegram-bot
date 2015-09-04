
local function run(msg, matches)
  local text = matches[1]
  local b = 1

  while b ~= 0 do
    text = text:trim()
    text,b = text:gsub('^!+','')
  end
  return "chupa que é de uva"
end

return {
  description = "Simplest plugin ever!",
  patterns = {
    "^!chupa"
  }, 
  run = run 
}
