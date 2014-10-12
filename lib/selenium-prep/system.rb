require_relative 'config-checker'

module SeleniumPrep
  module System
    module Path

      def self.set
        ConfigChecker.new
        puts "You need to add #{ENV['SP_DOWNLOAD_LOCATION']} to your path.\n\n"
        case ENV['SP_OS_TYPE']
        when 'win32', 'win64'
          puts "For instructions on how to do that read:\n http://www.computerhope.com/issues/ch000549.htm"
        when 'mac32', 'linux32', 'linux64'
          puts "For instructions on how to do that read:\n http://unix.stackexchange.com/questions/26047/how-to-correctly-add-a-path-to-path"
        end
      end

      def self.set?
        ConfigChecker.new
        case ENV['SP_OS_TYPE']
        when 'win32', 'win64'
          `echo %PATH%'`.include? ENV['SP_DOWNLOAD_LOCATION']
        when 'mac32', 'linux32', 'linux64'
          `echo $PATH`.include? ENV['SP_DOWNLOAD_LOCATION']
        end
      end

      def self.path
        ConfigChecker.new
        case ENV['SP_OS_TYPE']
        when 'win32', 'win64'
          `echo %PATH%'`
        when 'mac32', 'linux32', 'linux64'
          `echo $PATH`
        end
      end

    end
  end
end
