class Question < ApplicationRecord
  belongs_to :user
  belongs_to :author, class_name: 'User', required: false

  has_many :hash_tag_questions, dependent: :destroy
  has_many :hash_tags, through: :hash_tag_questions

  validates :text, presence: true, length: {maximum: 255}

  after_save_commit :search_update_hashtags

  private

  def search_update_hashtags
    self.hash_tags =
      "#{text} #{answer}".downcase.scan(HashTag::HASHTAG_REGEX).uniq.map do |tag|
        HashTag.find_or_create_by(name: tag[1..-1])
      end
  end
end
