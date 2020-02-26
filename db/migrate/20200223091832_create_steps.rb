# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :steps do
      primary_key :id

      foreign_key :exercise_type_id

      column :name, String, null: false
      column :description, String
      column :url, String
      column :index, Integer, null: false
      column :type, String, null: false # time or count
      column :progression, 'json', null: false
      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end