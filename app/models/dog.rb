class Dog < ApplicationRecord
  belongs_to :family
  has_many :people, :through => :families
end
