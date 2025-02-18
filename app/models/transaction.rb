class Transaction < ApplicationRecord
  belongs_to :invoice
  has_many :customers, through: :invoice
  
  enum result: [ :failed, :success ]
end
