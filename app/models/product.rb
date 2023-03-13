class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :name, :explanation, :image, presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :situation_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_charge_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :number_of_day_id, numericality: { other_than: 1, message: "can't be blank" }
  with_options presence: true,format: { with: /\A[0-9]+\z/ } do
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }, presence: { message: "can't be blank"}
  end

  belongs_to :category
  belongs_to :situation
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :number_of_day
  
  belongs_to :user
  has_one_attached :image

end
