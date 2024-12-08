class VParticipant < ApplicationRecord
  belongs_to :v_chat
  belongs_to :user
end