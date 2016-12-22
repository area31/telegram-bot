local goatrances_file = './data/goatrances.lua'
local goatrances_table

function read_goatrances_file()
    local f = io.open(goatrances_file, "r+")

    if f == nil then
        print ('Created a new goatrances file on '..goatrances_file)
        serialize_to_file({}, goatrances_file)
    else
        print ('goatrance loaded: '..goatrances_file)
        f:close()
    end
    return loadfile (goatrances_file)()
end

function save_goatrance(msg)
    local to_id = tostring(msg.to.id)

    if msg.text:sub(11):isempty() then
        return "Usage: !addgoatrance goatrance"
    end

    if goatrances_table == nil then
        goatrances_table = {}
    end

    if goatrances_table[to_id] == nil then
        print ('New goatrance key to_id: '..to_id)
        goatrances_table[to_id] = {}
    end

    local goatrances = goatrances_table[to_id]
    goatrances[#goatrances+1] = msg.text:sub(15)

    serialize_to_file(goatrances_table, goatrances_file)

    return "som de baile reive adicionado!"
end

function get_goatrance(msg)
    local to_id = tostring(msg.to.id)
    local goatrances_phrases

    goatrances_table = read_goatrances_file()
    goatrances_phrases = goatrances_table[to_id]

    return goatrances_phrases[math.random(1,#goatrances_phrases)]
end

function run(msg, matches)
    if string.match(msg.text, "!goatrance$") then
        return get_goatrance(msg)
    elseif string.match(msg.text, "!addgoatrance (.+)$") then
        goatrances_table = read_goatrances_file()
        return save_goatrance(msg)
    end
end

return {
    description = "Save goatrance",
    description = "Goatrance plugin, you can create and retrieve random goatrances",
    usage = {
        "!addgoatrance [url]",
        "!goatrance",
    },
    patterns = {
        "^!addgoatrance (.+)$",
        "^!goatrance$",
    },
    run = run
}
