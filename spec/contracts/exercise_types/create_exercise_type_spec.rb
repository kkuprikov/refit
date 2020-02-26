require 'spec_helper'

RSpec.describe Fitter::Contracts::ExerciseTypes::CreateExerciseType do
  describe "name precense" do
    let(:result) { subject.call(input) }

    context 'without name provided' do
      let(:input) do
        {}
      end

      it "is invalid" do
        expect(result).to be_failure
        expect(result.errors[:name]).to include("is missing")
      end
    end

    context 'with valid input' do
      let(:input) do
        {
          name: 'Pull-Ups'
        }
      end

      it 'is valid' do
        expect(result).to be_success
      end
    end
  end
end