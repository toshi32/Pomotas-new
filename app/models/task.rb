class Task < ApplicationRecord
  validates :title, presence: true, length: { in: 1..100 }
  validates :content, presence: true, length: { in: 1..100 }
  validates :time_limit, presence: true
  has_many :labellings, dependent: :destroy
  has_many :labels, through: :labellings
  belongs_to :user
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
