Rails.application.routes.draw do


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  scope module: :public do

    root to: "homes#top"
    get     "/about"                    => "homes#about"

    get     "/customers/mypage"         => "customers#show"
    patch   "/customers"                => "customers#update"
    get     "/customers/edit"           => "customers#edit"
    get     "/customers/delete_check"   => "customers#delete_check"
    patch   "/customers/delete"         => "customers#delete"

    resources :addresses,only: [:index, :edit, :create, :update, :destroy]
  end

  devise_for :customers, controllers: {
    sessions:      'customers/sessions',
    passwords:     'customers/passwords',
    registrations: 'customers/registrations'
}

  devise_for :admin, controllers: {
  sessions:      'admin/sessions',
  passwords:     'admin/passwords',
  registrations: 'admins/registrations'
}

  namespace :admin do
    resources :items
    resources :genres,only: [:index, :edit, :create, :update, :destroy]
  end

end
