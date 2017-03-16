class Company < ApplicationRecord
  belongs_to :employer
  belongs_to :industry_type
  belongs_to :city
  has_many :contact_people
end
