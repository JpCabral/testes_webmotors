Encoding.default_external = Encoding::UTF_8
Encoding.default_internal = Encoding::UTF_8

require 'watir'
require 'rest-client'
require 'json'

@args = ['--disable-notifications', '--disable-infobars', '--no-sandbox', '--log-level=3']
Watir.default_timeout = 15