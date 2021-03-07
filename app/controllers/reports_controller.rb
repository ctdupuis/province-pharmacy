class ReportsController < ApplicationController 

    def show
        report = nil
        if @current_user.demo
            id = 2
        else
            id = 1
        end
        
        start_date = params[:start_date].in_time_zone('Central Time (US & Canada)').to_date
        end_date = params[:end_date].in_time_zone('Central Time (US & Canada)').to_date

        case params[:type]
        when "Check"
            report = CheckLog.find(id).check_entries.map{ |e| e if e.created >= start_date && e.created <= end_date }.compact
        when "Mileage"
            report = DeliveryLog.find(id).delivery_entries.map{ |e| e if e.created >= start_date && e.created <= end_date }.compact
        end
        if report
            render json: report
        else
            render json: { status: 404 }
        end
    end

end