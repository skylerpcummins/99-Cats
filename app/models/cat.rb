class Cat < ActiveRecord::Base
include CatHelper

  validates :birth_date, :name, presence: true
  validates :color, inclusion: {in: COLORS, message: "%{value} is not a valid color"},
    presence: true
  validates :sex, inclusion: {in: %w(M F), message: "%{value} is not a valid sex"},
    presence: true

  def age
    (DateTime.now - self.attributes["birth_date"]).to_f
  end
end
