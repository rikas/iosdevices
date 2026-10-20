# frozen_string_literal: true

require_relative 'lib/ios/devices/version'

Gem::Specification.new do |spec|
  spec.name          = 'ios-devices'
  spec.version       = Ios::Devices::VERSION
  spec.authors       = ['Ricardo Otero']
  spec.email         = ['oterosantos@gmail.com']
  spec.summary       = 'iOS device model translation from Apple device types.'
  spec.description   = 'With this gem you can read the device type that every iOS device can send
    and translate it to a proper model name.'
  spec.homepage      = 'https://github.com/rikas/iosdevices'
  spec.license       = 'MIT'

  spec.required_ruby_version = '>= 3.1'

  spec.metadata = {
    'source_code_uri' => spec.homepage,
    'changelog_uri' => "#{spec.homepage}/blob/main/CHANGELOG.md",
    'bug_tracker_uri' => "#{spec.homepage}/issues"
  }

  spec.files         = Dir['lib/**/*.rb', 'README.md', 'LICENSE.txt', 'CHANGELOG.md']
  spec.require_paths = ['lib']
end
