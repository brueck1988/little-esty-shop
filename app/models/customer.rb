class Customer < ApplicationRecord
  validates_presence_of :first_name
  validates_presence_of :last_name

  has_many :invoices

  def self.top_5_by_transaction_count
    joins(invoices: :transactions)
    .where(transactions: {result: 1})
    .group(:id)
    .select("customers.*, count(transactions.id) as successful_transaction_count")
    .order(successful_transaction_count: :desc)
    .limit(5)
  end
end
