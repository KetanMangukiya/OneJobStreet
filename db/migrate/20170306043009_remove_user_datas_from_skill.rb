class RemoveUserDatasFromSkill < ActiveRecord::Migration[5.0]
  def change
    remove_reference :skills, :user, foreign_key: true
  end
end
