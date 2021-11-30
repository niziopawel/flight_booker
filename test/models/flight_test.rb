# == Schema Information
#
# Table name: flights
#
#  id                   :bigint           not null, primary key
#  flight_duration      :integer
#  flight_start         :datetime
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  arrival_airport_id   :bigint           not null
#  departure_airport_id :bigint           not null
#
# Indexes
#
#  index_flights_on_arrival_airport_id    (arrival_airport_id)
#  index_flights_on_departure_airport_id  (departure_airport_id)
#
# Foreign Keys
#
#  fk_rails_...  (arrival_airport_id => airports.id)
#  fk_rails_...  (departure_airport_id => airports.id)
#
require "test_helper"

class FlightTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
