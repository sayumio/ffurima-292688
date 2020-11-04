require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test_image.png')
  end

  describe '商品出品機能' do
    context '商品出品がうまくいくとき' do
      it 'image, name, description, price, category_id, status_id, freight_id, ship_region_id, ship_date_idが存在すれば出品できる' do
        expect(@item).to be_valid
      end

      it 'priceが¥300~¥9,999,999の間であれば出品できる' do
        @item.price = '1000'
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it 'imageが空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'nameが空だと出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'descriptionが空だと出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include( "Description can't be blank")
      end

      it 'status_idが空だと出品できない' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include( "Status can't be blank")
      end

      it 'freight_idが空だと出品できない' do
        @item.freight_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include( "Freight can't be blank")
      end

      it 'ship_region_idが空だと出品できない' do
        @item.ship_region_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include( "Ship region can't be blank")
      end

      it 'ship_date_idが空だと出品できない' do
        @item.ship_date_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include( "Ship date can't be blank")
      end

      it 'priceが空だと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include( "Price is not included in the list" )
      end

      it 'priceが¥300以下だと出品できない' do
        @item.price = '100'
        @item.valid?
        expect(@item.errors.full_messages).to include( "Price is not included in the list" )
      end

      it 'priceが¥9,999,999以上だと出品できない' do
        @item.price = '100000000'
        @item.valid?
        expect(@item.errors.full_messages).to include( "Price is not included in the list" )
      end

      it 'priceが全角数字だと出品できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include( "Price is not included in the list" )
      end
    end
  end
end
