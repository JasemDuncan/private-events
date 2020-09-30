Rails.application.routes.draw do
  resources :events  
  # only: [:edit, :update, :show, :destory]
  # except:[delete]
  
  # get "/events" index
  # post "/events" create
  # delete"/events/:id" delete
  # get "/events/:id" show
  # get "/events/new" new
  # get "/events/:id/edit" edit
  # patch "/events/:id" update
  # put "/events/:id" update


  #get "special", to: "welcome#index"  #just rediring
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  #HTTP [protocol]
  #Verbs
  #GET POST PATCH PUT DELETE
end
