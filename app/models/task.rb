class Task < ApplicationRecord
  validates :title, presence: true, length: { in: 1..50 }
  validates :content, presence: true
  validates :time_limit, presence: true
  validate :date_check
  def date_check
    errors.add(:time_limit, '過去の日付は入力できません') if time_limit.nil? || time_limit < Date.today
  end
  has_many :labellings, dependent: :destroy
  has_many :labels, through: :labellings
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :status, presence: true
  validates :status, inclusion: { in: %w(Notyet Done) }
  enum status: { Notyet: 0, Done: 1 }
  def toggle_status!
    if Notyet?
      Done!
    else
      Notyet!
    end
  end
end
