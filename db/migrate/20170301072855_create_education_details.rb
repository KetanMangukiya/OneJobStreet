class CreateEducationDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :education_details do |t|
      t.string :qualification
      t.string :course
      t.string :specialization
      t.string :college
      t.string :course_type
      t.string :passing_year

      t.timestamps
    end
  end
end
