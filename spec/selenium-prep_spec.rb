require_relative '../lib/selenium-prep'

describe 'Selenium Prep', :acceptance do

  it 'downloads' do
    ENV['SE_OS_TYPE'] = 'mac32'
    loc = ENV['SE_DOWNLOAD_LOCATION'] = File.join(Dir.pwd, 'spec/tmp/selenium-prep')
    FileUtils.rm_rf loc
    SeleniumPrep::System::Folder.create_directory
    SeleniumPrep.download
    expect(Dir.glob("#{loc}/*")).not_to be_empty
    FileUtils.rm_rf loc
  end

end
