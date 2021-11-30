DURATIONS = {
  'ATL' => {
    'DFW' => 100,
    'HND' => 721,
    'CDG' => 450,
    'LHR' => 411,
    'FRA' => 344,
    'WAW' => 600
  },
  'DFW' => {
    'HND' => 731,
    'CDG' => 410,
    'LHR' => 481,
    'FRA' => 324,
    'WAW' => 610
  },
  'HND' => {
    'CDG' => 810,
    'LHR' => 281,
    'FRA' => 824,
    'WAW' => 710
  },
  'CDG' => {
    'LHR' => 381,
    'FRA' => 124,
    'WAW' => 210
  },
  'LHR' => {
    'FRA' => 324,
    'WAW' => 230
  },
  'FRA' => {
    'WAW' => 330
  },
  'WAW' => {}
}

def get_duration(departure, arrival)
  DURATIONS[departure][arrival] || DURATIONS[arrival][departure]
end

def random_time
  Faker::Time.between(from: DateTime.now - 1, to: DateTime.now + 10)
end

ActiveRecord::Base.transaction do
  Airport.destroy_all
  Flight.destroy_all

  ActiveRecord::Base.connection.reset_pk_sequence!('airports')
  ActiveRecord::Base.connection.reset_pk_sequence!('flights')

  airports = []

  airports[0] = Airport.create(
    {
      name: 'Hartsfield-Jackson Atlanta International Airport',
      city: 'Atlanta',
      country: 'United States',
      code: 'ATL'
    }
  )

  airports[1] = Airport.create(
    {
      name: 'Dallas/Fort Worth International Airport',
      city: 'Dallas',
      country: 'United States',
      code: 'DFW'
    }
  )

  airports[2] = Airport.create(
    {
      name: 'Tokyo Haneda Airport',
      city: 'Tokyo',
      country: 'Japan',
      code: 'HND'
    }
  )

  airports[3] = Airport.create(
    {
      name: 'Charles de Gaulle',
      city: 'Roissy-en-France',
      country: 'France',
      code: 'CDG'
    }
  )

  airports[4] = Airport.create(
    {
      name: 'Heathrow Airport',
      city: 'London',
      country: 'United Kingdom',
      code: 'LHR'
    }
  )

  airports[5] = Airport.create(
    {
      name: 'Frankfurt Airport',
      city: 'Frankfurt',
      country: 'Germany',
      code: 'FRA'
    }
  )

  airports[6] = Airport.create(
    {
      name: 'Warsaw Chopin Airport',
      city: 'Warsaw',
      country: 'Poland',
      code: 'WAW'
    }
  )

  airports.each do |departure|
    airports.each do |arrival|
      next if departure == arrival

      3.times do |_n|
        Flight.create({
                        departure_airport: departure,
                        arrival_airport: arrival,
                        flight_start: random_time,
                        flight_duration: get_duration(departure.code, arrival.code)
                      })
      end
    end
  end
end

p "Created #{Airport.count} airport entries."
p "Created #{Flight.count} flights entries."
