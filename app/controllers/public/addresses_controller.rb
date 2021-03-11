class Public::AddressesController < ApplicationController

  def index
    @address = Address.new
    @customer = current_customer
    @addresses = @customer.addresses
  end

  def edit
    @address = Address.find(params[:id])
    @customer = @address.customer
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
     flash[:notice] ="新しい配送先が登録されました."
    end
     redirect_to "/addresses"
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      flash[:notice]="変更内容を保存しました"
      redirect_to "/addresses"
    else
      render "edit"
    end
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to "/addresses"
  end

   private

  def address_params
    params.require(:address).permit(:id, :postal_code, :address, :name)
  end

end

