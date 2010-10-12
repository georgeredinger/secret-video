Sv::Application.routes.draw do

  get "page/show"

  resources :videos do
    member do
      get :download
    end
  end
 # match '/' =>  redirect("/videos")
  match ":page", :to => "page#show"
  root :to => "page#show"
end
