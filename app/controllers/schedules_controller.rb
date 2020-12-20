class SchedulesController < ApplicationController

    def index
        if @current_user.demo
            schedules = ScheduleSerializer.new(Schedule.demo_models).to_serialized_json
        else
            schedules = ScheduleSerializer.new(Schedule.real_models).to_serialized_json
        end
        render json: schedules
    end

end