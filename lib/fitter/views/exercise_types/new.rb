require_relative '../view'

module Fitter
  module Views
    module ExerciseTypes
      class New < Fitter::View
        config.template = 'exercise_types/new'
      end
    end
  end
end