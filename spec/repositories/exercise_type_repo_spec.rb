require 'spec_helper'

RSpec.describe Fitter::Repositories::ExerciseTypeRepo do
  describe '#create' do
    let(:exercise_type) { subject.create(name: 'Push-Ups') }

    it 'should create a user' do

      expect(exercise_type).to be_a(Fitter::Entities::ExerciseType)
      expect(exercise_type.id).not_to be_nil
      expect(exercise_type.name).to eq('Push-Ups')
      expect(exercise_type.created_at).not_to be_nil
      expect(exercise_type.updated_at).not_to be_nil
    end
  end

  describe '#ids_by_user' do
    #TODO
  end
end