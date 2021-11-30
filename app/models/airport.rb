# == Schema Information
#
# Table name: airports
#
#  id         :bigint           not null, primary key
#  city       :string
#  code       :string
#  country    :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Airport < ApplicationRecord
  has_many :arriving_flights, foreign_key: :arrival_airport_id, class_name: 'Flight'
  has_many :departing_flights, foreign_key: :departure_airport_id, class_name: 'Flight'
end
