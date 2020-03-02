module Fitter
  module Contracts
    module ExerciseRecords
      class NewExerciseRecord < Dry::Validation::Contract
        include Import["repositories.exercise_type_repo"]

        params do
          required(:exercise_type_id).filled(:integer)
        end

        rule(:exercise_type_id) do
          type = exercise_type_repo.by_id(value)
          unless type
            key(:exercise_type_id).failure("can't find exercise type with id #{value}")
          end
        end
      end
    end
  end
end