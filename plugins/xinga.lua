local xingas_file = './data/xingas.lua'
local xingas_table

function read_xingas_file()
    local f = io.open(xingas_file, "r+")

    if f == nil then
        print ('Created a new xingas file on '..xingas_file)
        serialize_to_file({}, xingas_file)
    else
        print ('Xingamentos loaded: '..xingas_file)
        f:close()
    end
    return loadfile (xingas_file)()
end

function save_xinga(msg)
    local to_id = tostring(msg.to.id)

    if msg.text:sub(11):isempty() then
        return "Usage: !addxinga xinga"
    end

    if xingas_table == nil then
        xingas_table = {}
    end

    if xingas_table[to_id] == nil then
        print ('New xinga key to_id: '..to_id)
        xingas_table[to_id] = {}
    end

    local xingas = xingas_table[to_id]
    xingas[#xingas+1] = msg.text:sub(11)

    serialize_to_file(xingas_table, xingas_file)

    return "Xingamento adicionado, seu zuero!!!"
end

function get_xinga(msg)
    local to_id = tostring(msg.to.id)
    local xingas_phrases

    xingas_table = read_xingas_file()
    xingas_phrases = xingas_table[to_id]

    return xingas_phrases[math.random(1,#xingas_phrases)]
end

function run(msg, matches)
    if string.match(msg.text, "!xinga(.*)$") then
        return get_xinga(msg)
    elseif string.match(msg.text, "!addxinga (.+)$") then
        xingas_table = read_xingas_file()
        return save_xinga(msg)
    end
end

return {
    description = "Save xinga",
    description = "Xinga plugin, you can create and retrieve random xingas",
    usage = {
        "!addxinga [msg]",
        "!xinga",
    },
    patterns = {
        "^!addxinga (.+)$",
        "^!xinga(.*)$",
    },
    run = run
}
