require_relative 'spec_helper'
require_relative '../lib/selenium-prep'

describe 'Config Checker -> ' do

  before(:each) do
    ENV['SE_OS_TYPE'] = nil
    ENV['SE_DOWNLOAD_LOCATION'] = nil
  end

  it 'no OS type' do
    ENV['SE_DOWNLOAD_LOCATION'] = 'asdf'
    expect { SeleniumPrep.download }.to raise_error(
      RuntimeError,
      'You need to specify an operating system type with SE_OS_TYPE.')
  end

  it 'no Download Location' do
    ENV['SE_OS_TYPE'] = 'asdf'
    expect { SeleniumPrep.download }.to raise_error(
      RuntimeError,
      'You need to specify a download location with SE_DOWNLOAD_LOCATION.')
  end

end
