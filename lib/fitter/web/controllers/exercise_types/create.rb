module Fitter
  module Web
    module Controllers
      module ExerciseTypes
        class Create
          include Hanami::Action
          include Import["transactions.exercise_types.create_exercise_type"]
          include Dry::Monads[:result]

          def call(params)
            case create_exercise_type.call(params.to_h)
            in Success(result)
              self.body = result.to_h.to_json
              self.status = 200
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