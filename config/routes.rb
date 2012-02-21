Oferts::Application.routes.draw do
  get "works/index"
  get "home/index"
  
  namespace :ofert do
    get "all"=> "cupons#index", :as=> "all"
    get "/trabajos"=> "works#index"
    post "/trabajos"=> "works#index"
  end  
  root :to => 'home#index'
end
