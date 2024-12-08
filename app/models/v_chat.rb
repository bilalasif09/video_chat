class VChat < ApplicationRecord
  has_secure_token length: 48
  validates_uniqueness_of :token
  has_many :v_participants
  belongs_to :user
end