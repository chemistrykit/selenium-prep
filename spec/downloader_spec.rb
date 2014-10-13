require_relative '../lib/selenium-prep/downloader'

describe 'Downloader' do

  before(:all) do
    @loc = ENV['SE_DOWNLOAD_LOCATION'] = File.join(Dir.pwd, 'spec/tmp/downloader')
  end

  after(:all) do
    FileUtils.rm_rf @loc
  end

  it 'downloads' do
    ENV['SE_OS_TYPE'] = 'mac32'
    FileUtils.mkdir_p(@loc) unless File.directory?(@loc)
    SeleniumPrep::Downloader.download
    expect(Dir.glob("#{@loc}/*")).not_to be_empty
  end

end
