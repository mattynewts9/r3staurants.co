class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
  has_many :reviews

  validates :start_date, :end_date, presence: true
  validate :end_date_after_start_date
  validates :start_date, presence: true # Ensure a booking date is provided
  validates :end_date, presence: true # Ensure a booking time is provided


  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
  end
end
