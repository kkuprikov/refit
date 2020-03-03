require_relative '../view'

module ExerciseRecords
  class New < Fitter::View

    def form
      form_for :exercise_record, "/exercise_types/#{exercise_type_id}/new_record" do
        div class: 'form-group row' do
          div class: 'col-sm-2' do
            label :date, class: 'col-form-label'
            date_field :date, class: 'form-control'
          end
        end
      

        div class: 'form-group row' do
          div class: 'col-sm-1 col-sm-offset-4' do
            label :repetitions, class: 'col-form-label'
            div class: 'input-group entry' do
              number_field :repetitions, name: 'exercise_record[repetitions][]', class: 'form-control', min: 1, max: 100, step: 1, required: true
              span class: 'input-group-btn' do
                button class: 'btn btn-success btn-md btn-add', type: 'button' do
                  i class: 'fa fa-plus'
                end
              end
            end
          end
        end

        submit 'Create', class: 'btn btn-primary'
      end
    end
  end
end
