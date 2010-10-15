STATIC_PAGES = %w(about home)
STATIC_REGEXP = %r{#{STATIC_PAGES.join("|")}}

Sv::Application.routes.draw do
  get "page/show"
  match ":page", :to => "page#show" ,:constraints => {:page => STATIC_REGEXP}
  root :to => "page#home"

  resources :video do
    match "video", :to => "video#index",:as => "video"
    member do
      get :download
    end
  end
  end

