class Public::HomesController < ApplicationController
  def top
    @item_sumples = Item.where(is_active: true).order('created_at DESC').limit(4)
  end
  
  def about
  end
end
