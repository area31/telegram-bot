
local function run(msg, matches)
  local text = matches[1]
  local b = 1

  while b ~= 0 do
    text = text:trim()
    text,b = text:gsub('^!+','')
  end
  return "https://www.youtube.com/watch?v=iqPzlv1K7lo"
end

return {
  description = "Simplest plugin ever!",
  patterns = { "^(.*)[Ee][Uu] [Qq][Uu][Ee][Rr][Oo] [Gg][Oo][Zz][Aa][Rr](.*)$" },
  run = run 
}
