require_relative 'repository'

module Fitter
  module Repositories
    class UserRepo < Repository[:users]
      commands :create, use: :timestamps,
        plugins_options: {
          timestamps: {
            timestamps: %i(created_at updated_at)
          }
        }

      def find(id)
        users.by_pk(id).one
      end
    end
  end
end
