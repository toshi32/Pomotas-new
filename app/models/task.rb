class Task < ApplicationRecord
  validates :title, presence: true, length: { in: 1..100 }
  validates :content, presence: true, length: { in: 1..100 }
  validates :time_limit, presence: true
  has_many :labellings, dependent: :destroy
  has_many :labels, through: :labellings
  belongs_to :user
  validates :status, presence: true
  enum status: { notyet: 0, done: 1 }
end
