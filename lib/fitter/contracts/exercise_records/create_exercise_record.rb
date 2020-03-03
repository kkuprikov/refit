module Fitter
  module Contracts
    module ExerciseRecords
      class CreateExerciseRecord < Dry::Validation::Contract
        params do
          required(:exercise_record).hash do
            required(:date).filled(:date)
            required(:repetitions).value(array[:integer], min_size?: 1).each(:int?)
          end
        end
      end
    end
  end
end