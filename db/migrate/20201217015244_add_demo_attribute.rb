class AddDemoAttribute < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :demo, :boolean
    add_column :schedules, :demo, :boolean
  end
end
