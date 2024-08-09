fx_version 'cerulean'
games { 'gta5' }

author 'Taala'
description 'Shops'
version '1.0.0'

lua54 'yes'

shared_scripts {'@ox_lib/init.lua', 'config.lua'}

client_scripts {
    'c_*.lua',

}
server_scripts {
    's_*.lua',
    '@oxmysql/lib/MySQL.lua',
}

