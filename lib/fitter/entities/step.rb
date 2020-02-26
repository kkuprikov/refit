module Fitter
  module Entities
    class Step < ROM::Struct
      attribute :id, Dry::Types['integer']
      attribute :exercise_type_id, Dry::Types['integer']
      attribute :name, Dry::Types['string']
      attribute :index, Dry::Types['integer']
    end
  end
end
