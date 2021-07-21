class Review < ApplicationRecord
  belongs_to :garden

  validates :content, presence: true
end
