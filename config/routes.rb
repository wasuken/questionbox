Rails.application.routes.draw do
  get 'answers/index', to: ''
  get 'answers/create'
  get 'answers/new'
  get 'questions/index'
  get 'questions/create'
  get 'questions/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
