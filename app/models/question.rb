class Question < ApplicationRecord

  belongs_to :user

  validates :user, :text, presence: true
  validates_length_of :text, :maximum => 255
end
