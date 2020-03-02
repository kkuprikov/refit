module Fitter
  module Transactions
    module ExerciseTypes
      class CreateExerciseRecord
        include Dry::Monads[:result]
        include Dry::Monads::Do.for(:call)

        include Import["contracts.exercise_types.create_exercise_record"]
        include Import["repositories.exercise_record_repo"]

        def call(input)
          values = yield validate(input)
          exercise_type = yield persist(values)

          Success(exercise_record)
        end

        def validate(params)
          create_exercise_record.call(params).to_monad
        end

        def persist(result)
          Success(exercise_record_repo.create(result.values[:exercise_record]))
        end
      end
    end
  end
end