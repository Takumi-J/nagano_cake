Rails.application.routes.draw do


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  scope module: :public do

    root to: "homes#top"
    get     "/about"                    => "homes#about"

    resources :items, only: [:show, :index] do
      resources :cart_items, only: [:create]
    end

    get     "/customers/mypage"         => "customers#show"
    patch   "/customers"                => "customers#update"
    get     "/customers/edit"           => "customers#edit"
    get     "/customers/delete_check"   => "customers#delete_check"
    patch   "/customers/delete"         => "customers#delete"

    resources :addresses,only: [:index, :edit, :create, :update, :destroy]

    delete  "/cart_items/delete"        =>"cart_items#delete_all"

    resources :cart_items,only: [:index, :destroy, :update]


    post    "/orders/check"     => "orders#check"
    get     "/orders/thanks"    => "orders#thanks"
    patch   "/orders/complete"  => "orders#complete"

    resources :orders,only: [:index, :show, :new]
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
    get "/" => "homes#top"
    resources :items
    resources :genres,only: [:index, :edit, :create, :update, :destroy]
    resources :customers,only: [:index, :show, :edit, :update, :destroy]
    resources :orders,only: [:show, :update]
    resources :order_details,only: [:update]
  end

end
