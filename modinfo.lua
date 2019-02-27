name = "Client Mods"
description = ":)"
author = "bakaschwarz"
version = "1.0"

forumthread = ""

api_version = 10
dst_compatible = true

client_only_mod = true
all_clients_require_mod = false

local keylist = {}
local string = ""
for i = 1, 26 do
    local key = 96 + i
    keylist[i] = {description = string.char(key), data = key}
end

configuration_options = {
	{
		name = "ATTACK",
		label = "Attack toggle",
		hover = "Key to toggle attack of shadow creatures",
		options = keylist,
		default = 120,
	},
}


server_filter_tags = {"baka"}