# -*- encoding: utf-8 -*-
require File.expand_path('../lib/fanfeedr/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Chip Castle"]
  gem.email         = ["chip@chipcastle.com"]
  gem.description   = %q{Ruby wrapper for the FanFeedr API}
  gem.summary       = %q{Ruby wrapper for the FanFeedr API}
  gem.homepage      = "https://github.com/chip/fandeedr"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "fanfeedr"
  gem.require_paths = ["lib"]
  gem.version       = Fanfeedr::VERSION

  gem.add_development_dependency "rspec"
end
