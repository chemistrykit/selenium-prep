require_relative '../lib/selenium-prep/downloader'
require_relative '../lib/selenium-prep/system/extract'

describe 'Extract', :acceptance do

  before(:all) do
    ENV['SE_OS_TYPE'] = 'mac32'
    @loc = ENV['SE_DOWNLOAD_LOCATION'] = File.join(Dir.pwd, 'spec/tmp/file')
    FileUtils.rm_rf @loc
    FileUtils.mkdir_p(@loc)
    SeleniumPrep::Downloader.download
  end

  after(:all) do
    FileUtils.rm_rf @loc
  end

  def files
    Dir.glob("#{@loc}/*")
  end

  it 'extracts' do
    file_count = files.length
    zip_files = files.collect { |file| file if file.include?('.zip') }.compact!
    zip_files.each do |file|
      SeleniumPrep::System::Extract.unzip file
    end
    expect(files.length).to eql file_count + 1
  end

end
