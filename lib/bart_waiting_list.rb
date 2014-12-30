require 'mechanize'

HOME_URL = 'https://www.select-a-spot.com/bart/'
WAITING_LIST_URL = 'https://www.select-a-spot.com/bart/waiting_lists/'

class BartWaitingList

  attr_reader :page

  def initialize(email, password)
    @page = get_waiting_list_page(email, password)
  end

  def get_waiting_list_position(station)
    station_name = get_station_name station

    /currently at <span class="bold">position (\d+)<\/span> on the waiting list for <span class="bold">Monthly Reserved<\/span> at <span class="bold">#{station_name}<\/span>/.match @page

    if $1.nil?
      $1
    else
      $1.to_i
    end
  end

  private
  def get_waiting_list_page(email, password)
    # mechanize agent
    # http://stackoverflow.com/questions/6918277/ruby-mechanize-web-scraper-library-returns-file-instead-of-page
    agent = Mechanize.new do |a|
      a.post_connect_hooks << lambda do |_,_,response,_|
        if response.content_type.nil? || response.content_type.empty?
          response.content_type = 'text/html'
        end
      end
    end

    # fetch the home page
    page = agent.get HOME_URL

    # get the login form
    form = page.form

    # submit login form
    form.username email
    form.password password
    form.submit

    # now that we're logged in, return the waiting list page
    agent.get(WAITING_LIST_URL).body
  end

  def get_station_name(station)
    {
      :ashby => 'Ashby Station',
      :bay_fair => 'Bay Fair Station',
      :castro_valley => 'Castro Valley Station',
      :coliseum_oakland_airport => 'Coliseum/Oakland Airport Station',
      :colma => 'Colma Station',
      :concord => 'Concord Station',
      :daly_city => 'Daly City Station',
      :dublin_pleasanton => 'Dublin/Pleasanton Station',
      :el_cerrito_del_norte => 'El Cerrito del Norte Station',
      :el_cerrito_plaza => 'El Cerrito Plaza Station',
      :fremont => 'Fremont Station',
      :fruitvale => 'Fruitvale Station',
      :hayward => 'Hayward Station',
      :lafayette => 'Lafayette Station',
      :lake_merritt => 'Lake Merritt Station',
      :macarthur => 'MacArthur Station',
      :millbrae => 'Millbrae Station',
      :north_berkeley => 'North Berkeley Station',
      :north_concord_martinez => 'North Concord/Martinez Station',
      :orinda => 'Orinda Station',
      :pittsburg_bay_point => 'Pittsburg/Bay Point Station',
      :pleasant_hill_contra_costa_centre => 'Pleasant Hill/Contra Costa Centre Station',
      :richmond => 'Richmond Station',
      :rockridge => 'Rockridge Station',
      :san_bruno => 'San Bruno Station',
      :san_leandro => 'San Leandro Station',
      :south_hayward => 'South Hayward Station',
      :south_san_francisco => 'South San Francisco Station',
      :union_city => 'Union City Station',
      :walnut_creek => 'Walnut Creek Station',
      :west_dublin_dublin => 'West Dublin Station - Dublin',
      :west_dublin_pleasanton => 'West Dublin Station - Pleasanton'
    }[station]
  end
end
