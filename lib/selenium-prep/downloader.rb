module SeleniumPrep
  class Downloader

    URI       = { chrome:                'http://chromedriver.storage.googleapis.com/2.11/',
                  internet_explorer:     'http://selenium-release.storage.googleapis.com/2.43',
                  standalone_server:     'http://selenium-release.storage.googleapis.com/2.43' }

    RESOURCES = { chrome:            { mac32: "#{URI[:chrome]}/chromedriver_mac32.zip",
                                       win32: "#{URI[:chrome]}/chromedriver_win32.zip",
                                       linux32: "#{URI[:chrome]}/chromedriver_linux32.zip",
                                       linux64: "#{URI[:chrome]}/chromedriver_linux64.zip" },
                  internet_explorer: { win32: "#{URI[:internet_explorer]}/IEDriverServer_Win32_2.43.0.zip",
                                       win64: "#{URI[:internet_explorer]}/IEDriverServer_x64_2.43.0.zip" },
                  standalone_server: "#{URI[:standalone_server]}/selenium-server-standalone-2.43.1.jar" }

    def initialize
    end

  end
end

puts SeleniumPrep::Downloader.new.inspect
