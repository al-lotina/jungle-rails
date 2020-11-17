require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    context 'when all fields are set' do
      before do
        @category = Category.new(:id => 5, :name => "Outdoors")
        @product = Product.new(:name => "tent", :price_cents => 5000, :quantity => 20, :category_id => 5)
      end
      it 'saves successfully' do
        expect(@product.name).to include("tent")
      end
      #context 'when name field is empty' do
    end

    describe 'when required fields are blank' do
      before do
        @category = Category.new(:id => 6, :name => "Automotive")
      end
      context 'when name field is blank' do
        before do
          @product = Product.create(name: nil, price_cents: 5000, quantity: 20, category_id: 6)
        end
        it 'does not save and throws error' do
          expect(@product.errors.full_messages).to include("Name can't be blank")
        end
      end
      context 'when price field is blank' do
        before do
          @product = Product.create(name: "tent", price_cents: nil, quantity: 20, category_id: 6)
        end
        it 'does not save and throws error' do
          expect(@product.errors.full_messages).to include("Price can't be blank")
        end
      end
      context 'when quantity field is blank' do
        before do
          @product = Product.create(name: "tent", price_cents: 5000, quantity: nil, category_id: 6)
        end
        it 'does not save and throws error' do
          expect(@product.errors.full_messages).to include("Quantity can't be blank")
        end
      end
      context 'when category field is blank' do
        before do
          @product = Product.create(name: "tent", price_cents: 5000, quantity: 20, category_id: nil)
        end
        it 'does not save and throws error' do
          expect(@product.errors.full_messages).to include("Category can't be blank")
        end
      end
    end
  end
end

