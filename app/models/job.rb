class Job < ApplicationRecord
  belongs_to :company
  # attr_accessor :name,:skills
  belongs_to :job_type
  belongs_to :role
  # has_many :job_skills
  has_and_belongs_to_many :skills #, :through => :job_skills
  attr_reader :user_skills

  before_save do
    if start_date<Date.today && end_date > Date.today
      self.status="Active"
    else
      self.status="Deactive"
    end
  end

  def status
  if self.start_date<Date.today && self.end_date > Date.today
    self.status="Active"
  else
    self.status="Deactive"
  end
end



  def user_skills=(ids)
    self.skill_ids = ids.split(",")
  end

end
