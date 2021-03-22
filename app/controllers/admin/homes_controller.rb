class Admin::HomesController < ApplicationController
  
  def top
    if params[:c].blank?
      @orders = Order.all.page(params[:page]).order('created_at DESC')
    
    elsif Customer.find_by(id: params[:c])
      @customer = Customer.find(params[:c])
      @orders = @customer.orders.page(params[:page])
      
    else
     redirect_to admin_path
    end
  end
  
end
