class Mark < ApplicationRecord
  belongs_to :user
  belongs_to :task

  validates :h_amount, presence: true
  validates :date, presence: true
end
