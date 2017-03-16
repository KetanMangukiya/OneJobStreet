class AddDetailsToEmployer < ActiveRecord::Migration[5.0]
  def change
    add_column :employers, :first_name, :string, limit: 20,:after=>'id'
    add_column :employers, :last_name, :string, limit: 20,:after=>'first_name'
    add_column :employers, :contact, :string, limit: 15,:after=>'last_name'
    add_column :employers, :company_name, :string,:after=>'contact'
    add_reference :employers, :role, foreign_key: true,:after=>'company_name'
  end
end
