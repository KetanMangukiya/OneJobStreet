class CreateOwnskills < ActiveRecord::Migration[5.0]
  def change
    create_table :ownskills do |t|
      t.references :experience, foreign_key: true
      t.references :skill, foreign_key: true

      t.timestamps
    end
  end
end
