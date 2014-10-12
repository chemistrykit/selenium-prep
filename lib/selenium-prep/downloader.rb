require_relative 'urls'
require_relative 'config-checker'
require 'uri'
require 'typhoeus'

module SeleniumPrep
  module Downloader

    include URLs
    extend self

    def download
      ConfigChecker.new
      prompt_user if downloads_exist?
      hydra = Typhoeus::Hydra.new(max_concurrency: 3)
      urls.each do |url|
        file = file_for url
        download = File.open(file, 'w')
        puts "[ #{Time.now} ]   Downloading #{file}"
        request = Typhoeus::Request.new url
        request.on_body do |payload|
          download.write payload
        end
        request.on_complete do |response|
          download.close
          puts "[ #{Time.now} ]   Finished downloading #{file}"
        end
        hydra.queue request
      end

      hydra.run
    end

    private

      def urls
        DRIVERS[ENV['SP_OS_TYPE'].to_sym] << SERVER
      end

      def file_for(url)
        filename = File.basename(URI.parse(url).path)
        File.join(ENV['SP_DOWNLOAD_LOCATION'], filename)
      end

      def downloads_exist?
        !Dir.glob("#{ENV['SP_DOWNLOAD_LOCATION']}/*").empty?
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
