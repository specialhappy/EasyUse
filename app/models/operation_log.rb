class OperationLog < ActiveRecord::Base
  belongs_to :appointment
  has_many :working_records
end
