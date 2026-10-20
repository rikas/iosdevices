# Changelog

All notable changes to this project are documented in this file.

## 0.4.0 - Unreleased

- **Require Ruby 3.1 or later.** Ruby 2.6, 2.7 and 3.0 are end-of-life and no longer tested.
- Ship only the library files, README, LICENSE and CHANGELOG in the packaged gem.
- Add gem metadata (source code, changelog and bug tracker URIs).
- Move development dependencies to the Gemfile and drop the unused `pry` and `bundler` ones.
- Fix the example output in the `Ios::Devices.search` doc comment and remove the dead HockeyApp link.
- Broaden spec coverage (simulators, unknown and `nil` input, older iPhone, iPad, iPod and Watch models).
- Document how to add new devices in the README.
- Add iPhone 17e, iPhone 18 Pro, iPhone 18 Pro Max and iPhone Duo.
- Add iPad Air (M2, M3, M4), iPad 11th gen, iPad mini 7 and iPad Pro (M4, M5).
- Add Apple Watch Series 10, Ultra 3, SE 3 and Series 11.
- Remove a duplicate "Apple Watch SE 2, 40mm, GPS" entry.

## 0.3.5 - 2025-10-22

- Add iPhone 17, iPhone 17 Pro, iPhone 17 Pro Max and iPhone Air.

## 0.3.4 - 2025-02-09

- Add iPhone 16 models.

For older releases, see the [git tags](https://github.com/rikas/iosdevices/tags).
