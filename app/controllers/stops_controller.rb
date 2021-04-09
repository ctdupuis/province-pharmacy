class StopsController < ApplicationController

    def create
        route = Route.find(params[:id])
        if route
            new_stop = Stop.create(
                patient_name: params[:patient_name],
                patient_address: params[:patient_address],
                route_id: route.id
            )
        end
        if new_stop
            route.stops.push(new_stop)
            render json: { status: 200, alert: "Stop added succesfully"}
        else
            render json: { status: 404, alert: "Failed to add stop"}
        end
    end

end