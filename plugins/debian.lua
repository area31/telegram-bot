
local function run(msg, matches)
  local text = matches[1]
  local b = 1

  while b ~= 0 do
    text = text:trim()
    text,b = text:gsub('^!+','')
  end
  return "Debian, a distro de acadêmicos! Seu debiano bichonaaaaaaaaa ----->> DEB ❤ IAN <<-----"
end

return {
  description = "Simplest plugin ever!",
  patterns = { "^(.*)[Dd][Ee][Bb][Ii][Aa][Nn](.*)$" },
  run = run 
}
