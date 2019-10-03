Rails.application.routes.draw do
  resources :resources
  resources :tracks
  match "/" => "tracks#index", :via => [:get]
end
