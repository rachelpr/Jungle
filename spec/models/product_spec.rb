require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it "Saves a product" do
      @category = Category.new(name: "Flowers")
      @product = Product.new(name:"Flowers",  price_cents: 300, quantity: 5, category: @category)
      @product.save
      expect(@product.save).to be true
    end
    it "validates product name" do
      @category = Category.new(name: "Flowers")
      @product = Product.new(name: nil, price_cents: 500, quantity: 3, category: @category)
      @product.save
     expect(@product.errors.full_messages).to include("Name can't be blank")
    end
    it "validates product quantity" do
      @category = Category.new(name: "Flowers")
      @product = Product.new(name: "Flowers", price_cents: 500, quantity: nil, category: @category)
      @product.save
     expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end
    it "validates product price" do
      @category = Category.new(name: "Flowers")
      @product = Product.new(name: "Flowers", price_cents: nil, quantity: 3, category: @category)
      @product.save
     expect(@product.errors.full_messages).to include("Price can't be blank")
    end
    it "validates product category" do
      @category = Category.new(name: "Flowers")
      @product = Product.new(name: "Flowers", price_cents: 500, quantity: 3, category: nil)
      @product.save
     expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end