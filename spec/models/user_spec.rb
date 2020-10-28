require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nickname,email,password,encrypted_password,family_name,first_name,kana_family_name,kana_first_name,birth_dateが存在すれば登録できる" do
        expect(@user).to be_valid
      end

      it "passwordが6文字以上で登録できる" do
        @user.password = "abc1234"
        @user.encrypted_password = "abc1234"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空では登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "emailに＠がないと登録できない" do
        @user.email = "abcdcom"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it "passwordが空だと登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "passwordが6文字以下では登録できない" do
        @user.password = "abc"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it "encrypted_passwordが空では登録できない" do
        @user.encrypted_password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Encrypted password can't be blank")
      end

      it "family_nameが空では登録できない" do
        @user.family_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end

      it "family_nameが半角では登録できない" do
        @user.family_name = "yamada"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name 全角文字を使用してください")
      end

      it "first_nameが空では登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it "first_nameが半角では登録できない" do
        @user.first_name = "taro"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
      end

      it "kana_family_nameが空では登録できない" do
        @user.kana_family_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana family name can't be blank")
      end

      it "kana_family_nameがカタカナ以外では登録できない" do
        @user.kana_family_name = "やまだ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana family name 全角カタカナを使用してください")
      end

      it "kana_first_nameが空では登録できない" do
        @user.kana_first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first name can't be blank")
      end

      it "kana_first_nameがカタカナ以外では登録できない" do
        @user.kana_first_name = "たろう"
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first name 全角カタカナを使用してください")
      end

      it "birth_dateが空では登録できない" do
        @user.birth_date = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
    end
  end
end
