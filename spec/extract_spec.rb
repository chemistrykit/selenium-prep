require_relative 'spec_helper'
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
    file_count = files.count
    SeleniumPrep::System::Extract.extract_zip_files
    expect(files.count).to eql file_count + 1
  end

  it 'cleans up' do
    file_count = files.count
    zip_files = files.collect { |file| file if file.include?('.zip') }.compact!
    SeleniumPrep::System::Extract.delete_zip_files
    expect(files.count).to eql(file_count - zip_files.count)
  end

end
