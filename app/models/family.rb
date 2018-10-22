class Family < ApplicationRecord
  belongs_to :house
  has_many :person
end
