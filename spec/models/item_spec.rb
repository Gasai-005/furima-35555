require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品出品機能" do
    context "出品できる場合" do
      it do
        expect(@item).to be_valid
      end
    end

    context "出品できない" do
      it "imageが無いと出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "nameが空だと出品できない" do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "descriptionが空だと出品できない" do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it "categpryのidが1だと出品できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it "statusのidが1だと出品できない" do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end
      it "delivery_costのidが1だと出品できない" do
        @item.delivery_cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery cost must be other than 1")
      end
      it "delivery_dayのidが1だと出品できない" do
        @item.delivery_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day must be other than 1")
      end
      it "prefectureのidが1だと出品できない" do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it "priceが空だと出品できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "priceが￥300より少ないと出品できない" do
        @item.price = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Price を半角数字で￥300~9999999の範囲に設定してください")
      end
      it "priceが￥9999999より大きいと出品できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price を半角数字で￥300~9999999の範囲に設定してください")
      end
      it "priceが半角数字のみでないと出品できない" do
        @item.price = '２０００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price を半角数字で￥300~9999999の範囲に設定してください")
      end
      it "priceが半角英語のみでは出品できない" do
        @item.price = "aaa"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price を半角数字で￥300~9999999の範囲に設定してください")
      end
      it "priceが半角英数混合では出品できない" do
        @item.price = "a300"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price を半角数字で￥300~9999999の範囲に設定してください")
      end
    end
  end
end
