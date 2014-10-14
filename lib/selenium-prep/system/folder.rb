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

      def empty_directory
        FileUtils.rm_rf Dir.glob("#{ENV['SE_DOWNLOAD_LOCATION']}/*")
      end

      def prompt_user
        puts 'Your downloads directory is not empty. This will overwrite files of the same name.'
        print 'Proceed? [Y/N]:  '
        case $stdin.gets.chomp.downcase
        when "y"
          puts "Proceeding with download."
        when "n"
          raise 'Aborting download.'
        end
      end

    end
  end
end
