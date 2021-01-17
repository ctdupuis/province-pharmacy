class ItemsController < ApplicationController

    def index
        if @current_user.demo
            inventory = Inventory.find(2)
        else
            inventory = Inventory.find(1)
        end
        items = inventory.items
        render json: items
    end

    def create
        if @current_user.demo
            inventory = Inventory.find(2)
        else
            inventory = Inventory.find(1)
        end
        items = params[:itemData][:items].map do |item|
            Item.create(
                product_name: params[:product_name],
                quantity: params[:qty].to_i,
                unit_of_measurement: params[:units],
                category: params[:category],
                inventory_id: inventory.id
            )
        end
        if items
            render json: items
        else
            render json: { errors: "One or more items could not be added"}
        end
    end
end