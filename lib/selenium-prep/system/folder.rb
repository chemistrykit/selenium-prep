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
        print "Downloads directory is not empty. Proceed? [Y/N]:  "
        case gets.chomp.downcase
        when "y"
          puts "Proceeding with download."
        when "n"
          puts "Aborting download."
          exit 1
        end
      end

    end
  end
end
