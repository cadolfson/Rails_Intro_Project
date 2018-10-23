class Family < ApplicationRecord
  belongs_to :house
  has_many :people, dependent: :destroy
  has_many :dogs, dependent: :destroy
end
