require_relative '../lib/selenium-prep'

describe 'Config Checker -> ' do

  it 'no Download Location' do
    ENV['SE_DOWNLOAD_LOCATION'] = nil
    expect { SeleniumPrep.download }.to raise_error(
      RuntimeError,
      'You need to specify a download location with SE_DOWNLOAD_LOCATION.')
  end

end
