class Size < ApplicationRecord
  belongs_to :size_type
  has_many :products
end
