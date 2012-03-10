Oferts::Application.routes.draw do  
  namespace :ofert do
    get "all"=> "cupons#index", :as=> "all"
    get "/trabajos"=> "works#index", :as=> "trabajos"
    post "/trabajos"=> "works#index"
  end  
  root :to => 'home#index'
end
