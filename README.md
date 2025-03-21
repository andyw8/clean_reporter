# clean_reporter

This gem is an opionated reporter for minitest with the intention of reducing the visual clutter.

By default minitest will show the test duration to 6 decimal places, along with statistics on the test run.

```
Finished in 0.005735s, 3836.0942 runs/s, 3836.0942 assertions/s.
```

While that information might be occasionally useful, usually we are just interestd to if the tests are passing or not.

clean_reporter reduces the above output to just:

```
Finished tests in 0.0s
```

(I have idea for improvements, but that's all for this initial release)

## Implementation Notes

For convenience this is built this on top of [minitest-reporters](https://github.com/minitest-reporters/minitest-reporters) but it should be possible to re-write it without that dependency.

## Installation

Add `clean_reporter` as a development dependency in your `Gemfile`.

Then in your `test_helper.rb` add:

```ruby
require "clean_reporter"
```

## Usage

Run your tests in the normal way.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/andyw8/clean_reporter.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
