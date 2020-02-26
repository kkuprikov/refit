require "web_helper"

RSpec.describe "/exercise_types" do
  let(:exercise_type_repo) { Fitter::Repositories::ExerciseTypeRepo.new }
  let(:step_repo) { Fitter::Repositories::StepRepo.new }
    
  let(:exercise_type) { exercise_type_repo.create(id: 1, name: "Pull-Ups", current_step_id: 1) }

  let(:step1) { step_repo.create(id: 1, exercise_type_id: 1, index: 2, name: 'test1', type: 'count', progression: []) }
  let(:step2) { step_repo.create(id: 2, exercise_type_id: 1, index: 3, name: 'test2', type: 'count', progression: []) }

  describe "POST /" do
    context "with valid input" do
      let(:input) do
        {
          name: "Push-Ups"
        }
      end

      it "succeeds" do
        post_json "/exercise_types", input
        expect(last_response.status).to eq(200)
        exercise = parsed_body
        expect(exercise["id"]).not_to be_nil
        expect(exercise["name"]).to eq("Push-Ups")
      end
    end
  end

  describe 'PUT /:id/upgrade' do
    before {step1; step2}
    context "with valid input" do
      it 'should succeed' do
        put_json "/exercise_types/#{exercise_type.id}/upgrade", {}
        expect(last_response.status).to eq(200)
        expect(parsed_body["current_step_id"]).to eq(step2.id)
      end
    end
  end

  describe 'PUT /:id/downgrade' do
    before do
      step1; step2
      exercise_type_repo.update(exercise_type.id, current_step_id: step2.id)
    end
    context "with valid input" do
      it 'should succeed' do
        put_json "/exercise_types/#{exercise_type.id}/downgrade", {}
        expect(last_response.status).to eq(200)
        expect(parsed_body["current_step_id"]).to eq(step1.id)
      end
    end
  end
end