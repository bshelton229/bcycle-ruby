# Bcycle (Ruby)

A very simple Ruby library for accessing the B-Cycle API; a work in progress.

## Installation

Add this line to your application's Gemfile:

    gem 'bcycle'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bcycle

## Usage

    require 'bcycle'

    # Return all Kiosks (The API can only return all kiosks)
    # This will return an Array of Bcycle::Kiosk objects
    Bcycle.kiosks
    => [#<Bcycle::Kiosk:0x007f9efbdde838 @name=".....

    # Filter the kiosks (TODO: Add filter methods to Bcycle::Api)
    Bcycle.kiosks.select { |kiosk| kiosk.state == 'WI' and kiosk.active? }

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
