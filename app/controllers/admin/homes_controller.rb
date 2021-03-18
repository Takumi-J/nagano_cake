class Admin::HomesController < ApplicationController
  
  def top
    @orders = Order.all
    @customers = Customer.all
    @customers = Customer.page(params[:page])
  end
  
end
