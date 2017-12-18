Rails.application.routes.draw do

root 'homes#index'

 resources :courses do 
    member do
      put "like" =>"courses#upvote"
      put "unlike" =>"courses#downvote"
    end
  end

authenticated :user do
  end


unauthenticated :user do
    devise_scope :user do
      get "/" => "devise/sessions#new"
    end
  end

  resources :conversations do
  resources :messages
  end

  resources :courses do 
     resources :comments
   end

  resources :messages
  resources :conversations
  resources :courses
  resources :commenters
  resources :authors
  resources :searches


 devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :homes

  resources :users

  resources :images

  


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

