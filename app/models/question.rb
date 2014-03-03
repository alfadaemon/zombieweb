class Question < ActiveRecord::Base
  validates :question, presence: true
  validates :category_id, presence: true
  validates :level_id, presence: true
  validates_associated :level
  validates_associated :category
  belongs_to :level
  belongs_to :category
  has_many :answers
end
