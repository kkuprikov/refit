require_relative '../view'

module ExerciseTypes
  class New < Fitter::View

    def form
      form_for :exercise_type, '/exercise_types' do
        label :name
        text_field :name

        submit 'Create'
      end
    end
  end
end
