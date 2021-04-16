require 'rails_helper'

RSpec.describe 'when I visit the admin dashboard' do
  it 'displays header indicating that I am on the dashboard' do
    visit '/admin'
    expect(page).to have_content("Admin Dashboard")
  end

  it 'shows a link to the admin merchants index' do
    visit '/admin'
    expect(page).to have_link('Admin Merchants Index', href: admin_merchants_path)
  end

  it 'shows a link to the admin invoices index' do
    visit '/admin'
    expect(page).to have_link('Admin Invoices Index', href: admin_invoices_path)
  end

  describe 'Top Customers' do
    before(:each) do
    @customer_1 = FactoryBot.create(:customer)
    @customer_2 = FactoryBot.create(:customer)
    @customer_3 = FactoryBot.create(:customer)
    @customer_4 = FactoryBot.create(:customer)
    @customer_5 = FactoryBot.create(:customer)
    @customer_6 = FactoryBot.create(:customer)

    @invoice_1 = FactoryBot.create(:invoice)
    @invoice_2 = FactoryBot.create(:invoice)
    @invoice_3 = FactoryBot.create(:invoice)
    @invoice_4 = FactoryBot.create(:invoice)
    @invoice_5 = FactoryBot.create(:invoice)
    @invoice_6 = FactoryBot.create(:invoice)
    @customer_1.invoices << [@invoice_1]
    @customer_2.invoices << [@invoice_2]
    @customer_3.invoices << [@invoice_3]
    @customer_4.invoices << [@invoice_4]
    @customer_5.invoices << [@invoice_5]
    @customer_6.invoices << [@invoice_6]

    @transaction_1 = FactoryBot.create(:transaction, result: 1)
    @transaction_2 = FactoryBot.create(:transaction, result: 1)
    @transaction_3 = FactoryBot.create(:transaction, result: 1)
    @transaction_4 = FactoryBot.create(:transaction, result: 1)
    @transaction_5 = FactoryBot.create(:transaction, result: 1)
    @invoice_1.transactions << [@transaction_1, @transaction_2, @transaction_3, @transaction_4, @transaction_5]

    @transaction_6 = FactoryBot.create(:transaction, result: 1)
    @transaction_7 = FactoryBot.create(:transaction, result: 1)
    @transaction_8 = FactoryBot.create(:transaction, result: 1)
    @transaction_9 = FactoryBot.create(:transaction, result: 1)
    @invoice_2.transactions << [@transaction_6, @transaction_7, @transaction_8, @transaction_9]

    @transaction_10 = FactoryBot.create(:transaction, result: 1)
    @transaction_11 = FactoryBot.create(:transaction, result: 1)
    @transaction_12 = FactoryBot.create(:transaction, result: 1)
    @invoice_3.transactions << [@transaction_10, @transaction_11, @transaction_12]

    @transaction_13 = FactoryBot.create(:transaction, result: 1)
    @transaction_14 = FactoryBot.create(:transaction, result: 1)
    @invoice_4.transactions << [@transaction_13, @transaction_14]

    @transaction_15 = FactoryBot.create(:transaction, result: 1)
    @invoice_5.transactions << [@transaction_15]
  end
    it 'shows top 5 customers and count of their successful transactions' do
      visit '/admin'

      within "#customer-#{@customer_1.id}" do
        expect(page).to have_content(@customer_1.first_name)
        expect(page).to have_content(@customer_1.last_name)
        expect(page).to have_content(5)
      end

      within "#customer-#{@customer_2.id}" do
        expect(page).to have_content(@customer_2.first_name)
        expect(page).to have_content(@customer_2.last_name)
        expect(page).to have_content(4)
      end

      within "#customer-#{@customer_3.id}" do
        expect(page).to have_content(@customer_3.first_name)
        expect(page).to have_content(@customer_3.last_name)
        expect(page).to have_content(3)
      end

      within "#customer-#{@customer_4.id}" do
        expect(page).to have_content(@customer_4.first_name)
        expect(page).to have_content(@customer_4.last_name)
        expect(page).to have_content(2)
      end

      within "#customer-#{@customer_5.id}" do
        expect(page).to have_content(@customer_5.first_name)
        expect(page).to have_content(@customer_5.last_name)
        expect(page).to have_content(1)
        save_and_open_page
      end
    end
  end
end
