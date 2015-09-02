local mulhers_file = './data/mulhers.lua'
local mulhers_table

function read_mulhers_file()
    local f = io.open(mulhers_file, "r+")

    if f == nil then
        print ('Created a new mulhers file on '..mulhers_file)
        serialize_to_file({}, mulhers_file)
    else
        print ('Mulher loaded: '..mulhers_file)
        f:close()
    end
    return loadfile (mulhers_file)()
end

function save_mulher(msg)
    local to_id = tostring(msg.to.id)

    if msg.text:sub(11):isempty() then
        return "Usage: !addmulher mulher"
    end

    if mulhers_table == nil then
        mulhers_table = {}
    end

    if mulhers_table[to_id] == nil then
        print ('New mulher key to_id: '..to_id)
        mulhers_table[to_id] = {}
    end

    local mulhers = mulhers_table[to_id]
    mulhers[#mulhers+1] = msg.text:sub(11)

    serialize_to_file(mulhers_table, mulhers_file)

    return "Gostosa adicionada!"
end

function get_mulher(msg)
    local to_id = tostring(msg.to.id)
    local mulhers_phrases

    mulhers_table = read_mulhers_file()
    mulhers_phrases = mulhers_table[to_id]

    return mulhers_phrases[math.random(1,#mulhers_phrases)]
end

function run(msg, matches)
    if string.match(msg.text, "!mulher$") then
        return get_mulher(msg)
    elseif string.match(msg.text, "!addmulher (.+)$") then
        mulhers_table = read_mulhers_file()
        return save_mulher(msg)
    end
end

return {
    description = "Save mulher",
    description = "Mulher plugin, you can create and retrieve random mulheres",
    usage = {
        "!addmulher [URL]",
        "!mulher",
    },
    patterns = {
        "^!addmulher (.+)$",
        "^!mulher$",
    },
    run = run
}
