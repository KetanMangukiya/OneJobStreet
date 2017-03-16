class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.references :company, foreign_key: true
      t.references :job_type, foreign_key: true
      t.references :role, foreign_key: true
      t.integer :vacancy
      t.string :description
      t.string :salary
      t.string :address
      t.string :experience
      t.date :start_date
      t.date :end_date
      t.string :qualification
      t.string :status, limit: 9

      t.timestamps
    end
  end
end
