class AddEmployerToCompany < ActiveRecord::Migration[5.0]
  def change
    add_reference :companies, :employer, foreign_key: true,:after=>"id"
  end
end
