fx_version 'cerulean'
game 'gta5'

author 'QBCore License System'
description 'Driving License Enforcement System for QBCore'
version '1.0.0'

shared_scripts {
    '@qb-core/shared/locale.lua',
    'locales/en.lua',
    'config.lua'
}

client_scripts {
    'client/main.lua'
}

server_scripts {
    'server/main.lua'
}

dependencies {
    'qb-core'
}

lua54 'yes'
