module Fitter
  module Relations
    class Users < ROM::Relation[:sql]
      schema(:users, infer: true) do
        associations do
          has_many :exercise_types
          has_many :exercise_records
        end
      end
    end
  end
end