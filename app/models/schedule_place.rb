class SchedulePlace < ActiveRecord::Base
  belongs_to :weekday
  has_one :pair
end
