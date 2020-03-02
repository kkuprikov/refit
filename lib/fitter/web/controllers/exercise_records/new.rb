module Fitter
  module Web
    module Controllers
      module ExerciseRecords
        class New
          include Hanami::Action
          include Import["transactions.exercise_records.new_exercise_record"]
          include Dry::Monads[:result]

          def call(params)
            case new_exercise_record.call(params.to_h)
            in Success(result)
              self.status = 200
              self.body = ::ExerciseRecords::New.render({format: :html, exercise_type_id: params[:exercise_type_id]})
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