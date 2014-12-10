class Instrument < ActiveRecord::Base
  belongs_to :user
  belongs_to :institution
  has_many :appointments
  has_and_belongs_to_many :b_level_tags
  
  def search(search_word)
    return Instrument.where("name LIKE '%#{search_word}%'")
  end
end
