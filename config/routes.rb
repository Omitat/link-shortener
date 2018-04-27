Rails.application.routes.draw do
  resources :minimus
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "redirect/:sid" => "minimus#sendme"
end
