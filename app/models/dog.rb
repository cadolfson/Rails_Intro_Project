class Dog < ApplicationRecord
  belongs_to :family
  has_many :people, :through => :families
  validates :name, :breed, presence: true
end
