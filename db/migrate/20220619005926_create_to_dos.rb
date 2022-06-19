class CreateToDos < ActiveRecord::Migration[6.1]
  def change
    create_table :to_dos do |t|
      t.string :description
      t.references :plan, null: false, foreign_key: true
      t.timestamps
    end
  end
end
