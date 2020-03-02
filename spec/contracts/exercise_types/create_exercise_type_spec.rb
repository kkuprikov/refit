require 'spec_helper'

RSpec.describe Fitter::Contracts::ExerciseTypes::CreateExerciseType do
  describe "name precense" do
    let(:result) { subject.call(input) }

    context 'without name provided' do
      let(:input) do
        {
          exercise_type: {
            name: nil
          }
        }
      end

      it "is invalid" do
        expect(result).to be_failure
        expect(result.errors[:exercise_type][:name]).to include("must be filled")
      end
    end

    context 'with valid input' do
      let(:input) do
        {
          exercise_type: { 
            name: 'Pull-Ups' 
          }
        }
      end

      it 'is valid' do
        expect(result).to be_success
      end
    end
  end
end