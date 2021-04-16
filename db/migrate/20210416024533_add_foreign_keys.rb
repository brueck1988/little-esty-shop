class AddForeignKeys < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :invoices, :customers, column: :customer_id
    add_foreign_key :items, :merchants, column: :merchant_id
    add_foreign_key :transactions, :invoices, column: :invoice_id
  end
end
