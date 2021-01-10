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
end