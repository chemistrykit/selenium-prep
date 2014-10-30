require_relative '../lib/selenium-prep/system/path'

describe 'Path' do

  it 'sets' do
    ENV['SE_OS_TYPE'] = 'mac32'
    ENV['SE_DOWNLOAD_LOCATION'] = File.join(Dir.pwd, 'spec/tmp/selenium-prep')
    SeleniumPrep::System::Path.set
    expect(SeleniumPrep::System::Path.set?).to be true
  end

end
