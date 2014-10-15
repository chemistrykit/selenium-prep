require_relative 'spec_helper'
require_relative '../lib/selenium-prep/system/folder'

describe 'Folder creation -> ' do

  before(:all) do
    @loc = ENV['SE_DOWNLOAD_LOCATION'] = File.join(Dir.pwd, 'spec/tmp/folder')
  end

  context 'Sanity Checks' do

    before(:each) do
      FileUtils.mkdir_p(@loc)
    end

    after(:each) do
      FileUtils.rm_rf @loc
    end

    it 'directory check' do
      expect(SeleniumPrep::System::Folder.directory_exists?).to be true
    end

    it 'downloads check' do
      expect(SeleniumPrep::System::Folder.downloads_exist?).to be false
    end

    it 'directory creation' do
      FileUtils.rm_rf @loc
      SeleniumPrep::System::Folder.create_directory
      expect(SeleniumPrep::System::Folder.directory_exists?).to be true
    end

    it 'empty directory' do
      SeleniumPrep::System::Folder.empty_directory
      expect(SeleniumPrep::System::Folder.downloads_exist?).to be false
    end
  end

  context 'User prompt -> ' do

    class InputWrapper

      def initialize(string)
        @string = string
      end

      def gets
        @string
      end

      def self.input(string)
        $stdin = new(string)
        yield
      ensure
        $stdin = STDIN
      end

    end

    it 'aborted' do
      InputWrapper.input 'N' do
        expect { SeleniumPrep::System::Folder.prompt_user }.to raise_error(
                 RuntimeError,
                 'Aborting download.')
      end
    end

  end

end
