require 'spec_helper'

RSpec.describe Fitter::Transactions::ExerciseRecords::NewExerciseRecord do
  let(:exercise_type_repo) { double(Fitter::Repositories::ExerciseTypeRepo) }
  
  let(:contract) { Fitter::Contracts::ExerciseRecords::NewExerciseRecord.new(exercise_type_repo: exercise_type_repo) }
  
  let(:exercise_type) { Fitter::Entities::ExerciseType.new(id: 1, name: "Pull-Ups", current_step_id: 2) }
  
  subject { described_class.new(new_exercise_record: contract) }

  context "with valid input" do
    let(:input) do
      {
        exercise_type_id: exercise_type.id
      }
    end

    it "should succeed" do
      expect(exercise_type_repo).to receive(:by_id) { exercise_type }
      
      result = subject.call(input)
      expect(result).to be_success
    end
  end

  context "with invalid input" do
    let(:input) do
      {
        exercise_type_id: exercise_type.id + 1
      }
    end

    it "should fail" do
      expect(exercise_type_repo).to receive(:by_id) { nil }
      
      result = subject.call(input)
      expect(result).to be_failure
    end
  end
end