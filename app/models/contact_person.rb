class ContactPerson < ApplicationRecord
  belongs_to :company
  belongs_to :role
  has_many :jobs
end
