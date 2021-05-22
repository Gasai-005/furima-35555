require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context '保存できる場合' do
      it "全ての項目を正しく入力できているとサインアップできる" do
        expect(@user).to be_valid
      end
    end
    context '保存できない場合' do
    it "nicknameが空だと登録できない" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "メールアドレスが空だと登録できない" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "メールアドレスに＠が含まれていないと登録できない" do
      @user.email = 'a'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it "同じメールアドレスが既に存在していると登録できない" do
      @user.save
      @user2 = FactoryBot.build(:user)
      @user2.email = @user.email
      @user2.valid?
      expect(@user2.errors.full_messages).to include("Email has already been taken")
    end
    it "passwordが空だと登録できない" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "passwordが６文字以上ないと登録できない" do
      @user.password = 'a'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is too short (minimum is 6 characters)", "Password は6文字以上かつ英数字をそれぞれ含めてください")
    end
    it "passwordが半角英字のみは登録できない" do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password は6文字以上かつ英数字をそれぞれ含めてください")
    end
    it "passwordが数字のみでは登録できない" do
      @user.password = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password は6文字以上かつ英数字をそれぞれ含めてください")
    end
    it "passwordが全角英数字では登録できない" do
      @user.password = 'ａａａ１１１'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password は6文字以上かつ英数字をそれぞれ含めてください")
    end
    it "password_confirmationが空だと登録できない" do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "passwordとpassword_confirmationが一致していないと登録できない" do
      @user.password_confirmation = 'aaa111'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "last_nameが空だと登録できない" do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank", "Last name に全角文字を使用してください")
    end
    it "last_nameが全角でないと登録できない" do
      @user.last_name = 'yamada'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name に全角文字を使用してください")
    end
    it "fist_nameが空だと登録できない" do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank", "First name に全角文字を使用してください")
    end
    it "first_nameが全角でないと登録できない" do
      @user.first_name = 'tarou'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name に全角文字を使用してください")
    end
    it "last_name_kanaが空だと登録できない" do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank", "Last name kana に全角カタカナを使用してください")
    end
    it "last_name_kanaが全角カタカナでないと登録できない" do
      @user.last_name_kana = 'yamada'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana に全角カタカナを使用してください")
    end
    it "first_name_kanaが空だと登録できない" do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank", "First name kana に全角カタカナを使用してください")
    end
    it "first_name_kanaが全角カタカナでないと登録できない" do
      @user.first_name_kana = 'tarou'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana に全角カタカナを使用してください")
    end
    it "birthdayが空だと登録できない" do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
    end
  end
end
