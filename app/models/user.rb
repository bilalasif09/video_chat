class User < ApplicationRecord
  has_secure_token length: 48
  validates_uniqueness_of :token
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
  encrypts :password
  has_many :v_chats
  has_many :v_participants
  before_create :validation, if: ->(email) { email.present? }

  private
  def validation
    if User.where(deleted_at: nil).find_by_email(email).present?
      errors.add(:email, 'already exists')
      throw(:abort)
    end
    if password.length < 6
      errors.add(:password, 'must be atleast 6 characters long')
      throw(:abort)
    end
  end
end