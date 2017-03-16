class CreateExperiences < ActiveRecord::Migration[5.0]
  def change
    create_table :experiences do |t|
      t.integer :user_id
      t.string :designation
      t.string :company
      t.string :working_since_year
      t.string :working_since_month
      t.string :location
      t.string :notice
      t.string :skills

      t.timestamps
    end
  end
end
