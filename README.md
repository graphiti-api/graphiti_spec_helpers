# GraphitiSpecHelpers

> ### This gem is retired
>
> `graphiti_spec_helpers` is part of [graphiti](https://github.com/graphiti-api/graphiti) itself as of graphiti 2.0, and is no longer developed here. Issues and pull requests live in the [graphiti repo](https://github.com/graphiti-api/graphiti/issues).
>
> To upgrade from Graphiti 1.x to 2.x, follow the [upgrade guide](https://graphiti.dev/upgrading).


![Build Status](https://travis-ci.org/graphiti-api/graphiti_spec_helpers.svg?branch=master)
[![Gem Version](https://badge.fury.io/rb/graphiti_spec_helpers.svg)](https://badge.fury.io/rb/graphiti_spec_helpers)

Spec helpers for [Graphiti](https://github.com/graphiti-api/graphiti)
APIs.

# Installation
Note: this assumes you have [rspec-rails](https://github.com/rspec/rspec-rails) installed & configured already.

`Gemfile`
```ruby
group :development, :test do
  # ...
  gem 'graphiti_spec_helpers', '~> 1.1'
  # ...
end
```

`spec/rails_helper.rb`
```ruby
# ...
# Add additional requires below this line. Rails is not loaded until this point!
require 'graphiti_spec_helpers/rspec'
# ...

RSpec.configure do |config|
  # ...
  config.include GraphitiSpecHelpers::RSpec
  config.include GraphitiSpecHelpers::Sugar
  config.include Graphiti::Rails::TestHelpers
  # ...
```

Then in your project directory
```sh
$ bundle install
```
