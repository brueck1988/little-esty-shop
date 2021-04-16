require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'relationships' do
    it { should have_many :invoices }
  end

  describe 'validations' do
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
  end

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

  describe 'class methods' do
    describe '::top_5_by_transaction_count' do
      it 'returns the top 5 customers by the count of transactions' do

        expect(Customer.top_5_by_transaction_count).to eq([@customer_1, @customer_2, @customer_3, @customer_4, @customer_5])
      end
    end
  end
end
