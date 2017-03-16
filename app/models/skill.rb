class Skill < ApplicationRecord
  has_many :ownskills
  has_many :experiences, through: :ownskills
end
