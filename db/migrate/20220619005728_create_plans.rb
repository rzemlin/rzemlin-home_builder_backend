class CreatePlans < ActiveRecord::Migration[6.1]
  def change
    create_table :plans do |t|
      t.string :description
      t.references :room, null: false, foreign_key: true
      t.timestamps
    end
  end
end
