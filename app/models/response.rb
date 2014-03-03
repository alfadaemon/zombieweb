class Response < ActiveRecord::Base
  belongs_to :user
  belongs_to :answer

  validates :answer_id, presence: true
  validates :user_id, presence: true
end
