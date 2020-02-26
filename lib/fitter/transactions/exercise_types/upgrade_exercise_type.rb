require 'pry'
module Fitter
  module Transactions
    module ExerciseTypes
      class UpgradeExerciseType
        include Dry::Monads[:result]
        include Dry::Monads::Do.for(:call)

        include Import["contracts.exercise_types.upgrade_exercise_type"]
        include Import["repositories.exercise_type_repo"]
        include Import["repositories.step_repo"]

        def call(input)
          values = yield validate(input)
          exercise_type = yield persist(values)

          Success(exercise_type)
        end

        def validate(params)
          upgrade_exercise_type.call(params).to_monad
        end

        def persist(result)
          type_id = result.values.to_h[:exercise_type_id]
          type = exercise_type_repo.by_id(type_id)

          step = step_repo.by_id(type.current_step_id)
          next_step = step_repo.by_exercise_type_id_and_index(type_id, index: step.index + 1)

          Success(exercise_type_repo.update(type_id, current_step_id: next_step.id))
        end
      end
    end
  end
end