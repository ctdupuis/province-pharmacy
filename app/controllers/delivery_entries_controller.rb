class DeliveryEntriesController < ApplicationController

    def create
        if @current_user.demo
            log = DeliveryLog.find(2)
        else
            log = DeliveryLog.find(1)
        end
        entries = params[:locations].map do |location|
            DeliveryEntry.create(
                user_id: @current_user.id,
                delivery_log_id: log.id,
                patient_name: location["patient"],
                patient_address: location["address"],
                miles: params[:mileage].to_f
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
        entries = log.delivery_entries
        render json: entries
    end
end