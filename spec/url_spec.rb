require_relative '../lib/selenium-prep/urls'
require 'rest-client'

describe 'Selenium URLs are valid -> ', :acceptance do

  def request(url)
    RestClient.head url
  end

  it 'Browser Drivers' do
    urls = []
    SeleniumPrep::URLs::DRIVERS.each { |os_type, url| urls << url }
    urls.flatten.each do |url|
      response = request url
      expect(response.code).to eql 200
      expect(response.headers[:content_type]).to include('zip')
    end
  end

  it 'Standalone Server' do
    response = request SeleniumPrep::URLs::SERVER
    expect(response.code).to eql 200
    expect(response.headers[:content_type]).to eql('application/java-archive')
  end

end
