require_relative '../lib/selenium-prep/urls'
require 'typhoeus'

describe 'Selenium URLs are valid -> ' do

  def request(url)
    Typhoeus.head url
  end

  it 'Browser Drivers' do
    urls = []
    SeleniumPrep::URLs::DRIVERS.each { |os_type, url| urls << url }
    urls.flatten.each do |url|
      response = request url
      expect(response.code).to eql 200
      expect(response.headers['Content-Type']).to include('zip')
    end
  end

  it 'Standalone Server' do
    url = SeleniumPrep::URLs::SERVER
    response = request url
    expect(response.code).to eql 200
    expect(response.headers['Content-Type']).to eql('application/java-archive')
  end
end
