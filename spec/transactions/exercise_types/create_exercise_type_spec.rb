require 'spec_helper'

RSpec.describe Fitter::Transactions::ExerciseTypes::CreateExerciseType do
  let(:exercise_type_repo) { double(Fitter::Repositories::ExerciseTypeRepo) }
  let(:exercise_type) { Fitter::Entities::ExerciseType.new(id: 1, name: "Pull-Ups", current_step_id: 1) }

  subject { described_class.new(exercise_type_repo: exercise_type_repo) }

  context "with valid input" do
    let(:input) do
      {
        exercise_type: {
          name: "Pull-Ups"
        }
      }
    end

    it "creates an exercise type" do
      expect(exercise_type_repo).to receive(:create) { exercise_type }
      result = subject.call(input)
      expect(result).to be_success
      expect(result.success).to eq(exercise_type)
    end
  end

  context "with invalid input" do
    let(:input) do
      {
        exercise_type: {
          name: nil
        }
      }
    end

    it "does not create an exercise type" do
      expect(exercise_type_repo).not_to receive(:create)
      result = subject.call(input)
      expect(result).to be_failure
      expect(result.failure.errors[:exercise_type][:name]).to include("must be filled")
    end
  end
end