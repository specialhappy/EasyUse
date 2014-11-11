class Appointment < ActiveRecord::Base
  belongs_to :user
  belongs_to :group
  belongs_to :instrument
  has_one :application_form
end
