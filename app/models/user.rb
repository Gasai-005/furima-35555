class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
  validates :nickname 
  validates :last_name
  validates :first_name
  validates :last_name_kana
  validates :first_name_kana
  validates :birthday
  end
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "は6文字以上かつ英数字をそれぞれ含めてください" }
  with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'に全角文字を使用してください' } do
    validates :last_name
    validates :first_name
  end
  with_options format: { with: /\A[ァ-ヶ一]+\z/, message: 'に全角カタカナを使用してください' } do
    validates :last_name_kana
    validates :first_name_kana
  end

  has_many :items
end
