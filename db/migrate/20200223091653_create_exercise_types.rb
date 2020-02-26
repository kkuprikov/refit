# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :exercise_types do
      primary_key :id
      foreign_key :user_id

      column :name, String, null: false
      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
      column :current_step_id, Integer
      column :workout_days, 'json'
    end
  end
end
