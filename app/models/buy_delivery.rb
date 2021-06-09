class BuyDelivery
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :token
    validates :postal_code
    validates :prefecture_id
    validates :municipality
    validates :address
    validates :phone_number
    validates :user_id
    validates :item_id
  end
  validates :prefecture_id, numericality: {other_than: 0}
  validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'を正しく入力してください' }
  validates :phone_number, length: { maximum: 11 }, format: { with: /\A[0-9]+\z/, message: 'を数字11桁以内で入力してください' }

  def save
    buy_log = BuyLog.create(item_id: item_id, user_id: user_id)
    Delivery.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building_name: building_name, buy_log_id: buy_log.id)
  end
end
