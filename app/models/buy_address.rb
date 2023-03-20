class BuyAddress
  include ActiveModel::Model
  attr_accessor :user_id, :product_id, :post_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :token

  with_options presence: true do
    validates :user_id, :product_id, :token
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, :municipality, :address
    validates :phone_number, format: {with: /\A\d{10,11}\z/}
  end

  def save
    buy = Buy.create(user_id: user_id, product_id: product_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, buy_id: buy.id)
  end
end