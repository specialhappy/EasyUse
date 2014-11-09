class WorkingRecord < ActiveRecord::Base
  belongs_to :operation_log
end
