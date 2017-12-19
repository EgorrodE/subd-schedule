class WeekdaysController < ApplicationController
  def most_avaliable
    @weekdays = ActiveRecord::Base.connection.execute("
      SELECT id, name, mycount FROM (
        (SELECT wd.*, COUNT(distinct p.classroom_id) mycount FROM weekdays wd
             INNER JOIN schedule_places sp ON sp.weekday_id = wd.id
             INNER JOIN pairs p ON p.schedule_place_id = sp.id
             GROUP BY wd.id
          ) AS mycounts
        ) WHERE mycount = (
          SELECT MIN(mycount) FROM mycounts
        )
    ")
  end
end
