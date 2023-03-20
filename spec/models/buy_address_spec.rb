require 'rails_helper'

RSpec.describe BuyAddress, type: :model do
  describe '配送先情報の保存' do
    before do
      user = FactoryBot.create(:user)
      product = FactoryBot.create(:product)
      @buy_address = FactoryBot.build(:buy_address, user_id: user.id, product_id: product.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@buy_address).to be_valid
      end

      it "tokenがあれば保存ができること" do
        expect(@buy_address).to be_valid
      end

      it "building_nameが空でも購入ができること" do
        expect(@buy_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_codeが空だと保存できないこと' do
        @buy_address.post_code = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @buy_address.post_code = '1234567'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it 'prefecture_idが空だと保存できないこと' do
        @buy_address.prefecture_id = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'municipalityが空だと保存できないこと' do
        @buy_address.municipality = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Municipality can't be blank")
      end

      it 'addressが空だと保存できないこと' do
        @buy_address.address = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Address can't be blank")
      end

      it 'phone_numberが空だと保存できないこと' do
        @buy_address.phone_number = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberは10桁以上11桁以内の半角数値のみ保存可能なこと' do
        @buy_address.phone_number = '０００００'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Phone number is invalid")
      end

      it 'phone_numberは9桁以下では保存できないこと' do
        @buy_address.phone_number = '000000000'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Phone number is invalid")
      end

      it 'phone_numberは12桁以上では保存できないこと' do
        @buy_address.phone_number = '000000000000'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Phone number is invalid")
      end

      it 'phone_numberに半角数字以外が含まれている場合は購入できないこと' do
        @buy_address.phone_number = '１１１'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Phone number is invalid")
      end

      it "tokenが空では登録できないこと" do
        @buy_address.token = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'userが紐付いていないと保存できないこと' do
        @buy_address.user_id = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("User can't be blank")
      end

      it 'productが紐付いていないと保存できないこと' do
        @buy_address.product_id = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Product can't be blank")
      end
    end
  end
end
