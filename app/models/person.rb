class Person < ApplicationRecord
  belongs_to :family
  has_many :dogs, :through => :families
  validates :firstname, :lastname, presence: true
end
