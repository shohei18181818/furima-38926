class Address < ApplicationRecord
  
  belongs_to :buy

  has_many :products
  has_many :users
end
