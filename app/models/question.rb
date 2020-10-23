class Question < ApplicationRecord
  belongs_to :user
  belongs_to :author, class_name: 'User', required: false

  has_many :hash_tag_questions, dependent: :destroy
  has_many :hash_tags, through: :hash_tag_questions

  validates :text, presence: true, length: { maximum: 255 }

  after_commit :search_update_hashtags, on: %i[create update]

  private
  def search_update_hashtags
    hash_tag_questions.clear
    "#{text} #{answer}".downcase.scan(HashTag::HASHTAG_REGEX).uniq.each do |tag|
      hash_tags << HashTag.find_or_create_by(name: tag)
    end
  end
end
