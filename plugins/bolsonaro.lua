
local function run(msg, matches)
  local text = matches[1]
  local b = 1

  while b ~= 0 do
    text = text:trim()
    text,b = text:gsub('^!+','')
  end
  return "BolsoMITO! Pois o Bolsonaro é um MITO! Só ele pra comer cu de esquerdistas"
end

return {
  description = "Simplest plugin ever!",
  patterns = {
    "^!bolsonaro"
  }, 
  run = run 
}
