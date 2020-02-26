module Fitter
  module Contracts
    module ExerciseTypes
      class CreateExerciseType < Dry::Validation::Contract
        params do
          required(:name).filled(:string)
        end
      end
    end
  end
end