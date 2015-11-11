
local function run(msg, matches)
  local text = matches[1]
  local b = 1

  while b ~= 0 do
    text = text:trim()
    text,b = text:gsub('^!+','')
  end
  return "Use sempre 'uname -snrvmpi' pois se vc usar 'uname -a' irá aparecer gnu, e GNU é o caralho! Dá man init pra ver se tem gnu"
end

return {
  description = "Simplest plugin ever!",
  patterns = {
    "^!uname"
  }, 
  run = run 
}
