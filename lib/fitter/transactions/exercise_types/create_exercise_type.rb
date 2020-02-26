module Fitter
  module Transactions
    module ExerciseTypes
      class CreateExerciseType
        include Dry::Monads[:result]
        include Dry::Monads::Do.for(:call)

        include Import["contracts.exercise_types.create_exercise_type"]
        include Import["repositories.exercise_type_repo"]

        def call(input)
          values = yield validate(input)
          exercise_type = yield persist(values)

          Success(exercise_type)
        end

        def validate(params)
          create_exercise_type.call(params).to_monad
        end

        def persist(result)
          Success(exercise_type_repo.create(result.values))
        end
      end
    end
  end
end