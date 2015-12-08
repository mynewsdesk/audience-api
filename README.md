# Audience::Api

MND-Audience API client

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'audience-api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install audience-api

## Usage

```
# Default config
Audience::Api.configure do |config|
  config.adapter = Faraday.default_adapter
  config.connection_options = {}
  config.endpoint = "http://mnd-audience.herokuapp.com"
end

# Get single resource
pp Audience::Api.list(25)

# Auto paginate through collection
Audience::Api.auto_paginate :list_contacts, 2 do |batch|
  puts batch
end
```

### Lists API
    # get the list by given id
    Audience::Api.list(25)

    # all lists for country
    Audience::Api.country_lists("de")

### Contacts API
    # get the contact by given id
    Audience::Api.contact(25)

    # all contacts for given list_id
    Audience::Api.list_contacts(19)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/audience-api.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

