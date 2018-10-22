class Person < ApplicationRecord
  belongs_to :family
  has_many :dogs, :through => :families
end
