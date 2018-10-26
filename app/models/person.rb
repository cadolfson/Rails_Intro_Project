class Person < ApplicationRecord
  belongs_to :family
  has_many :dogs, :through => :families
  validates :firstname, :lastname, presence: true

  def fullname
    self.firstname + " " + self.lastname
  end
end
