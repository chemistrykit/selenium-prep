require_relative 'selenium-prep/downloader'
require_relative 'selenium-prep/system/path'
require_relative 'selenium-prep/system/folder'
require_relative 'selenium-prep/system/extract'
require_relative 'selenium-prep/system/os'

module SeleniumPrep

  def self.prep
    System::OS.set_type
    download
    System::Path.set
    path_set?
  end

  def self.download
    System::OS.set_type
    ConfigChecker.new
    System::Folder.create_directory
    System::Folder.prompt_user if System::Folder.downloads_exist?
    Downloader.download
    System::Extract.extract_zip_files
    System::Extract.delete_zip_files
  end

  def self.path_set?
    System::OS.set_type
    ConfigChecker.new
    result = System::Path.set?
    result ?
      (puts "Selenium is ready to use!") :
      (puts "Your PATH is not configured correctly. \n\nHere is what it's set to now:\n")
    puts System::Path.path
    result
  end

  private


end
