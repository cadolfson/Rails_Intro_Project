class Person < ApplicationRecord
  belongs_to :family
  has_many :dogs, :through => :families
  validates :firstname, :lastname, presence: true

  def fullname
    self.firstname + " " + self.lastname
  end

  def age
    age = Date.today.year - self.birthdate.year
    age -= 1 if Date.today < self.birthdate + age.years
    return age
  end
end
