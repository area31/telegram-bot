local zueras_file = './data/zueras.lua'
local zueras_table

function read_zueras_file()
    local f = io.open(zueras_file, "r+")

    if f == nil then
        print ('Created a new zueras file on '..zueras_file)
        serialize_to_file({}, zueras_file)
    else
        print ('Zuera loaded: '..zueras_file)
        f:close()
    end
    return loadfile (zueras_file)()
end

function save_zuera(msg)
    local to_id = tostring(msg.to.id)

    if msg.text:sub(11):isempty() then
        return "Usage: !addzuera zuera"
    end

    if zueras_table == nil then
        zueras_table = {}
    end

    if zueras_table[to_id] == nil then
        print ('New zuera key to_id: '..to_id)
        zueras_table[to_id] = {}
    end

    local zueras = zueras_table[to_id]
    zueras[#zueras+1] = msg.text:sub(11)

    serialize_to_file(zueras_table, zueras_file)

    return "Zuera adicionada! Seu zuero!!!"
end

function get_zuera(msg)
    local to_id = tostring(msg.to.id)
    local zueras_phrases

    zueras_table = read_zueras_file()
    zueras_phrases = zueras_table[to_id]

    return zueras_phrases[math.random(1,#zueras_phrases)]
end

function run(msg, matches)
    if string.match(msg.text, "!zuera$") then
        return get_zuera(msg)
    elseif string.match(msg.text, "!addzuera (.+)$") then
        zueras_table = read_zueras_file()
        return save_zuera(msg)
    end
end

return {
    description = "Save zuera",
    description = "Zuera plugin, you can create and retrieve random zueraes",
    usage = {
        "!addzuera [URL]",
        "!zuera",
    },
    patterns = {
        "^!addzuera (.+)$",
        "^!zuera$",
    },
    run = run
}
