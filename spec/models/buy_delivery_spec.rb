require 'rails_helper'

RSpec.describe BuyDelivery, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item, user_id: user.id)
    @buy = FactoryBot.build(:buy_delivery, user_id: user.id, item_id: item.id)
    sleep(0.1)
  end

  describe "商品購入機能" do
    context "購入できる場合" do
      it do
        expect(@buy).to be_valid
      end
      it "building_nameが無くても購入できる" do
        @buy.building_name = ''
        expect(@buy).to be_valid
      end
    end

    context '購入できない' do
      it "postal_codeが無いと購入できない" do
        @buy.postal_code = ''
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Postal code can't be blank", "Postal code を正しく入力してください")
      end
      it "postal_codeが正しい形式でないと購入できない" do
        @buy.postal_code = '1111111'
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Postal code を正しく入力してください")
      end
      it "prefecture_idが0以外でないと購入できない" do
        @buy.prefecture_id = '0'
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Prefecture must be other than 0")
      end
      it "municipalityが無いと購入できない" do
        @buy.municipality = ''
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Municipality can't be blank")
      end
      it "addressが無いと購入できない" do
        @buy.address = ''
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Address can't be blank")
      end
      
      it "phone_numberが無いと購入できない" do
        @buy.phone_number = ''
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Phone number can't be blank")
      end
      it "phone_numberが数字11桁以下でないと購入できない" do
        @buy.phone_number = '111111111111'
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
    end
  end
end
