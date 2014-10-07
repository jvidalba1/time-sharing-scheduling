class User < ActiveRecord::Base
  has_many :reservations

  validates :email, :presence => true
  # validate :email_have_to_be_unique

  def expiration_date_cannot_be_in_the_past
    if expiration_date.present? && expiration_date < Date.today
      errors.add(:expiration_date, "can't be in the past")
    end
  end

  def email_confirmed?
    self.confirmed
  end

  def email_unique?
    user = User.find_by_email(self.email)
    user ? false : true
  end
end
