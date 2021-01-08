class CreateDeliveryLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :delivery_logs do |t|
      t.boolean :demo

      t.timestamps
    end
  end
end
