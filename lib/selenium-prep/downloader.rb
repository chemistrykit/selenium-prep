require_relative 'urls'
require_relative 'config-checker'
require 'uri'
require 'rest-client'
require 'fileutils'

module SeleniumPrep
  module Downloader

    include URLs
    extend self

    def download
      ConfigChecker.new

      urls.each do |url|
        download_target = file_for url
        File.open(download_target, 'wb') do |file|
          puts "[ #{Time.now} ]   Downloading #{download_target}"
          file.write(RestClient.get(url))
          puts "[ #{Time.now} ]   Finished downloading #{download_target}"
        end
      end

    end

    private

      def urls
        tmp = []
        tmp << DRIVERS[ENV['SE_OS_TYPE'].to_sym]
        tmp << [ SERVER ]
        tmp.flatten
      end

      def file_for(url)
        filename = File.basename(URI.parse(url).path)
        File.join(ENV['SE_DOWNLOAD_LOCATION'], filename)
      end

  end
end
