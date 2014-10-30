require_relative '../lib/selenium-prep/system/os'
require_relative '../lib/selenium-prep/downloader'
require_relative '../lib/selenium-prep/system/extract'

describe 'Extract', :acceptance do

  before(:all) do
    SeleniumPrep::System::OS.set_type
    @loc = ENV['SE_DOWNLOAD_LOCATION'] = File.join(Dir.pwd, 'spec/tmp/file')
    FileUtils.rm_rf @loc
    FileUtils.mkdir_p @loc
    SeleniumPrep::Downloader.download
  end

  after(:all) do
    FileUtils.rm_rf @loc
  end

  def files
    Dir.glob("#{@loc}/*")
  end

  it 'extracts' do
    file_count = files.count
    SeleniumPrep::System::Extract.extract_zip_files
    expect(files.count).to be > file_count
  end

  it 'cleans up' do
    file_count = files.count
    zip_files = files.collect { |file| file if file.include?('.zip') }.compact!
    SeleniumPrep::System::Extract.delete_zip_files
    expect(files.count).to eql(file_count - zip_files.count)
  end

end
