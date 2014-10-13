require_relative 'selenium-prep/downloader'
require_relative 'selenium-prep/system/path'
require_relative 'selenium-prep/system/folder'

module SeleniumPrep

  include System::Folder

  def self.download
    ConfigChecker.new
    create_directory unless directory_exists?
    prompt_user if downloads_exist?
    Downloader.download
    puts "\n"
    path_set?
  end

  def self.path_set?
    ConfigChecker.new
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
