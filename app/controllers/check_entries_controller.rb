class CheckEntriesController < ApplicationController

    def create
        if @current_user.demo
            log = CheckLog.find(2)
        else
            log = CheckLog.find(1)
        end
        CheckEntry.create(
            check_log_id: log.id,
            patient_name: params["patient"],
            rx_num: params["rx"],
            original_amt: params["original_amt"].to_i,
            adjusted_amt: params["adjusted_amt"].to_i
        )
        if entries
            render json: { status: 200, message: "Check entries saved!"}
        else
            render json: { status: 402, message: "Some errors occurred" }
        end
    end
    
    def index
        if @current_user.demo
            log = CheckLog.find(2)
        else
            log = CheckLog.find(1)
        end
        entries = log.check_entries
        render json: entries
    end
end