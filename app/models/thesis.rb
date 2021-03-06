# Generated via
#  `rails generate dog_biscuits:work Thesis`
class Thesis < DogBiscuits::Thesis
  include ::Hyrax::WorkBehavior

  self.indexer = ::ThesisIndexer
  # Change this to restrict which works can be added as a child.
  # self.valid_child_concerns = []
  validates :title, presence: { message: 'Your work must have a title.' }

  # This must be included at the end, because it finalizes the metadata
  # schema (by adding accepts_nested_attributes)
  # include ::Hyrax::BasicMetadata
  include DogBiscuits::ThesisMetadata
  before_save :combine_dates
end
