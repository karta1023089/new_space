Rails.application.routes.draw do

  # omniauth 認證
  # get'/auth/facebook/callback' , to: "user/omniauth_callbacks#callback"
  # get'/auth/google_oauth2/callback' , to: "user/omniauth_callbacks#callback"
  # get'/auth/line/callback' , to: "user/omniauth_callbacks#callback"

  # get '/auth/failure', to: "user/omniauth_callbacks#failure"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  
  namespace :admin do
    resource :session, controller: "session"
  end
  resource :admin, controller: "admin"

  namespace :home do 
    resources :news
    resources :projects
    resources :tickets
    get :contact
    get :about
    get :doc
  end
  resources :home

  namespace :backends do
    resource :system, controller: "system" do
      collection do
        get :index_youtube
      end
    end
    namespace :images do
      resources :main_ads
      resources :index_pics
    end
    resources :images do
      collection do
        post :sort
        post :ck_upload
        post :dropzone
      end
    end

    resources :group_images do 
      collection do 
        get :events_group
      end
    end
    resources :categories,:projects,:contents do
      collection do
        post :sort
      end
      member do 
        get :open
      end
    end
    # resources dry controllers
    resources :resources do
      collection do
        post :sort
      end
      member do
        post :event
      end
    end

  end
  resources :backends



  # 語言包管理
  resources :iye

end
