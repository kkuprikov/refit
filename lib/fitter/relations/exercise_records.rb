module Fitter
  module Relations
    class ExerciseRecords < ROM::Relation[:sql]
      schema(:exercise_records, infer: true) do
        associations do
          belongs_to :exercise_types, as: :exercise_type
          belongs_to :users, as: :user
          belongs_to :steps, as: :step
        end
      end
    end
  end
end