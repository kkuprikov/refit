module Fitter
  module Web
    module Controllers
      module ExerciseTypes
        class Index
          include Hanami::Action
          include Import["repositories.exercise_type_repo"]

          def call(params)
            self.body = ::ExerciseTypes::Index.render(format: :html, exercise_types: exercise_type_repo.all.to_a)
          end
        end
      end
    end
  end
end