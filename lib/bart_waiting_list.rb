require 'mechanize'
require 'yaml'

HOME_URL = 'https://www.select-a-spot.com/bart/'
WAITING_LIST_URL = 'https://www.select-a-spot.com/bart/waiting_lists/'

class BartWaitingList

  attr_reader :page

  def initialize(email, password)
    @page = get_waiting_list_page email, password
  end

  def get_waiting_list_position(station)
    station_name = get_station_name station
    regexp = %r{position (?<position>\d+)[a-zA-Z<>/"= ]+at <span class="bold">#{station_name}<\/span>}
    match = @page.body.match regexp

    Integer match[:position] rescue nil
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
    agent.get WAITING_LIST_URL
  end

  def get_station_name(station)
    station_names = {}

    YAML.load_file('stations.yaml').each do |key, value|
      station_names[key.to_sym] = value
    end

    return station_names[station]
  end
end
