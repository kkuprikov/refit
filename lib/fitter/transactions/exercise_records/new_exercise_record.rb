module Fitter
  module Transactions
    module ExerciseRecords
      class NewExerciseRecord
        include Dry::Monads[:result]
        include Dry::Monads::Do.for(:call)

        include Import["contracts.exercise_records.new_exercise_record"]

        def call(input)
          values = yield validate(input)

          Success(values)
        end

        def validate(params)
          new_exercise_record.call(params).to_monad
        end
      end
    end
  end
end