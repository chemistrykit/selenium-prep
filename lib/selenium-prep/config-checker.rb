module SeleniumPrep
  class ConfigChecker

    def initialize
      download_location
      os_type
    end

    private

      ERRORS = { NoDownloadLocationSpecified: 'You need to specify a download location with SP_DOWNLOAD_LOCATION.',
                 NoOSTypeSpecified:           'You need to specify an operating system type with SP_OS_TYPE.' }

      def download_location
        if ENV['SP_DOWNLOAD_LOCATION'].nil?
          raise ERRORS[:NoDownloadLocationSpecified]
        end
      end

      def os_type
        if ENV['SP_OS_TYPE'].nil?
          raise ERRORS[:NoOSTypeSpecified]
        end
      end


  end
end
