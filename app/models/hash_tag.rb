class HashTag < ApplicationRecord
  HASHTAG_REGEX = /#[\wа-яё]+/.freeze

  has_many :hash_tag_questions
  has_many :questions, through: :hash_tag_questions

  scope :with_questions, -> { joins(:questions).distinct }

  before_validation { name&.downcase! }

  validates :name, presence: true

  def to_param
    name[1..-1]
  end
end
