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
            route.update(miles: params[:miles], edited: true)
            render json: { status: 200, alert: "Stop added succesfully"}
        else
            render json: { status: 404, alert: "Failed to add stop"}
        end
    end

    def update 
        route = Route.find(params[:route_id])
        stop = route.stops.find(params[:id])
        stop.update(
            patient_name: params[:patient_name],
            patient_address: params[:patient_address]
        )
        route.update(miles: params[:miles], edited: true)
        if route && stop
            render json: { status: 200, alert: "Stop succesfully changed " }
        else
            render json: { status: 404, alert: "Failed to update information"}
        end
    end

    def destroy
        route = Route.find(params[:route_id])
        stop = route.stops.find(params[:id])
        render json: { status: 200 }
    end
end