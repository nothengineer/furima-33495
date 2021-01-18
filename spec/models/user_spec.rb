require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録ができない時' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "emailに@が含まれないと登録できない" do
        @user.email = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "0000a"
        @user.password_confirmation = "0000a"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが数字だけでは登録出来ない" do
        @user.password = "000000"
        @user.password_confirmation = "000000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordが英字だけでは登録出来ない" do
        @user.password = "aaaaaa"
        @user.password_confirmation = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordが全角英数字混合であれば登録できない" do
        @user.password = "１２３４５Ａ"
        @user.password_confirmation = "１２３４５Ａ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "名字が全角で存在しないと登録出来ない" do
        @user.familyname = "aa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Familyname is invalid")
      end
      it "名字が空だと登録出来ない" do
        @user.familyname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Familyname is invalid")
      end
      it "名前が全角で存在しないと登録出来ない" do
        @user.firstname = "aa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname is invalid")
      end
      it "名前が空だと登録出来ない" do
        @user.firstname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname is invalid")
      end
      it "名字(フリガナ)が全角カタカナで存在しないと登録出来ない" do
        @user.familyname_kana = "あ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Familyname kana is invalid")
      end
      it "名字(フリガナ)が空だと登録出来ない" do
        @user.familyname_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Familyname kana is invalid")
      end
      it "名前(フリガナ)が全角カタカナで存在しないと登録出来ない" do
        @user.firstname_kana = "あ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname kana is invalid")
      end
      it "名前(フリガナ)が空だと登録出来ない" do
        @user.firstname_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname kana is invalid")
      end
      it "生年月日が存在しないと登録出来ない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it "新規登録ができる時" do  
        expect(@user).to be_valid
      end
    end
  end
end