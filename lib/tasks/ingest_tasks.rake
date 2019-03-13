namespace :ingest_tasks do

require_relative '../../app/helpers/migration/csv_metadata_reader.rb'

task :default do
  puts "doing the default task"
end

task :test_exam_ingestor => :environment do
  e = CsvMetadataReader.new
  e.test
end
end
