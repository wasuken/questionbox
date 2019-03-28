Rails.application.routes.draw do
  devise_for :users
  get 'answers/index'
  get 'answers/create'
  get 'answers/new'
  get 'questions/index'
  get 'questions/create'
  get 'questions/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'questions#index'
end
