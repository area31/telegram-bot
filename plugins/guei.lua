local gueis_file = './data/gueis.lua'
local gueis_table

function read_gueis_file()
    local f = io.open(gueis_file, "r+")

    if f == nil then
        print ('Created a new gueis file on '..gueis_file)
        serialize_to_file({}, gueis_file)
    else
        print ('GNUs loaded: '..gueis_file)
        f:close()
    end
    return loadfile (gueis_file)()
end

function save_guei(msg)
    local to_id = tostring(msg.to.id)

    if msg.text:sub(11):isempty() then
        return "Usage: !addguei guei"
    end

    if gueis_table == nil then
        gueis_table = {}
    end

    if gueis_table[to_id] == nil then
        print ('New guei key to_id: '..to_id)
        gueis_table[to_id] = {}
    end

    local gueis = gueis_table[to_id]
    gueis[#gueis+1] = msg.text:sub(11)

    serialize_to_file(gueis_table, gueis_file)

    return "done!"
end

function get_guei(msg)
    local to_id = tostring(msg.to.id)
    local gueis_phrases

    gueis_table = read_gueis_file()
    gueis_phrases = gueis_table[to_id]

    return gueis_phrases[math.random(1,#gueis_phrases)]
end

function run(msg, matches)
    if string.match(msg.text, "!guei$") then
        return get_guei(msg)
    elseif string.match(msg.text, "!addguei (.+)$") then
        gueis_table = read_gueis_file()
        return save_guei(msg)
    end
end

return {
    description = "Save guei",
    description = "GNU plugin, you can create and retrieve random gueis",
    usage = {
        "!addguei [msg]",
        "!guei",
    },
    patterns = {
--        "^!addguei (.+)$",
        "^!guei$",
    },
    run = run
}
