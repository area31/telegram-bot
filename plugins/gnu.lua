
local function run(msg, matches)
  local text = matches[1]
  local b = 1

  while b ~= 0 do
    text = text:trim()
    text,b = text:gsub('^!+','')
  end
  return "GNU é o caralho! Dá man init pra ver se tem gnu"
end

return {
  description = "Simplest plugin ever!",
  patterns = {
		"%A[Gg][Nn][Uu]%A+",
		"%A[Gg][Nn][Uu]$",
		"^[Gg][Nn][Uu]%A+",
		"^[Gg][Nn][Uu]$",
		},
  run = run 
}
