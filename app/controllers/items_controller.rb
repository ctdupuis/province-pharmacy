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
                product_name: item[:product_name],
                quantity: item[:qty].to_i,
                unit_of_measurement: item[:units],
                category: item[:category],
                inventory_id: inventory.id
            )
        end
        if items
            render json: items
        else
            render json: { errors: "One or more items could not be added"}
        end
    end

    def update 
        item = Item.find(params[:id])
        item.update(
            product_name: params[:product_name],
            quantity: params[:quantity],
            unit_of_measurement: params[:unit_of_measurement]
        )
        if item.save 
            render json: item
        else
            render json: { status: 500 }
        end
    end
    
end