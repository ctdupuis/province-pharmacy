class AddEditedColumnToRoutes < ActiveRecord::Migration[6.0]
  def change
    add_column :routes, :edited, :boolean, default: false
  end
end
