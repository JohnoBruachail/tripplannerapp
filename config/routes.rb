Rails.application.routes.draw do
  get 'user/index'

  get 'user/show'

  get 'user/new'

  get 'user/edit'

  get 'trip/index'

  get 'trip/show'

  get 'trip/new'

  get 'trip/edit'

  get 'itinerary/index'

  get 'itinerary/show'

  get 'itinerary/new'

  get 'itinerary/edit'
  
  get 'test'  => 'emailprocessor#test'
  
  post 'initialize' => 'emailprocessor#initialize'
  
  post 'process' => 'emailprocessor#process'

  resources :users do
    resources :itinerary do
      resources :trip
    end
  end
  
  
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
