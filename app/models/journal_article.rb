# Generated via
#  `rails generate dog_biscuits:work JournalArticle`
class JournalArticle < DogBiscuits::JournalArticle
  include ::Hyrax::WorkBehavior

  self.indexer = ::JournalArticleIndexer
  # Change this to restrict which works can be added as a child.
  # self.valid_child_concerns = []
  validates :title, presence: { message: 'Your work must have a title.' }

  # This must be included at the end, because it finalizes the metadata
  # schema (by adding accepts_nested_attributes)
  # include ::Hyrax::BasicMetadata
  include DogBiscuits::JournalArticleMetadata
  before_save :combine_dates
end
