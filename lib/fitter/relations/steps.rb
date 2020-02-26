module Fitter
  module Relations
    class Steps < ROM::Relation[:sql]
      schema(:steps, infer: true) do
        associations do
          has_many   :exercise_records
          belongs_to :exercise_types, as: :exercise_type
        end
      end
    end
  end
end
