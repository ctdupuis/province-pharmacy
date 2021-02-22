class ReportsController < ApplicationController 

    def show
        report = nil

        case params[:type]
        when "Check"
            report = CheckLog.find(params[:id])
        when "Delivery"
            report = DeliveryLog.find(params[:id])
        end

        if report
            render json: report
        else
            render json: { status: 404 }
        end
    end

end