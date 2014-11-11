class User < ActiveRecord::Base
  belongs_to :institution
  belongs_to :role
  has_many :instruments
  has_many :appointments
  has_many :messages
  has_and_belongs_to_many :groups
end
