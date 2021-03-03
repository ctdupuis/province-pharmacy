class ReportsController < ApplicationController 

    def show
        report = nil
        if @current_user.demo
            id = 2
        else
            id = 1
        end
        case params[:type]
        when "Check"
            report = CheckLog.find(id).check_entries
        when "Mileage"
            report = DeliveryLog.find(id).delivery_entries
        end
        binding.pry

        if report
            render json: report
        else
            render json: { status: 404 }
        end
    end

end