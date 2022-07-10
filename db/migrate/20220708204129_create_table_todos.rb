class CreateTableTodos < ActiveRecord::Migration[6.1]
    def change
      create_table :todos do |t|
        t.string :description
        t.references :plan, null: false, foreign_key: true
        t.timestamps
      end
    end
  end