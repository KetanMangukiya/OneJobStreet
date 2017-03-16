class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|

      t.string :name, limit: 30
      t.string :website
      t.references :industry_type, foreign_key: true
      t.string :description
      t.string :address
      t.references :city, foreign_key: true
      t.string :contact
      t.string :email
      t.string :google_plus
      t.string :facebook
      t.string :linkedin

      t.timestamps
    end
  end
end
