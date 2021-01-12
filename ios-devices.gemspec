# frozen_string_literal: true

lib = File.expand_path('../lib', __FILE__)

$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'ios/devices'

Gem::Specification.new do |spec|
  spec.name          = 'ios-devices'
  spec.version       = Ios::Devices::VERSION
  spec.authors       = ['Ricardo Otero']
  spec.email         = ['oterosantos@gmail.com']
  spec.summary       = %q{iOS device model translation from Apple device types.}
  spec.description   = %q{With this gem you can read the device type that every iOS device can send
    and translate it to a proper model name.}
  spec.homepage      = 'http://github.com/rikas/iosdevices'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.2.5'
  spec.add_development_dependency 'rake', '>= 12.3.3'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rspec'
end
