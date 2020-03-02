# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :exercise_records do
      primary_key :id

      foreign_key :user_id
      foreign_key :exercise_type_id
      foreign_key :step_id
      
      column :level, Integer
      column :result, 'json', null: false
      column :date, Date, null: false
      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
