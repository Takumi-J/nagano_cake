class Public::ItemsController < ApplicationController

  def index
    @items_all = Item.where(is_active: true)
    @items = Item.where(is_active: true).page(params[:page]).per(8)
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @item_tax = @item.price*1.1
  end

end
