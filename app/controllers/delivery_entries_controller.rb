class DeliveryEntriesController < ApplicationController

    def create
        if @current_user.demo
            log = DeliveryLog.find(2)
        else
            log = DeliveryLog.find(1)
        end
        # binding.pry
        miles = params[:miles].to_i
        new_entry = DeliveryEntry.new(
            user_id: @current_user.id,
            delivery_log_id: log.id,
            patient_name: params[:patient_name],
            patient_address: params[:patient_address],
            miles: params[:miles]
        )
        if new_entry.save
            render json: { status: 200 }
        else
            render json: { status: 402 }
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