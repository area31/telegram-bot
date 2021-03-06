do

local BASE_URL = "http://api.openweathermap.org/data/2.5/weather"

local function get_weather(location)
  print("Finding weather in ", location)
  local url = BASE_URL
  url = url..'?q='..location
  url = url..'&units=metric&APPID=a3504af669dadfa76cb94b10a61e6059'

  local b, c, h = http.request(url)
  if c ~= 200 then return nil end

  local weather = json:decode(b)
  local city = weather.name
  local humidity = weather.humidity
  local country = weather.sys.country
  local temp = 'A temperatura atual em '..city
    ..' (' ..country..')'
    ..' é de '..weather.main.temp..'°C'
    .. ' e ' ..weather.main.humidity.. '% de umidade relativa do ar.'
  local conditions = 'Condição atual do tempo: '
    .. weather.weather[1].description
  
  if weather.weather[1].main == 'Clear' then
    conditions = conditions .. ' ☀'
  elseif weather.weather[1].main == 'Clouds' then
    conditions = conditions .. ' ☁☁'
  elseif weather.weather[1].main == 'Rain' then
    conditions = conditions .. ' ☔'
  elseif weather.weather[1].main == 'Thunderstorm' then
    conditions = conditions .. ' ☔☔☔☔'
  end

  return temp .. '\n' .. conditions
end

local function run(msg, matches)
  local city = 'belohorizonte,br'

  if matches[1] ~= '!tempo' then 
    city = matches[1]
  end
  local text = get_weather(city)
  if not text then
    text = 'Deu merda pra buscar o tempo pra essa cidade. Faz alguma coisa direito porra! Busca assim: \"!tempo putaquepariu,br\" (sem aspas e sem espaços)'
  end
  return text
end

return {
  description = "weather in that city (Belo Horizonte-MG is default)", 
  usage = {
        "!weather [<city>,<country>]",
        "Ex: !tempo putaquepariu,br (sem espaços)",
	},
  patterns = {
    "^!tempo$",
    "^!tempo (.*)$"
  }, 
  run = run 
}

end
