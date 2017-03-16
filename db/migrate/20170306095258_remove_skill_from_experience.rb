class RemoveSkillFromExperience < ActiveRecord::Migration[5.0]
  def change
    remove_column :experiences, :skills, :string
  end
end
