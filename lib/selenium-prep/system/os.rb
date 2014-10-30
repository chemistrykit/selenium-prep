module SeleniumPrep
  module System
    module OS

      extend self

      def windows?
        (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM) != nil
      end

      def mac?
       (/darwin/ =~ RUBY_PLATFORM) != nil
      end

      def unix?
        !windows?
      end

      def linux?
        unix? and not mac?
      end

      def set_type
        ENV['SE_OS_TYPE'] = 'win'   if System::OS.windows?
        ENV['SE_OS_TYPE'] = 'mac'   if System::OS.mac?
        ENV['SE_OS_TYPE'] = 'linux' if System::OS.linux?
        ENV['SE_OS_TYPE'] = ENV['SE_OS_TYPE'] + (ENV['SE_OS_TYPE_BIT'] ||= '32')
      end

    end
  end
end
