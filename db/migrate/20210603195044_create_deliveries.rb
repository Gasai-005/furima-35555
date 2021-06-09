class CreateDeliveries < ActiveRecord::Migration[6.0]
  def change
    create_table :deliveries do |t|
      t.string :postal_code
      t.integer :prefecture_id
      t.string :municipality
      t.string :address
      t.string :building_name
      t.string :phone_number
      t.references :buy_log, foreign_key: true
      t.timestamps
    end
  end
end
