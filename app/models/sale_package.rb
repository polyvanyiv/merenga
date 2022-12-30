class SalePackage < ApplicationRecord
  belongs_to :sale
  belongs_to :article
end
