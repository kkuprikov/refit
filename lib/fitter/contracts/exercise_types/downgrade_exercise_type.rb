module Fitter
  module Contracts
    module ExerciseTypes
      class DowngradeExerciseType < Dry::Validation::Contract
        include Import["repositories.exercise_type_repo"]
        include Import["repositories.step_repo"]

        MIN_STEP = ENV.fetch('MIN_STEP'){ 1 }

        params do
          required(:exercise_type_id).filled(:integer)
        end

        rule(:exercise_type_id) do
          type = exercise_type_repo.by_id(value)
          if type
            step = step_repo.by_id(type.current_step_id)
            if step
              base.failure('failed to downgrade step') if step.index == MIN_STEP
            else
              base.failure("can't find current step for exercise type #{value}")
            end
          else
            key(:exercise_type_id).failure("can't find exercise type with id #{value}")
          end
        end
      end
    end
  end
end