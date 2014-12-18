require_relative '../config-checker'

module SeleniumPrep
  module System
    module Path

      def self.set
        ConfigChecker.new
        case ENV['SE_OS_TYPE']
        when 'win32', 'win64'
          ENV['PATH'] = "#{ENV['PATH']};#{ENV['SE_DOWNLOAD_LOCATION']}"
          require 'win32/registry'
          Win32::Registry::HKEY_LOCAL_MACHINE.open(
            "SYSTEM\\CurrentControlSet\\Control\\Session Manager\\Environment",
            Win32::Registry::KEY_WRITE) do |key|
              key['PATH'] = ENV['PATH']
            end
          broadcast_windows_system_message
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

        def self.broadcast_windows_system_message
          # See https://github.com/tourdedave/selenium-prep/issues/3 for details
          require 'Win32API'

          send_message_timeout = Win32API.new('user32', 'SendMessageTimeout', 'LLLPLLP', 'L')
          hwnd_broadcast = 0xffff
          wm_settingchange = 0x001A
          smto_abortifhung = 2
          result = 0
          send_message_timeout.call(hwnd_broadcast, wm_settingchange, 0, 'Environment', smto_abortifhung, 5000, result)
        end

    end
  end
end
