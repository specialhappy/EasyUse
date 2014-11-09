class Institution < ActiveRecord::Base
  belongs_to :region_center
  has_many :instruments
  has_many :users
end
