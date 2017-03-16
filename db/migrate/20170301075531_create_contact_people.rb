class CreateContactPeople < ActiveRecord::Migration[5.0]
  def change
    create_table :contact_people do |t|
      t.references :company, foreign_key: true
      t.string :first_name, limit: 20
      t.string :last_name, limit: 20
      t.string :contact, limit: 15
      t.string :email
      t.references :role, foreign_key: true

      t.timestamps
    end
  end
end
