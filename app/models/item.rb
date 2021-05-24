class Item < ApplicationRecord
  belongs_to :user
  
  with_options presence: true do
    validates :name
    validates :description
    validates :price
    validates :delivery_cost_id
    validates :delivery_day_id
    validates :prefecture_id
    validates :user
    validates :category_id
    validates :status_id
  end
end
