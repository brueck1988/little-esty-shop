require 'csv'

namespace :csv_load do
  desc "Seed database with all csv files"
  task all: :environment do
    # Reset database
    InvoiceItem.destroy_all
    Transaction.destroy_all
    Item.destroy_all
    Invoice.destroy_all
    Customer.destroy_all
    Merchant.destroy_all

    CSV.foreach("db/data/merchants.csv", { encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all}) do |row|
      Merchant.create(row.to_hash)
    end

    CSV.foreach("db/data/customers.csv", { encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all}) do |row|
      Customer.create(row.to_hash)
    end

    CSV.foreach("db/data/invoices.csv", { encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all}) do |row|
      Invoice.create(row.to_hash)
    end

    CSV.foreach("db/data/items.csv", { encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all}) do |row|
      Item.create(row.to_hash)
    end

    CSV.foreach("db/data/invoice_items.csv", { encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all}) do |row|
      InvoiceItem.create(row.to_hash)
    end

    CSV.foreach("db/data/transactions.csv", { encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all}) do |row|
      Transaction.create(row.to_hash)
    end
  end
end
