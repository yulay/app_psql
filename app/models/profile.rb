class Profile < ApplicationRecord
  validates :name, presence: true
  validates :city, presence: true
  validates :country, presence: true
  validates :birth, presence: true
  validates :gender, presence: true
  validate :validate_gender

  belongs_to :user

  #Dar de alta a los roles en la aplicacion
  # :member -> pos 0, :admin -> pos 1, :superadmin -> pos 2
  enum role: [:member, :admin, :superadmin]

  after_create :set_role

  private

  def validate_gender
    # debugger
    # puts ' - '
    # puts self.gender
    # puts ' - '
    if self.gender != "Male" && self.gender != "Female"
      errors.add(:gender, "was specified incorrectrly")
    end
    # Lo anterior se puede hacer de la siguiente manera
    # unLess self.gender == 'Male' || self.gender == 'Female'
      # errors.add(:gender, "was specified incorrectrly")
    # end
  end

  def set_role
    self.update(role: 0)
  end
end
