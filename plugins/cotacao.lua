do

local BASE_URL = "http://developers.agenciaideias.com.br/cotacoes/json"

local function get_indice(cotacao)
  print("Finding indice in ", cotacao)
  local url = BASE_URL
  url = url..''

  local b, c, h = http.request(url)
  if c ~= 200 then return nil end

  local indice = json:decode(b)
  local euro = indice.euro
  local atualizacao = indice.atualizacao
  local dolar = indice.sys.dolar
  local bovespa = 'bovespa: '..moeda
    ..' (' ..country..')'
		..' é de '..indice.main.dolar..'US$'
    .. ' e ' ..indice.main.euro.. 'EUR'
  local conditions = 'Cotação atual: '
    .. indice.indice[1].description
  
  if indice.indice[1].main == 'Clear' then
    conditions = conditions .. ' ☀'
  elseif indice.indice[1].main == 'Clouds' then
    conditions = conditions .. ' ☁☁'
  elseif indice.indice[1].main == 'Rain' then
    conditions = conditions .. ' ☔'
  elseif indice.indice[1].main == 'Thunderstorm' then
    conditions = conditions .. ' ☔☔☔☔'
  end

  return temp .. '\n' .. conditions
end

local function run(msg, matches)
  local moeda = 'dolar'

  if matches[1] ~= '!cotacao' then 
    moeda = matches[1]
  end
  local text = get_indice(moeda)
  if not text then
    text = 'Deu merda pra buscar a cotação. Tente: !cotacao dolar ou !cotacao euro
  end
  return text
end

return {
  description = "cotação do dolar, euro e bovespa", 
  usage = {
        "!cotacao [<moeda>]",
        "Ex: !cotacao putaquepariu (sem espaços)",
	},
  patterns = {
    "^!cotacao$",
    "^!cotacao (.*)$"
  }, 
  run = run 
}

end
