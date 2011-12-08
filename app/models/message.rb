class Message < ActiveRecord::Base
  attr_accessible :date, :time, :message, :phone
end
