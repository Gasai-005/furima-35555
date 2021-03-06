## users

|Column             |Type  |Options                  |
|-------------------|------|-------------------------|
|last_name          |string|null: false              |
|first_name         |string|null: false              |
|last_name_kana     |string|null: false              |
|first_name_kana    |string|null: false              |
|encrypted_password |string|null: false              |
|nickname           |string|null: false, unique: true|
|email              |string|null: false, unique: true|
|birthday           |date  |null: false              |


### Association
has_many :items
has_many :buy_logs

## items

|Column          |Type      |Options                        |
|----------------|----------|-------------------------------|
|name            |string    |null: false                    |
|description     |text      |null: false                    |
|price           |integer   |null: false                    |
|delivery_cost_id|integer   |null: false                    |
|delivery_day_id |integer   |null: false                    |
|prefecture_id   |integer   |null: false                    |
|user            |references|null: false, foreign_key: true |
|category_id     |integer   |null: false                    |
|status_id       |integer   |null: false                    |

### Association
belongs_to :user
has_one :buy_log

## buy_logs

|Column  |Type       |Options                        |
|--------|-----------|-------------------------------|
|item    |references |null: false, foreign_key: true |
|user    |references |null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :item
has_one :delivery

## deliveries

|Column        |Type      |Options                        |
|--------------|----------|-------------------------------|
|postal_code   |string    |null: false                    |
|prefecture_id |integer   |null: false                    |
|municipality  |string    |null: false                    |
|address       |string    |null: false                    |
|building_name |string    |                               |
|phone_number  |string    |null: false                    |
|buy_log       |references|null: false, foreign_key: true |

### Association
belongs_to :buy_log