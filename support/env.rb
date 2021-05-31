Encoding.default_external = Encoding::UTF_8
Encoding.default_internal = Encoding::UTF_8

require 'watir'
require 'json'
require 'rest-client'

@args = ['--log-level=3']
@path_screenshots = 'results/screenshots'

Watir.default_timeout = 60