class HashTag < ApplicationRecord
  HASHTAG_REGEX = /#[[:word:]]+/.freeze

  has_many :hash_tag_questions, dependent: :destroy
  has_many :questions, through: :hash_tag_questions

  scope :with_questions, -> { joins(:questions).distinct }

  before_validation { name&.downcase! }

  validates :name, presence: true
end
