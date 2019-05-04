Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  get '/no_food_meal', to: 'one_order#q1'
  get '/max_foods', to: 'one_order#q2'
  get '/other_food/:food_head', to: 'one_order#q3'
end
