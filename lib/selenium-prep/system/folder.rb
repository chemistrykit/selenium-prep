module SeleniumPrep
  module System
    module Folder

      extend self

      def directory_exists?
        File.directory?(ENV['SE_DOWNLOAD_LOCATION'])
      end

      def downloads_exist?
        !Dir.glob("#{ENV['SE_DOWNLOAD_LOCATION']}/*").empty?
      end

      def create_directory
        FileUtils.mkdir_p(ENV['SE_DOWNLOAD_LOCATION'])
      end

      def prompt_user
        print "Downloads directory is not empty. Proceed? [Y/N]:  " unless ENV['SE_DEBUG'] == 'off'
        case $stdin.gets.chomp.downcase
        when "y"
          puts "Proceeding with download." unless ENV['SE_DEBUG'] == 'off'
        when "n"
          raise 'Aborting download.'
        end
      end

    end
  end
end
