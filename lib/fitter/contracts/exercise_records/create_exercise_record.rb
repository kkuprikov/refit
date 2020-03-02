module Fitter
  module Contracts
    module ExerciseRecords
      class CreateExerciseRecord < Dry::Validation::Contract
        params do
          required(:exercise_record).hash do
            required(:date).filled(:date)
            required(:result).filled(:string)
          end
        end
      end
    end
  end
end