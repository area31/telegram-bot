
local function run(msg, matches)
  local text = matches[1]
  local b = 1

  while b ~= 0 do
    text = text:trim()
    text,b = text:gsub('^!+','')
  end
  return "valeu barba!"
end

return {
  description = "Simplest plugin ever!",
  patterns = { "^(.*)[Bb][Oo][Aa] [Cc][Aa][Bb][Ee][Ll][Oo](.*)$" },
  run = run 
}
