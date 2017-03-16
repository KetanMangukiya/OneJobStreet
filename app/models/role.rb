class Role < ApplicationRecord
  belongs_to :industry_type
  has_many :employers
end
