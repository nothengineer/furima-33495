require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end
  describe '商品購入' do
    context '商品購入ができない時' do
      it "郵便番号が空だと登録出来ない" do
        @order.zip_code = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Zip code can't be blank")
      end
      it "郵便番号に-がないと登録出来ない" do
        @order.postal_code = "0000000"
        @order.valid?
        expect(@order.errors.full_messages).to include("Zip code is invalid. Include hyphen(-)")
      end    
      it "都道府県が空だと登録出来ない" do
        @order.prefecture_id = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture is not a number")
      end
      it "都道府県が--だと登録出来ない" do
        @order.prefecture_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it "市区町村が空だと登録出来ない" do
        @order.municipalities  = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("municipalities can't be blank")
      end
      it "市区町村が全角でないと登録出来ない" do
        @order.municipalities = "a"
        @order.valid?
        expect(@order.errors.full_messages).to include("municipalities is invalid")
      end
      it "番地が空だと登録出来ない" do
        @order.address = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Address can't be blank")
      end
      it "電話番号が空だと登録出来ない" do
        @order.phone_number  = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end
      it "電話番号が半角数字でないと登録出来ない" do
        @order.phone_number  = "０"
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is not a number")
      end
      it "電話番号が十二文字以上だと登録出来ない" do
        @order.phone_number  = "000000000000"
        @order.valid?
        expect(@order.errors.full_messages).to include( "Phone number is too long (maximum is 11 characters)")
      end
      it "user_idが空では登録できないこと" do
        @order.user_id = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end
      it "item_idが空では登録できないこと" do
        @order.item_id = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Item can't be blank")
      end
      it "tokenが空では登録できないこと" do
        @order.token = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("token can't be blank")
      end
      it "購入できる時" do
        expect(@order).to be_valid
      end