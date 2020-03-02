require 'spec_helper'

RSpec.describe Fitter::Transactions::ExerciseTypes::UpgradeExerciseType do
  let(:exercise_type_repo) { double(Fitter::Repositories::ExerciseTypeRepo) }
  let(:step_repo) { double(Fitter::Repositories::StepRepo) }
  
  let(:contract) { Fitter::Contracts::ExerciseTypes::UpgradeExerciseType.new(exercise_type_repo: exercise_type_repo, step_repo: step_repo) }
  
  let(:exercise_type) { Fitter::Entities::ExerciseType.new(id: 1, name: "Pull-Ups", current_step_id: 1) }
  let(:updated_exercise_type) { Fitter::Entities::ExerciseType.new(id: 1, name: "Pull-Ups", current_step_id: 2) }

  let(:step1) { Fitter::Entities::Step.new(id: 1, exercise_type_id: 1, index: 1, name: 'test1') }
  let(:step2) { Fitter::Entities::Step.new(id: 2, exercise_type_id: 1, index: 2, name: 'test2') }
  
  subject { described_class.new(exercise_type_repo: exercise_type_repo, step_repo: step_repo, upgrade_exercise_type: contract) }

  context "with valid input" do
    let(:input) do
      {
        exercise_type_id: exercise_type.id
      }
    end

    it "upgrades exercise type to next step" do
      expect(exercise_type_repo).to receive(:by_id).twice { exercise_type }
      expect(exercise_type_repo).to receive(:update) { updated_exercise_type }
      expect(step_repo).to receive(:by_id).twice { step1 }
      expect(step_repo).to receive(:by_exercise_type_id_and_index) { step2 }
      
      result = subject.call(input)
      expect(result).to be_success
      expect(result.success).to eq(updated_exercise_type)
    end
  end
end