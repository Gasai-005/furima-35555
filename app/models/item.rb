class Item < ApplicationRecord
  belongs_to :user
  has_one :buy_log
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :delivery_cost
  belongs_to_active_hash :delivery_day
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :prefecture

  with_options presence: true do
    validates :name
    validates :description
    validates :price
    validates :delivery_cost_id
    validates :delivery_day_id
    validates :prefecture_id
    validates :category_id
    validates :status_id
    validates :image
  end

  with_options numericality: { other_than: 1 } do
    validates :delivery_cost_id
    validates :delivery_day_id
    validates :prefecture_id
    validates :category_id
    validates :status_id
  end

  validates_inclusion_of :price, in:300..9999999, message: 'を半角数字で￥300~9999999の範囲に設定してください'
  validates :price, format: { with: /\A[0-9]+\z/}
end
