class Sale < ApplicationRecord
  belongs_to :recipe
  has_many :sale_packages
end
