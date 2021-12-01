# == Schema Information
#
# Table name: flights
#
#  id                   :bigint           not null, primary key
#  duration             :integer
#  scheduled_on         :datetime
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
class Flight < ApplicationRecord
  belongs_to :arrival_airport, class_name: 'Airport'
  belongs_to :departure_airport, class_name: 'Airport'
  has_many :bookings
  has_many :passengers, through: :bookings
  scope :upcoming, -> { where('scheduled_on >= ?', Date.today) }

  def formatted_date
    scheduled_on.strftime('%d-%m-%Y')
  end

  def formatted_time
    scheduled_on.strftime('%H:%M')
  end

  def formatted_duration
    hours = duration / 60
    minutes = duration % 60

    hours.zero? ? "#{minutes}min" : "#{hours}h #{minutes}min"
  end

  def self.search(search)
    flights = upcoming

    unless search.empty?
      flights = flights.where(departure_airport_id: search[:departure_airport_id],
                              arrival_airport_id: search[:arrival_airport_id])
    end

    unless search[:date].empty?
      formatted_date = Date.strptime(search[:date], '%Y-%m-%d').all_day
      flights = flights.where(scheduled_on: formatted_date)
    end

    flights.order(:scheduled_on)
  end
end
