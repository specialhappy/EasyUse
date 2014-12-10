class ApplicationForm < ActiveRecord::Base
  belongs_to :appointment
  has_many :application_form_metas
  has_one :application_file
end
