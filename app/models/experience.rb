class Experience < ApplicationRecord
  belongs_to :user
  has_many :skills

  #validates :designation,:company,:location,:skills, presence: true
  #validates :email, :contactnumber, presence: true, uniqueness: true

  has_many :ownskills
  has_many :skills, through: :ownskills

  attr_reader :skills
  attr_accessor :skills


  def skills=(ids)
   self.skill_ids = ids.split(",")
 end

end
