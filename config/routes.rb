Sv::Application.routes.draw do
  resources :videos do
    member do
      get :download
    end
  end
  match '/' =>  redirect("/videos")
end
