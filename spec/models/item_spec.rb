require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品出品' do
    context '商品出品ができない時' do
      it "画像が無いと登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "商品名が無いと登録できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "商品の説明が無いと登録できない" do
        @item.text = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it "カテゴリーの情報が無いと登録できない" do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "カテゴリーの情報が---では登録できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it "商品の状態についての情報が無いと登録できない" do
        @item.condition_id  = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it "商品の状態についての情報が---では登録できない" do
        @item.condition_id  = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end
      it "配送料の負担についての情報が無いと登録できない" do
        @item.shipping_cost_id  = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping cost can't be blank")
      end
      it "配送料の負担についての情報が---では登録できない" do
        @item.shipping_cost_id  = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping cost must be other than 1")
      end
      it "発送元の地域についての情報が無いと登録できない" do
        @item.prefecture_id  = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "発送元の地域についての情報が---では登録できない" do
        @item.prefecture_id  = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it " 発送までの日数についての情報が無いと登録できない" do
        @item.days_to_ship_id   = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship can't be blank")
      end
      it " 発送までの日数についての情報が---では登録できない" do
        @item.days_to_ship_id   = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship must be other than 1")
      end
      it "価格についての情報が無いと登録できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "価格が¥300以下では登録できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "価格が¥9,999,999より大きければ登録できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it "価格は半角数字でないと登録できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "商品出品ができる時" do
        expect(@item).to be_valid
      end 
    end
  end
end