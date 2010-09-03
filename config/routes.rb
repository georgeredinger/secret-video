Sv::Application.routes.draw do
  resources :videos
  match '/' =>  redirect("/videos/1")
end
