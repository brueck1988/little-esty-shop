require 'rails_helper'

RSpec.describe 'As a visitor' do
  before(:each) do

    @merchant_1 = create(:merchant)
    
    @item_1 = create(:item, merchant: @merchant_1)
    @item_2 = create(:item, merchant: @merchant_1)
    @item_3 = create(:item, merchant: @merchant_1)
    @item_4 = create(:item, merchant: @merchant_1)
    @item_5 = create(:item, merchant: @merchant_1)
    @item_6 = create(:item, merchant: @merchant_1)

    @customer_1 = create(:customer)
    @customer_2 = create(:customer)
    @customer_3 = create(:customer)
    @customer_4 = create(:customer)
    @customer_5 = create(:customer)
    @customer_6 = create(:customer)

    @invoice_1 = create(:invoice)
    @invoice_2 = create(:invoice)
    @invoice_3 = create(:invoice)
    @invoice_4 = create(:invoice)
    @invoice_5 = create(:invoice)

    @invoice_item_1 = create(:invoice_item, item: @item_1, invoice: @invoice_1)
    @invoice_item_2 = create(:invoice_item, item: @item_2, invoice: @invoice_2)
    @invoice_item_3 = create(:invoice_item, item: @item_3, invoice: @invoice_3)
    @invoice_item_4 = create(:invoice_item, item: @item_4, invoice: @invoice_4)
    @invoice_item_5 = create(:invoice_item, item: @item_5, invoice: @invoice_5)

    @transaction_1 = create(:transaction)
    @transaction_2 = create(:transaction)
    @transaction_3 = create(:transaction)
    @transaction_4 = create(:transaction)
    @transaction_5 = create(:transaction)
    @invoice_1.transactions << [@transaction_1, @transaction_2, @transaction_3, @transaction_4, @transaction_5]

    @transaction_6 = create(:transaction)
    @transaction_7 = create(:transaction)
    @transaction_8 = create(:transaction)
    @transaction_9 = create(:transaction)
    @invoice_2.transactions << [@transaction_6, @transaction_7, @transaction_8, @transaction_9]

    @transaction_10 = create(:transaction)
    @transaction_11 = create(:transaction)
    @transaction_12 = create(:transaction)
    @invoice_3.transactions << [@transaction_10, @transaction_11, @transaction_12]

    @transaction_13 = create(:transaction)
    @transaction_14 = create(:transaction)
    @invoice_4.transactions << [@transaction_13, @transaction_14]

    @transaction_15 = create(:transaction)
    @invoice_5.transactions << [@transaction_15]

    @invoice_item_1 = create(:invoice_item)
    @invoice_item_2 = create(:invoice_item)

    require "pry"; binding.pry
    visit "/merchants/#{@merchant_1.id}/dashboard"
  end

  describe 'I visit a merchant dashboard' do
    it "Then I see the name of my merchant" do
      expect(page).to have_content(@merchant_1.name)
    end
  end

  describe 'merchant dashboard links' do
    it "to merchant invoices index" do
      expect(page).to have_content("Merchant Invoices Index")

      click_link("Merchant Invoices Index")
      expect(page).to have_current_path("/merchants/#{@merchant_1.id}/invoices")
    end
  end

  describe 'merchant dashboard links' do
    it "to merchant items index" do
      expect(page).to have_content("Merchant Items Index")

      click_link("Merchant Items Index")

      expect(page).to have_current_path("/merchants/#{@merchant_1.id}/items")
    end
  end

  describe 'merchant dashboard' do
    it "displays names of top 5 customers by number of succussful transactions" do
      expect(page).to have_content("Top 5 Customers")
      # expect(page).to have_content(@merchant_1.name)
    end
  end
end
