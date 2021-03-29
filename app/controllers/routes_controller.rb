class RoutesController < ApplicationController

    def create
        if @current_user.demo
            log = DeliveryLog.find(2)
        else
            log = DeliveryLog.find(1)
        end
        route = Route.create(
            miles: params[:mileage].to_f, 
            delivery_log_id: log.id
        )
        entries = params[:locations].map do |location|
            Stop.create(
                user_id: @current_user.id,
                patient_name: location["patient"],
                patient_address: location["address"],
                route_id: route.id
            )
        end
        if entries
            render json: { status: 200, message: "Deliveries successfully saved!"}
        else
            render json: { status: 402, message: "Some errors occurred" }
        end
    end
    
    def index
        if @current_user.demo
            log = DeliveryLog.find(2)
        else
            log = DeliveryLog.find(1)
        end
        entries = log.routes
        render json: entries
    end
end