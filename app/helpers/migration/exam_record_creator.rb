require 'dog_biscuits'
# class to create new ExamPaper record
class ExamRecordCreator
  def make_new_exam_record(metadate_for_record)
    puts 'this needs to make a new ExamPaper record'
    new_file_set = FileSet.new
    new_exam_paper = ExamPaper.new
  end
end
