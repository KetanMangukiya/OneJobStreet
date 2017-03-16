class AddExperianceToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :hasexp, :boolean
  end
end
