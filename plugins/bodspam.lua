
local function run(msg, matches)
  local text = matches[1]
  local b = 1

  while b ~= 0 do
    text = text:trim()
    text,b = text:gsub('^!+','')
  end
  return "https://www.youtube.com/watch?v=YqXYHe3ev20"
end

return {
  description = "Simplest plugin ever!",
  patterns = {
    "^!bodspam"
  }, 
  run = run 
}
