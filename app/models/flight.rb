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
  scope :upcoming, -> { where('date >= ?', Date.today) }

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
    return Flight.order(:scheduled_on) if search.empty?

    if !search[:date]
      Flight.where(search).order(:scheduled_on)
    else
      formatted_date = Date.strptime(search.delete(:date), '%Y-%m-%d').all_day
      search_query_with_date = search.merge({ scheduled_on: formatted_date })

      Flight.where(search_query_with_date).order(:scheduled_on)
    end
  end
end
