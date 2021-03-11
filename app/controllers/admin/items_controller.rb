class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @items = Item.all
    @items = Item.page(params[:page])
  end

  def create
    @item = Item.new(item_params)
    if @item.save
     redirect_to admin_item_path(id: @item.id)
    else
      redirect_to new_admin_item_path
    end
  end

  def new
    @item = Item.new
    @genres = Genre.all
  end

  def edit
    @item = Item.find(params[:id])
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:notice]="変更内容を保存しました"
      redirect_to admin_item_path(id: @item.id)
    else
      render "edit"
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to "/admin/items"
  end


     private

  def item_params
    params.require(:item).permit(:id, :genre_id, :name, :image, :introduction, :price, :is_active)
  end


end
