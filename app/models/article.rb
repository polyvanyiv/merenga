class Article < ApplicationRecord
  has_many :purchases

  validates :name, presence: true
  validates :category, presence: true
  validates :unit, presence: true
end
