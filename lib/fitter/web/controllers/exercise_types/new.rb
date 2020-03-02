module Fitter
  module Web
    module Controllers
      module ExerciseTypes
        class New
          include Hanami::Action

          def call(params)
            self.body = ::ExerciseTypes::New.render({format: :html})
          end
        end
      end
    end
  end
end