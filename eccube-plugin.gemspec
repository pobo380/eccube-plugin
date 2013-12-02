# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'eccube/plugin/version'

Gem::Specification.new do |spec|
  spec.name          = "eccube-plugin"
  spec.version       = Eccube::Plugin::VERSION
  spec.authors       = ["pobo380"]
  spec.email         = ["n3560k@gmail.com"]
  spec.description   = %q{A framework to development EC-CUBE plugin.}
  spec.summary       = spec.description
  spec.homepage      = "https://github.com/pobo380/eccube-plugin"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "thor"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
