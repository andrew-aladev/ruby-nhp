# Ruby bindings for node HTTP parser.
# Copyright (c) 2019 AUTHORS, MIT License.

require "mkmf"

def require_header(name, types = [])
  abort "Can't find #{name} header" unless find_header name

  types.each do |type|
    abort "Can't find #{type} type in #{name} header" unless find_type type, nil, name
  end
end

require_header "http_parser.h", %w[http_parser http_parser_settings]

def require_library(name, functions)
  functions.each do |function|
    abort "Can't find #{function} function in #{name} library" unless find_library name, function
  end
end

require_library(
  "http_parser",
  %w[
    http_parser_init
    http_parser_settings_init
    http_parser_execute
    http_should_keep_alive
  ]
)

extension_name = "nhp_ext".freeze
dir_config extension_name

# rubocop:disable Style/GlobalVars
$srcs = %w[
  main
]
.map { |name| "src/#{extension_name}/#{name}.c" }
.freeze

$CFLAGS << " -Wno-declaration-after-statement"
$VPATH << "$(srcdir)/#{extension_name}"
# rubocop:enable Style/GlobalVars

create_makefile extension_name
