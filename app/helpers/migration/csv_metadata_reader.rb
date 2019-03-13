require 'csv'
require_relative 'exam_record_creator.rb'
# class to manage ingest stage of digital library exam papers migration
class CsvMetadataReader
  def test
    puts 'put tests for BulkExamIngestor here'
    make_records_from_csv
  end

  def make_records_from_csv
    csv_source_loc = '/vagrant/downloads/test_files/small_exam_papersDC_PLUS_CONTENT.csv'
    csv_records = File.read(csv_source_loc)
    headers = CSV.foreach(csv_source_loc).first
    parsed_csv = CSV.parse(csv_records, headers: true)
    metadata_batch = get_metadata_rows(parsed_csv, headers)
    new_record_creator = ExamRecordCreator.new
    metadata_batch.each do |metadata_item|
      new_record_creator.make_new_exam_record(metadata_item)
    end
  end

  def get_metadata_rows(parsed_csv, headers)
    all_rows = []
    i = 0
    parsed_csv.each do |row|
      i += 1
      puts "Starting line #{i}"
      puts "number of headers:" + headers.size.to_s
      puts "number of rows:" + parsed_csv.size.to_s
      row_data = {} # 1hash:1row
      headers.each do |h|
        puts "got header: #{h}"
        value_in_row = row[h.to_s]
        puts "#{h}:#{value_in_row}" if value_in_row
        row_data[h.to_sym] = value_in_row if value_in_row
      end
      keyword_present = row[:subject1]
      row_data['subject1'.to_sym] = 'Exam Paper' unless keyword_present
      row_data['model'.to_sym] = 'ExamPaper'
      all_rows << row_data
    end
    all_rows
  end
end
