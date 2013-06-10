class Event < ActiveRecord::Base
   attr_accessible :title, :description, :dayof, :phone , :creator,  :start_time
   # , :start_time, :phone, :creator
  #
   belongs_to :user
end
