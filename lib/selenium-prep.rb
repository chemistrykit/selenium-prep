require_relative 'selenium-prep/downloader'
require_relative 'selenium-prep/system/path'

module SeleniumPrep

  def self.download
    Downloader.download
    puts "\n"
    path_set?
  end

  def self.path_set?
    result = System::Path.set?
    result ?
      (puts "Selenium is ready to use!") :
      (puts "Your PATH is not configured correctly. \n\nHere is what it's set to now:\n")
    puts System::Path.path
    puts "\n"
    System::Path.set
    result
  end

end
