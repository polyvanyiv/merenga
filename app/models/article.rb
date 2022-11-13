class Article < ApplicationRecord
  validates :name, presence: true
  validates :category, presence: true
  validates :unit, presence: true
end
