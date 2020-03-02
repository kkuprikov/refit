module Fitter
  module Web
    Router = Hanami::Router.new(namespace: Controllers) do
      get '/exercise_types', to: 'exercise_types#index'
      get '/exercise_types/new', to: 'exercise_types#new'
      post "/exercise_types", to: 'exercise_types#create'
      put "/exercise_types/:exercise_type_id/upgrade", to: 'exercise_types#upgrade'
      put "/exercise_types/:exercise_type_id/downgrade", to: 'exercise_types#downgrade'
      
      get "/exercise_types/:exercise_type_id/new_record", to: 'exercise_records#new'
      post "/exercise_types/:exercise_type_id/new_record", to: 'exercise_records#create'
    end
  end
end