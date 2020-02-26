module Fitter
  module Entities
    class ExerciseType < ROM::Struct
      attribute :id, Dry::Types['integer']
      attribute :name, Dry::Types['string']
      attribute :current_step_id, Dry::Types['integer']
    end
  end
end
