class AddContactpersonToJob < ActiveRecord::Migration[5.0]
  def change
    add_reference :jobs, :contact_person, foreign_key: true,:after=>'role_id'
  end
end
