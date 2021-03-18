class Admin::OrdersController < ApplicationController
  
  def show
    @order = Order.find(params[:id])
  end
  
  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      flash[:notice]="変更しました"
    end
    
    redirect_to admin_order_path(@order.id)
  end
  
  
    private

  def order_params
    params.require(:order).permit(:status,:id)
  end
  
  
end
