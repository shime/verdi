# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'verdi/version'

Gem::Specification.new do |spec|
  spec.name          = "verdi"
  spec.version       = Verdi::VERSION
  spec.authors       = ["Hrvoje Šimić"]
  spec.email         = ["shime.ferovac@gmail.com"]
  spec.summary       = %q{Gives you a diff between two versions of gems.}
  spec.description   = %q{Gives you a diff between two versions of gems.}
  spec.homepage      = "https://github.com/shime/verdi"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "minitest-reporters"
  spec.add_development_dependency "pry"
end
