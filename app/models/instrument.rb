class Instrument < ActiveRecord::Base
  has_many :appointments, as: :order
end
