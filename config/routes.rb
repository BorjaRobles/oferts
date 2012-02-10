Oferts::Application.routes.draw do
  get "oferts/index"
  get "oferts/show"
  get "oferts/find"
  
  root :to => 'oferts#index'
end
