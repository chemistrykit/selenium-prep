require 'zip'

module SeleniumPrep
  module System
    module Extract

      extend self

      def unzip(file)
        Zip::File.open(file) do |zip_file|
          zip_file.each do |f|
            f_path = File.join(ENV['SE_DOWNLOAD_LOCATION'], f.name)
            zip_file.extract(f, f_path)
          end
        end
      end

      def delete_zip_files
        FileUtils.rm("#{ENV['SE_DOWNLOAD_LOCATION']}/*.zip")
      end

    end
  end
end
