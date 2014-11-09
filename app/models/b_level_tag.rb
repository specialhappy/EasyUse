class BLevelTag < ActiveRecord::Base
  belongs_to :a_level_tag
  has_and_belongs_to_many :instruments
end
