# == Schema Information
#
# Table name: passengers
#
#  id         :bigint           not null, primary key
#  email      :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  booking_id :bigint           not null
#
# Indexes
#
#  index_passengers_on_booking_id  (booking_id)
#
# Foreign Keys
#
#  fk_rails_...  (booking_id => bookings.id)
#
class Passenger < ApplicationRecord
  belongs_to :booking
  has_many :flights, through: :booking
end
