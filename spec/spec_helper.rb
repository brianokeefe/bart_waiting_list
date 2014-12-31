require 'bart_waiting_list'
require 'webmock/rspec'

WebMock.disable_net_connect!

RSpec.configure do |config|
  config.before :each do
    stub_request(:get, 'https://www.select-a-spot.com/bart/').
      to_return :status => 200, :body => File.read('fixtures/mock_home_page.html')

    stub_request(:post, 'https://www.select-a-spot.com/bart/users/login/').
      to_return :status => 200, :body => 'it worked'

    stub_request(:get, 'https://www.select-a-spot.com/bart/waiting_lists/').
      to_return :status => 200, :body => File.read('fixtures/mock_waiting_list_page.html')
  end
end

