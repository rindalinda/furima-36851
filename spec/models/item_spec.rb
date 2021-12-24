require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品ができる' do
      it 'item_nameとexplain,category,status,charge,prefecture,sendday,priceが存在すればできる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品ができない' do
      it '商品画像が必須' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が必須' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it '商品説明が必須' do
        @item.explain = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explain can't be blank")
      end

      it 'カテゴリーが必須' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it '商品状態が必須' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end

      it '商品負担情報が必須' do
        @item.charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Charge can't be blank")
      end

      it '発送元情報が必須' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '発送期間が必須' do
        @item.send_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Send day can't be blank", 'Send day is not a number')
      end

      it '価格が必須' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'カテゴリーに「---」が選択されている場合は出品できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end

      it '商品の状態にに「---」が選択されている場合は出品できない' do
        @item.status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Status must be other than 1')
      end

      it '配送料の状態に「---」が選択されている場合は出品できない' do
        @item.charge_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Charge must be other than 1')
      end

      it '配送元の地域に「---」が選択されている場合は出品できない' do
        @item.prefecture_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 0')
      end

      it '発送までの日数に「---」が選択されている場合は出品できない' do
        @item.send_day_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Send day must be other than 1')
      end

      it '価格が全角だと登録できない' do
        @item.price = '５００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end

      it '価格が数字以外だと登録できない' do
        @item.price = 'fivehandred'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end

      it '価格が300円未満だと登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end

      it '価格が一千万円以上だと登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end

      it 'userが紐づいていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
