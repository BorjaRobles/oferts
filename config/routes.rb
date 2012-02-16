Oferts::Application.routes.draw do
  get "home/index"
  
  namespace :ofert do
    get "all"=> "cupons#index", :as=> "all"
  end

  
  root :to => 'home#index'
end
