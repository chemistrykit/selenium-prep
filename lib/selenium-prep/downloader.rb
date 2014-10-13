require_relative 'urls'
require_relative 'config-checker'
require 'uri'
require 'typhoeus'
require 'fileutils'

module SeleniumPrep
  module Downloader

    include URLs
    extend self

    def download
      ConfigChecker.new
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
        DRIVERS[ENV['SE_OS_TYPE'].to_sym] << SERVER
      end

      def file_for(url)
        filename = File.basename(URI.parse(url).path)
        File.join(ENV['SE_DOWNLOAD_LOCATION'], filename)
      end

  end
end
