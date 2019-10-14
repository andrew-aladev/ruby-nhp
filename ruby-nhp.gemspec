# Ruby bindings for node HTTP parser.
# Copyright (c) 2019 AUTHORS, MIT License.

require "date"

require_relative "lib/nhp/version"

GEMSPEC = Gem::Specification.new do |gem|
  gem.name     = "ruby-nhp"
  gem.summary  = "Ruby bindings for node HTTP parser."
  gem.homepage = "https://github.com/andrew-aladev/ruby-nhp"
  gem.license  = "MIT"
  gem.authors  = File.read("AUTHORS").split("\n").reject(&:empty?)
  gem.email    = "aladjev.andrew@gmail.com"
  gem.version  = NHP::VERSION
  gem.date     = Date.today.to_s

  gem.add_development_dependency "minitest", "~> 5.12"
  gem.add_development_dependency "rake-compiler", "~> 1.0"
  gem.add_development_dependency "rubocop", "~> 0.75"
  gem.add_development_dependency "rubocop-performance", "~> 1.5"
  gem.add_development_dependency "rubocop-rails", "~> 2.3"

  gem.files = \
    `git ls-files -z --directory {ext,lib}`.split("\x0") + \
    %w[AUTHORS LICENSE README.md]
  gem.require_paths = %w[lib]
  gem.extensions    = %w[ext/extconf.rb]
end
