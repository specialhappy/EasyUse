class ApplicationForm < ActiveRecord::Base
  belongs_to :appointment
  has_many :application_form_metas
end
