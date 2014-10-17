class User < ActiveRecord::Base
  has_many :appointments, as: :order
end
