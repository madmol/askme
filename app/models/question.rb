class Question < ApplicationRecord
  belongs_to :user
  belongs_to :author, class_name: 'User', required: false

  validates :text, presence: true, length: { maximum: 255 }
end
