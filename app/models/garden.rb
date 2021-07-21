class Garden < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true
  validates :stars, presence: true
end
