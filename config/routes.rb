Sv::Application.routes.draw do
  resources :videos do
    member do
      get :sendfile
    end
  end
  match '/' =>  redirect("/videos/1")

end
