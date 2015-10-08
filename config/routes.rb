Agitracker::Application.routes.draw do

  mount RailsI18nterface::Engine => "/translate", :as => "translate_engine"
  
  devise_for :users

  namespace :admin, :as => 'admin' do
    resources :pages, :users
  end

  get '/pages/:name' => 'pages#show', :as => "page"

  root :to => 'pages#show', :name => "home"

end
