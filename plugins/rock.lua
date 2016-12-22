local rocks_file = './data/rocks.lua'
local rocks_table

function read_rocks_file()
    local f = io.open(rocks_file, "r+")

    if f == nil then
        print ('Created a new rocks file on '..rocks_file)
        serialize_to_file({}, rocks_file)
    else
        print ('rock loaded: '..rocks_file)
        f:close()
    end
    return loadfile (rocks_file)()
end

function save_rock(msg)
    local to_id = tostring(msg.to.id)

    if msg.text:sub(11):isempty() then
        return "Usage: !addrock rock"
    end

    if rocks_table == nil then
        rocks_table = {}
    end

    if rocks_table[to_id] == nil then
        print ('New rock key to_id: '..to_id)
        rocks_table[to_id] = {}
    end

    local rocks = rocks_table[to_id]
    rocks[#rocks+1] = msg.text:sub(10)

    serialize_to_file(rocks_table, rocks_file)

    return "som de baile reive adicionado!"
end

function get_rock(msg)
    local to_id = tostring(msg.to.id)
    local rocks_phrases

    rocks_table = read_rocks_file()
    rocks_phrases = rocks_table[to_id]

    return rocks_phrases[math.random(1,#rocks_phrases)]
end

function run(msg, matches)
    if string.match(msg.text, "!rock$") then
        return get_rock(msg)
    elseif string.match(msg.text, "!addrock (.+)$") then
        rocks_table = read_rocks_file()
        return save_rock(msg)
    end
end

return {
    description = "Save rock",
    description = "Rock plugin, you can create and retrieve random rocks",
    usage = {
        "!addrock [url]",
        "!rock",
    },
    patterns = {
        "^!addrock (.+)$",
        "^!rock$",
    },
    run = run
}
