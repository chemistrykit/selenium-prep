module SeleniumPrep
  module URLs

    BASE_URL  = {   chrome_driver:      'http://chromedriver.storage.googleapis.com/2.12',
                    ie_driver:          'http://selenium-release.storage.googleapis.com/2.44',
                    standalone_server:  'http://selenium-release.storage.googleapis.com/2.44' }

    SERVER    =     "#{BASE_URL[:standalone_server]}/selenium-server-standalone-2.44.0.jar"

    DRIVERS   = {   mac32:   [ "#{BASE_URL[:chrome_driver]}/chromedriver_mac32.zip" ],
                    win32:   [ "#{BASE_URL[:chrome_driver]}/chromedriver_win32.zip",
                             "#{BASE_URL[:ie_driver]}/IEDriverServer_Win32_2.44.0.zip" ],
                    win64:   [ "#{BASE_URL[:chrome_driver]}/chromedriver_win32.zip",
                                "#{BASE_URL[:ie_driver]}/IEDriverServer_x64_2.44.0.zip" ],
                    linux32: [ "#{BASE_URL[:chrome_driver]}/chromedriver_linux32.zip" ],
                    linux64: [ "#{BASE_URL[:chrome_driver]}/chromedriver_linux64.zip" ] }

  end
end
