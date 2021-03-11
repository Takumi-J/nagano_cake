class Admin::GenresController < ApplicationController
  def index
    @genre = Genre.new
    @genres = Genre.all
  end
  
  def create
    @genre = Genre.new(genre_params)
    if @genre.save
     flash[:notice] ="新しいジャンルが登録されました."
    end
     redirect_to admin_genres_path
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
    @genre = Genre.find(params[:id])
    @genre.destroy
    redirect_to admin_genres_path
  end
  
  
    private

  def genre_params
    params.require(:genre).permit(:id,:name)
  end

  
end
