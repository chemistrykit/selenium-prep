module SeleniumPrep
  class SystemCheck

    module PATH
    end

    module OS

      def self.windows?
        (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM) != nil
      end

      def self.mac?
       (/darwin/ =~ RUBY_PLATFORM) != nil
      end

      def self.unix?
        !OS.windows?
      end

      def self.linux?
        OS.unix? and not OS.mac?
      end

    end
  end
end
