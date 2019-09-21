[![Code Climate](https://codeclimate.com/github/ammit/trackplus-ruby/badges/gpa.svg)](https://codeclimate.com/github/ammit/trackplus-ruby)
[![Build Status](https://travis-ci.org/ammit/trackplus-ruby.svg?branch=master)](https://travis-ci.org/ammit/trackplus-ruby)

# trackplus-ruby

Dead-simple Ruby API client for Trackplus. No extra runtime dependencies.

Uses v1 API provided by Trackplus.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'trackplus', git: 'https://github.com/ammit/trackplus-ruby'
```

And then execute:
```
$ bundle
```

## Usage

Gem covers all traclings & available couriers api 

#### Example

``` ruby
client = Trackplus::Client.new(api_key: 'api_key')

# get supported couriers
client.couriers

# get tracking
client.tracking(courier: 'airwings', tracking_no: '202315836553')


# Possible errors (each one inherits from Trackplus::Errors::TrackplusError)
Trackplus::Errors::InvalidConfiguration # missing api_key / subdomain
Trackplus::Errors::NotAuthorized   # wrong api key
Trackplus::Errors::InvalidResponse # something went wrong during the request?
Trackplus::Errors::NotFound        # 404 from Trackplus
Trackplus::Errors::RequestToLong   # When the requested result takes to long to calculate, try limiting your query
```

## Contributing
1. Fork it ( https://github.com/ammit/trackplus-ruby/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request