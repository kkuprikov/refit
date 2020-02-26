require 'spec_helper'

RSpec.describe Fitter::Contracts::ExerciseTypes::DowngradeExerciseType do
  let(:exercise_type_repo) { double(Fitter::Repositories::ExerciseTypeRepo) }
  let(:exercise_type) { Fitter::Entities::ExerciseType.new(id: 1, name: "Pull-Ups", current_step_id: 2) }

  let(:step_repo) { double(Fitter::Repositories::StepRepo) }
  let(:step1) { Fitter::Entities::Step.new(id: 1, exercise_type_id: 1, index: 1, name: 'test') }
  let(:step10) { Fitter::Entities::Step.new(id: 2, exercise_type_id: 1, index: 10, name: 'test') }
  
  subject { described_class.new(exercise_type_repo: exercise_type_repo, step_repo: step_repo) }

  describe "step index validation" do
    let(:result) { subject.call(input) }

    describe 'upgrade step' do
      let(:input) do
        {
          exercise_type_id: exercise_type.id
        }
      end

      context 'on regular step' do
        it 'should succeed' do
          expect(exercise_type_repo).to receive(:by_id) { exercise_type }
          expect(step_repo).to receive(:by_id) { step10 }
          expect(result).to be_success
        end
      end

      context 'on first step' do
        it 'should fail' do
          expect(exercise_type_repo).to receive(:by_id) { exercise_type }
          expect(step_repo).to receive(:by_id) { step1 }
          expect(result).not_to be_success
        end
      end

      context 'on non-existing exercise_type_id' do
        let(:input) do
          {
            exercise_type_id: 2
          }
        end

        it 'should fail' do
          expect(exercise_type_repo).to receive(:by_id) { nil }
          expect(result).not_to be_success
        end
      end
    end
  end
end