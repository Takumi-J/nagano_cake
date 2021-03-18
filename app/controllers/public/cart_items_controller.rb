class Public::CartItemsController < ApplicationController

  def index
    @customer = current_customer
    @cart_items = @customer.cart_items
    @sum = 0
    @cart_items.each do |f|
      @sum += f.item.price*f.amount
    end
  end

  def update
    @ca = CartItem.find(params[:id])
    if @cart_item.update(cart_item_params)
      flash[:notice]="変更しました"
    end
    
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def delete_all
    @customer = current_customer
    @customer.cart_items.destroy_all
    redirect_to cart_items_path
  end

  def create
      @item = Item.find(params[:item_id])
      @cart_item = CartItem.new(cart_item_params)
      @cart_item.customer_id = current_customer.id
      @cart_item.item_id = @item.id


       if @cart_item.amount == nil
         flash[:notice]="個数を入力してください"
         redirect_to item_path(params[:item_id])
       elsif
         current_customer.cart_items.find_by(item_id: @item.id).present?
         current_customer.cart_items.find_by(item_id: @item.id).update( amount: current_customer.cart_items.find_by(item_id: @item.id).amount += @cart_item.amount)
         redirect_to cart_items_path
       else
         @cart_item.save
         redirect_to cart_items_path
       end
  end

    private

  def cart_item_params
    params.require(:cart_item).permit(:amount,:id)
  end

end




