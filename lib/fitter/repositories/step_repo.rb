require_relative 'repository'

module Fitter
  module Repositories
    class StepRepo < Repository[:steps]
      commands update: :by_pk

      def by_exercise_type_id(type_id)
        steps.where(exercise_type_id: type_id).order(:index)
      end

      def by_exercise_type_id_and_index(type_id, index: 1)
        steps.where(exercise_type_id: type_id, index: index).one!
      end
    end
  end
end
