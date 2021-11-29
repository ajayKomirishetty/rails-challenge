Rails.application.routes.draw do
  resources :courses
  root 'courses#index'
  match '/courses/copy_course', to: 'courses#copy_course',via: [ :post]
end