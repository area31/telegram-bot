
local function run(msg, matches)
  local text = matches[1]
  local b = 1

  while b ~= 0 do
    text = text:trim()
    text,b = text:gsub('^!+','')
  end
  return "Você programa em java usando EMACS seu filho da puta!"
end

return {
  description = "Simplest plugin ever!",
  patterns = { "^(.*)[Ee][Mm][Aa][Cc][Ss](.*)$" },
  run = run 
}
