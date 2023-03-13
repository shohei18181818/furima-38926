require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  describe '商品の情報を入力' do
    context '新規登録できるとき' do
      it '全ての項目が存在すれば登録できる' do
        expect(@product).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'imageが空では登録できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include ("Image can't be blank")
      end
      it 'nameが空では登録できない' do
        @product.name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include ("Name can't be blank")
      end
      it 'explanationが空では登録できない' do
        @product.explanation = ''
        @product.valid?
        expect(@product.errors.full_messages).to include ("Explanation can't be blank")
      end
      it 'category_idが空では登録できない' do
        @product.category_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include ("Category can't be blank")
      end
      it 'category_idが「---」を選択した状態では登録できない' do
        @product.category_id = 'id(1)'
        @product.valid?
        expect(@product.errors.full_messages).to include ("Category can't be blank")
      end
      it 'situation_idが空では登録できない' do
        @product.situation_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include ("Situation can't be blank")
      end
      it 'situation_idが「---」を選択した状態では登録できない' do
        @product.situation_id = 'id(1)'
        @product.valid?
        expect(@product.errors.full_messages).to include ("Situation can't be blank")
      end
      it 'shipping_charge_idが空では登録できない' do
        @product.shipping_charge_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include ("Shipping charge can't be blank")
      end
      it 'shipping_charge_idが「---」を選択した状態では登録できない' do
        @product.shipping_charge_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include ("Shipping charge can't be blank")
      end
      it 'prefecture_idが空では登録できない' do
        @product.prefecture_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include ("Prefecture can't be blank")
      end
      it 'prefecture_idが「---」を選択した状態では登録できない' do
        @product.prefecture_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include ("Prefecture can't be blank")
      end
      it 'number_of_day_idが空では登録できない' do
        @product.number_of_day_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include ("Number of day can't be blank")
      end
      it 'number_of_day_idが「---」を選択した状態では登録できない' do
        @product.number_of_day_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include ("Number of day can't be blank")
      end
      it 'priceが空では登録できない' do
        @product.price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include ("Price can't be blank")
      end
      it 'priceが¥300より少ない時は登録できない' do
        @product.price = '299'
        @product.valid?
        expect(@product.errors.full_messages).to include ("Price must be greater than or equal to 300")
      end
      it 'priceが¥9999999より多い時は登録できない' do
        @product.price = '10_000_000'
        @product.valid?
        expect(@product.errors.full_messages).to include ("Price must be an integer")
      end
      it '価格に半角数字以外が含まれている場合は出品できない' do
        @product.price = '０'
        @product.valid?
        expect(@product.errors.full_messages).to include ("Price is not a number")
      end
      it 'userが紐付いていなければ出品できない' do
        @product.user = nil
        @product.valid?
        expect(@product.errors.full_messages).to include ("User must exist")
      end
    end
  end

end
