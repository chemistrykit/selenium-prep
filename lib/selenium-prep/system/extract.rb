require 'zip'

module SeleniumPrep
  module System
    module Extract

      extend self

      def extract_zip_files
        puts "Extracting zip files..."
        zip_files.each do |file|
          Zip::File.open(file, 'wb') do |zip_file|
            zip_file.each do |f|
              f_path = File.join(ENV['SE_DOWNLOAD_LOCATION'], f.name)
              delete_file f_path if File.exist? f_path
              zip_file.extract(f, f_path)
            end
          end
        end
      end

      def delete_zip_files
        puts 'Deleting zip files...'
        zip_files.each { |zip_file| delete_file zip_file }
        puts 'Done working with zip files.'
      end

      private

        def zip_files
          Dir.glob("#{ENV['SE_DOWNLOAD_LOCATION']}/*").collect do |file|
            file if file.include?('.zip')
          end.compact!
        end

        def delete_file(file)
          FileUtils.rm file
        end
    end
  end
end
