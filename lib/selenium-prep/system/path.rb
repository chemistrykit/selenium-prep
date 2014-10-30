require_relative '../config-checker'

module SeleniumPrep
  module System
    module Path

      def self.set
        ConfigChecker.new
        case ENV['SE_OS_TYPE']
        when 'win32', 'win64'
          system("set path=%path%;#{ENV['SE_DOWNLOAD_LOCATION']}")
          system('reg.exe ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v Path /t REG_EXPAND_SZ /d %path% /f')
          ENV['PATH'] = "#{ENV['PATH']};#{ENV['SE_DOWNLOAD_LOCATION']}"
        when 'mac32', 'linux32', 'linux64'
          unless set?
            unless bash_updated?
              system("echo 'export PATH=$PATH:#{ENV['SE_DOWNLOAD_LOCATION']}' | sudo tee -a ~/.bash_profile")
            end
            system('source ~/.bash_profile')
            ENV['PATH'] = "#{ENV['PATH']}:/#{ENV['SE_DOWNLOAD_LOCATION']}"
          end
        end
      end

      def self.set?
        case ENV['SE_OS_TYPE']
        when 'win32', 'win64'
          path.include?(ENV['SE_DOWNLOAD_LOCATION'])
        when 'mac32', 'linux32', 'linux64'
          path.include?(ENV['SE_DOWNLOAD_LOCATION']) && bash_updated?
        end
      end

      def self.path
        ConfigChecker.new
        ENV['PATH']
      end

      private

        def self.bash_updated?
          !`cat ~/.bash_profile | grep #{ENV['SE_DOWNLOAD_LOCATION']}`.empty?
        end

    end
  end
end
