module Fitter
  module Web
    module Controllers
      module ExerciseTypes
        class Upgrade
          include Hanami::Action
          include Import["transactions.exercise_types.upgrade_exercise_type"]
          include Dry::Monads[:result]

          def call(params)
            case upgrade_exercise_type.call(params.to_h)
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