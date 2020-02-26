module Fitter
  module Web
    Router = Hanami::Router.new do
      post "/exercise_types", to: Controllers::ExerciseTypes::Create
      put "/exercise_types/:exercise_type_id/upgrade", to: Controllers::ExerciseTypes::Upgrade
      put "/exercise_types/:exercise_type_id/downgrade", to: Controllers::ExerciseTypes::Downgrade
    end
  end
end