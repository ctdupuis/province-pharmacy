class SchedulesController < ApplicationController

    def index
        # binding.pry
        if @current_user.username == "DEM"
            session[:fake_schedules] = []
            schedules = session[:fake_users].each{|user| make_schedule(user, session[:fake_schedules])}
            binding.pry
        else
            schedules = ScheduleSerializer.new(Schedule.all).to_serialized_json
        end
        render json: schedules
    end

    private

    def make_schedule(user, array)
        # binding.pry
        dates = Schedule.first.shifts.map{|shift| shift.date }
        schedule = Schedule.new(id: user[:id], user_id: user[:id])
        # shift_id = user[:id]
        # binding.pry
        i = 1
        t = 0
        while i < 6 do 
            s = Shift.new(date: "#{dates[t]}", time: "9-5", schedule_id: schedule[:id], user_id: user[:id])
            schedule.shifts << s
            # shift_id += 1
            i += 1
            t += 1
        end
        array << schedule
    #   return schedule
    end
end