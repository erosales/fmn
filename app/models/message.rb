class Message < ActiveRecord::Base
  attr_accessible :date, :time, :message, :phone
    
  validates_presence_of :message 
  validates_length_of :message, :within => 1..150, :too_long => " must be shorter than 150 chars",
                           :too_short => " must be at least 1 chars"
  validates_presence_of :phone                          
  validates_length_of :phone, :is => 10                                                     
end
