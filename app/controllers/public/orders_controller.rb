class Public::OrdersController < ApplicationController

  def index
    @customer = current_customer
    @orders = current_customer.orders
  end

  def new
    @customer = current_customer
    
    if @customer.cart_items.count == 0
      flash[:notice] ="商品を入力してください"
      redirect_to cart_items_path
    end
    
    @addresses = current_customer.addresses
    @order = Order.new
    

  end

  def show
    @order = Order.find(params[:id])
    
  end

  def check
    @customer = current_customer
    @cart_items = @customer.cart_items

    @sum = 0
    @cart_items.each do |f|
      @sum += f.item.price*f.amount
    end

    @order = Order.new(order_params)
    @order.shipping_cost = 800

    if params[:radio] == "1"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name+current_customer.first_name

    elsif params[:radio] == "2"
      address = Address.find(params[:address_id])
      @order.postal_code = address.postal_code
      @order.address = address.address
      @order.name = address.name
      
    else
      if @order.postal_code or @order.address or @order.name == nul
      flash[:notice] ="空欄を入力してください"
      redirect_to new_order_path
      end
    end
    
  end

  def thanks
  end

  def complete
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id

    @order.save

    @customer = current_customer
    @cart_items = @customer.cart_items
    @sum = 0

    @cart_items.each do |cart_item|
      @sum += cart_item.item.price*cart_item.amount
      
      order_detail = @order.order_details.new
      order_detail.item_id = cart_item.item.id
      order_detail.price = cart_item.item.price
      order_detail.amount = cart_item.amount
      order_detail.save
    end



    current_customer.cart_items.destroy_all

    redirect_to orders_thanks_path
  end

        private

  def order_params
    params.require(:order).permit(:customer_id,:postal_code,:address,:name,:shipping_cost,:total_payment,:payment_method,:status)
  end

end
