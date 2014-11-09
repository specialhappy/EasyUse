class User < ActiveRecord::Base
  belongs_to :institution
  has_many :instruments
  has_many :appointments
  has_and_belongs_to_many :groups
end
