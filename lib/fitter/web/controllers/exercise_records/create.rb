module Fitter
  module Web
    module Controllers
      module ExerciseRecords
        class Create
          include Hanami::Action
          include Import["transactions.exercise_records.create_exercise_record"]
          include Dry::Monads[:result]

          def call(params)
            case create_exercise_record.call(params.to_h)
            in Success(result)
              redirect_to '/exercise_records'
            in Failure(result)
              self.body = { errors: result.errors.to_h }.to_json
              self.status = 422
            end
          end
        end
      end
    end
  end
end