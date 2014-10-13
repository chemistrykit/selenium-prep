require_relative 'spec_helper'
require_relative '../lib/selenium-prep'

describe 'Selenium Prep' do

  it 'downloads' do
    ENV['SE_OS_TYPE'] = 'mac32'
    loc = ENV['SE_DOWNLOAD_LOCATION'] = File.join(Dir.pwd, 'spec/tmp/selenium-prep')
    FileUtils.rm_rf loc
    FileUtils.mkdir_p(loc)
    expect(Dir.glob("#{loc}/*")).to be_empty
    SeleniumPrep.download
    expect(Dir.glob("#{loc}/*")).not_to be_empty
    FileUtils.rm_rf loc
  end

end
