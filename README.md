# B-cycle (Ruby)

A very simple Ruby library for accessing the B-Cycle API; a work in progress.

## Installation

Add this line to your application's Gemfile:

    gem 'bcycle', :git => 'git://github.com/bshelton229/bcycle-ruby.git'

## Usage

**Load All Kiosks**

    Bcycle.kiosks
    => [#<Bcycle::Kiosk:0x007f981c012a78 @id=1645, @name="250 Columbine ", @status="Active"...

**To filter kiosks, just use ruby Array's select (The api can't access indidivual records)**

    Bcycle.kiosks.select { |kiosk| kiosk.state == 'WI' and  kiosk.city == 'Madison' and kiosk.active? }

**You can find a particular kiosk**

    Bcycle.find 1874
    => #<Bcycle::Kiosk:0x007f981b1760c8 @id=1874, @name="Wisconsin & E. Mifflin", @status="Active"......

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
