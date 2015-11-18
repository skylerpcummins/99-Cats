class CatRentalRequest < ActiveRecord::Base
  validates :start_date, :end_date, :cat_id, presence: true

  validates :status, inclusion: {
    in: %w(PENDING APPROVED DENIED),
    message: "This is not a valid status"},
    presence: true

  def overlapping_requests(other_request)
    time_range = (start_date..end_date)

    cat_id == other_request.cat_id &&
      time_range.include?(other_request.start_date)
  end

  def overlapping_approved_requests(other_request)

  end
end
