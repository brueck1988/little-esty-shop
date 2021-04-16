class Admin::DashboardController < ApplicationController
  def index
    @top_customers = Customer.top_5_by_transaction_count
  end
end
