require_relative './upgrade_exercise_type'

module Fitter
  module Transactions
    module ExerciseTypes
      class DowngradeExerciseType < UpgradeExerciseType
        def persist(result)
          type_id = result.values.to_h[:exercise_type_id]
          type = exercise_type_repo.by_id(type_id)

          step = step_repo.by_id(type.current_step_id)
          next_step = step_repo.by_exercise_type_id_and_index(type_id, index: step.index - 1)

          Success(exercise_type_repo.update(type_id, current_step_id: next_step.id))
        end
      end
    end
  end
end