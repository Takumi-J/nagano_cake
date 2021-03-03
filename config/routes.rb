Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :customers
  
  resources :customers
  
  scope module: :public do
   root to: "homes#top"
   get "/about" => "homes#about"
  end
end
