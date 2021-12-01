# == Schema Information
#
# Table name: bookings
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  flight_id  :bigint           not null
#
# Indexes
#
#  index_bookings_on_flight_id  (flight_id)
#
# Foreign Keys
#
#  fk_rails_...  (flight_id => flights.id)
#
class Booking < ApplicationRecord
  belongs_to :flight
  has_many :passengers
  accepts_nested_attributes_for :passengers
end
