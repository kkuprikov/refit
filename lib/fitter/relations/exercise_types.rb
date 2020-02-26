module Fitter
  module Relations
    class ExerciseTypes < ROM::Relation[:sql]
      schema(:exercise_types, infer: true) do
        associations do
          has_many   :steps
          belongs_to :users, as: :user
        end
      end
    end
  end
end
