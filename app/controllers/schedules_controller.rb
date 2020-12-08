class SchedulesController < ApplicationController

    def index
        schedules = ScheduleSerializer.new(Schedule.all).to_serialized_json
        render json: schedules
    end

end