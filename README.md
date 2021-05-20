## users

|Column         |Type  |Options                  |
|---------------|------|-------------------------|
|last_name      |string|null: false              |
|first_name     |string|null: false              |
|last_name_kana |string|null: false              |
|first_name_kana|string|null: false              |
|password       |string|null: false, unique: true|
|nickname       |string|null: false, unique: true|
|email          |string|null: false, unique: true|
|birthday       |date  |null: false              |


### Association
has_many :items
has_many :buy_logs

## items

|Column      |Type      |Options    |
|------------|----------|-----------|
|item_name   |string    |null: false|
|description |text      |null: false|
|price       |int       |null: false|
|category_id |int       |null: false|
|status_id   |int       |null: false|
|image_id    |int       |null: false|

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

|Column        |Type  |Options    |
|--------------|------|-----------|
|postal_code   |string|null: false|
|prefecture    |string|null: false|
|delivery_cost |int   |null: false|
|delivery_date |date  |null: false|

### Association
belongs_to :buy_log