require_relative 'repository'

module Fitter
  module Repositories
    class ExerciseTypeRepo < Repository[:exercise_types]
      commands :create, use: :timestamps,
        plugins_options: {
          timestamps: {
            timestamps: %i(created_at updated_at)
          }
        }

      def ids_by_user(user)
        exercise_types.where(user_id: user.id).
          order(:created_at).
          pluck(:id)
      end
    end
  end
end
