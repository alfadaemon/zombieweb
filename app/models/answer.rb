class Answer < ActiveRecord::Base
  validates :answer, presence: true
  validates :question_id, presence: true
  belongs_to :question
end
