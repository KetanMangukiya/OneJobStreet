class AddUserRefToSkill < ActiveRecord::Migration[5.0]
  def change
    add_reference :skills, :user, foreign_key: true
  end
end
