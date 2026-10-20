# Changelog

All notable changes to this project are documented in this file.

## Unreleased

### Breaking changes

Many `name` and `extra` values changed to follow one naming convention, based on Apple's official
product names (see "Naming" in the README). If you store or compare these values, check the changes
below.

- **Apple Watch:** the series, SE or Ultra is now part of `name`, e.g. `"Apple Watch Series 5"` /
  `"44mm, GPS+Cellular"` instead of `"Apple Watch"` / `"Series 5, 44mm, GPS+Cellular"`. Ultra models
  have no `extra`. The SE 2 is `"Apple Watch SE"` / `"2nd gen, …"`; the original watch is
  `"Apple Watch"` / `"1st gen, …"`.
- **Generations and chips move from `name` to `extra`:** iPad mini 5, 6 and 7 are now
  `"iPad mini"` with `"5th gen"`, `"6th gen"` and `"A17 Pro"`; iPad Air 3 and 4 are `"iPad Air"` with
  `"3rd gen"` and `"4th gen"`; the 7th-gen iPad is `"iPad"` instead of `"iPad 10.2\""`; the 11th-gen
  iPad is `"iPad"` / `"A16, …"`.
- **Cellular iPads say `Wi-Fi+Cellular`** instead of `Wi-Fi+LTE` or `3G`.
- **Missing or unclear extras are filled in:** cellular variants of the original iPad, iPad 2,
  iPad mini, iPad 3rd/4th gen and iPad mini 3 now have their connectivity and `GSM`/`CDMA`, and the
  China models (`iPad4,3`, `iPad4,6`, `iPad4,9`) say `China` instead of `Rev` or nothing. First-gen
  11" and 12.9" iPad Pros say `1st gen`, and the 1TB models say `1TB`.
- **Wording fixes:** `"iPhone 12 mini"` and `"iPhone 13 mini"` (was `Mini`), `4th gen`/`6th gen`
  (was `Gen`), and `Rev A` for revised models.
- **`Ios::Devices::Model` is immutable:** `device_type=`, `name=` and `extra=` are gone and models
  are frozen. `search` returns the same shared instance each time for a known device type.
- **`Ios::UNKNOWN_IOS_DEVICE` is deprecated** in favour of `Ios::Devices::UNKNOWN_IOS_DEVICE`. The old
  constant still works; Ruby warns about it when deprecation warnings are on (`-W:deprecated`).

### Added

- `Ios::Devices.all` lists every known device model, and `Ios::Devices.known?(device_type)` checks
  whether a device type is known.
- `Model#known?` and `Model#unknown?`.
- `Model#to_s` returns the full name, e.g. `"iPad mini (A17 Pro, Wi-Fi+Cellular)"`, and `Model#to_h`
  returns the attributes as a hash.
- Models with the same attributes are equal (`==`, `eql?`, `hash`).

### Other changes

- Add RuboCop (run by `bundle exec rake` and in CI).
- Test against Ruby 4.0 in CI.
- Move the device list out of a `case` statement into a frozen hash, with specs that check it for
  duplicates and malformed entries.

## 0.4.0 - 2026-10-20

- **Require Ruby 3.1 or later.** Ruby 2.6, 2.7 and 3.0 are end-of-life and no longer tested.
- Ship only the library files, README, LICENSE and CHANGELOG in the packaged gem.
- Add gem metadata (source code, changelog and bug tracker URIs).
- Move development dependencies to the Gemfile and drop the unused `pry` and `bundler` ones.
- Fix the example output in the `Ios::Devices.search` doc comment and remove the dead HockeyApp link.
- Broaden spec coverage (simulators, unknown and `nil` input, older iPhone, iPad, iPod and Watch models).
- Document how to add new devices in the README.
- Add iPhone 17e, iPhone 18 Pro and iPhone 18 Pro Max.
- Add iPad Air (M2, M3, M4), iPad 11th gen, iPad mini 7 and iPad Pro (M4, M5).
- Add Apple Watch Series 10, Ultra 3, SE 3 and Series 11.
- Remove a duplicate "Apple Watch SE 2, 40mm, GPS" entry.

## 0.3.5 - 2025-10-27

- Add iPhone 17, iPhone 17 Pro, iPhone 17 Pro Max and iPhone Air.

## 0.3.4 - 2025-02-09

- Add iPhone 16 models.

For older releases, see the [git tags](https://github.com/rikas/iosdevices/tags).
