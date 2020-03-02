require 'spec_helper'

RSpec.describe Fitter::Contracts::ExerciseRecords::NewExerciseRecord do
  let(:exercise_type_repo) { double(Fitter::Repositories::ExerciseTypeRepo) }
  let(:exercise_type) { Fitter::Entities::ExerciseType.new(id: 1, name: "Pull-Ups", current_step_id: 2) }
  
  subject { described_class.new(exercise_type_repo: exercise_type_repo) }

  describe "exercise id validation" do
    let(:result) { subject.call(input) }

    describe 'upgrade step' do
      let(:input) do
        {
          exercise_type_id: exercise_type.id
        }
      end

      context 'on existing exercise type' do
        it 'should succeed' do
          expect(exercise_type_repo).to receive(:by_id) { exercise_type }
          expect(result).to be_success
        end
      end

      context 'on non-existing exercise type' do
        it 'should fail' do
          expect(exercise_type_repo).to receive(:by_id) { nil }
          expect(result).not_to be_success
        end
      end
    end
  end
end