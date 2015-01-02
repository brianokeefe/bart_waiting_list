# BartWaitingList
[![Gem Version](https://badge.fury.io/rb/bart_waiting_list.svg)](http://badge.fury.io/rb/bart_waiting_list)
[![Code Climate](https://codeclimate.com/github/brianokeefe/bart_waiting_list/badges/gpa.svg)](https://codeclimate.com/github/brianokeefe/bart_waiting_list)

Retrieves your BART parking waiting list position from select-a-spot.com

## Installation

Add this line to your application's Gemfile:

    gem 'bart_waiting_list'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bart_waiting_list

## Usage

    require 'bart_waiting_list'

    # log in with your select-a-spot.com username and password
    waiting_list = BartWaitingList.new 'email@example.com', 'my-password'

    # get your position for a station, a Fixnum
    position = waiting_list.get_waiting_list_position :fruitvale

### Available stations

    :ashby
    :bay_fair
    :castro_valley
    :coliseum_oakland_airport
    :colma
    :concord
    :daly_city
    :dublin_pleasanton
    :el_cerrito_del_norte
    :el_cerrito_plaza
    :fremont
    :fruitvale
    :hayward
    :lafayette
    :lake_merritt
    :macarthur
    :millbrae
    :north_berkeley
    :north_concord_martinez
    :orinda
    :pittsburg_bay_point
    :pleasant_hill_contra_costa_centre
    :richmond
    :rockridge
    :san_bruno
    :san_leandro
    :south_hayward
    :south_san_francisco
    :union_city
    :walnut_creek
    :west_dublin_dublin
    :west_dublin_pleasanton

## Contributing

1. Fork it ( https://github.com/brianokeefe/bart_waiting_list/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

