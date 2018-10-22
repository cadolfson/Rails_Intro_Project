class Family < ApplicationRecord
  belongs_to :house
  has_many :people
  has_many :dogs
end
