require_relative '../lib/selenium-prep/system/os'
require_relative '../lib/selenium-prep/downloader'

describe 'Downloader' do

  before(:all) do
    SeleniumPrep::System::OS.set_type
    @loc = ENV['SE_DOWNLOAD_LOCATION'] = File.join(Dir.pwd, 'spec/tmp/downloader')
    FileUtils.rm_rf @loc
    FileUtils.mkdir_p(@loc)
  end

  after(:all) do
    FileUtils.rm_rf @loc
  end

  it 'downloads' do
    expect(Dir.glob("#{@loc}/*")).to be_empty
    SeleniumPrep::Downloader.download
    expect(Dir.glob("#{@loc}/*")).not_to be_empty
  end

end
