require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    # 出品者のユーザーを生成 
    seller = FactoryBot.create(:user)
    # 購入者のユーザーを生成 
    buyer = FactoryBot.create(:user)
    # 購入する商品を生成 
    item =  FactoryBot.create(:item, user_id:seller.id)
    # フォームオブジェクトの値を生成する
    @buyer_order = FactoryBot.build(:buyer_order, user_id: buyer.id, item_id: item.id)
    sleep(2)
  end
  describe '商品購入' do
    context '商品購入ができない時' do
      it "郵便番号が空だと登録出来ない" do
        @buyer_order.postal_code = ""
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include("Postal code can't be blank")
      end
      it "郵便番号に-がないと登録出来ない" do
        @buyer_order.postal_code = "0000000"
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include("Postal code is invalid")
      end    
      it "都道府県が空だと登録出来ない" do
        @buyer_order.prefecture_id = ""
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include("Prefecture is not a number")
      end
      it "都道府県が--だと登録出来ない" do
        @buyer_order.prefecture_id = 1
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it "市区町村が空だと登録出来ない" do
        @buyer_order.municipalities  = ""
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include("Municipalities can't be blank")
      end
      it "市区町村が全角でないと登録出来ない" do
        @buyer_order.municipalities = "a"
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include("Municipalities is invalid")
      end
      it "番地が空だと登録出来ない" do
        @buyer_order.address = ""
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include("Address can't be blank")
      end
      it "電話番号が空だと登録出来ない" do
        @buyer_order.phone_number  = ""
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include("Phone number can't be blank")
      end
      it "電話番号が半角数字でないと登録出来ない" do
        @buyer_order.phone_number  = "０"
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include("Phone number is invalid")
      end
      it "電話番号が十二文字以上だと登録出来ない" do
        @buyer_order.phone_number  = "000000000000"
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include( "Phone number is invalid")
      end
      it "user_idが空では登録できないこと" do
        @buyer_order.user_id = ""
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include("User can't be blank")
      end
      it "item_idが空では登録できないこと" do
        @buyer_order.item_id = ""
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include("Item can't be blank")
      end
      it "tokenが空では登録できないこと" do
        @buyer_order.token = ""
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include("Token can't be blank")
      end
      it "購入できる時" do
        expect(@buyer_order).to be_valid
      end
    end
  end
end