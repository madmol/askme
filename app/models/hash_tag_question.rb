class HashTagQuestion < ApplicationRecord
  belongs_to :hash_tag
  belongs_to :question
end
