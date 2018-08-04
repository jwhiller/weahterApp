Rails.application.routes.draw do
root 'weather_controller#index'
get 'index' => 'weather_controller#index'

post 'index' => 'weather_controller#index'

get 'test' => 'weather_controller#test'
end
