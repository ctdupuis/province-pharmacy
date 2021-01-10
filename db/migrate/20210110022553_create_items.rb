class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :product_name
      t.integer :quantity
      t.string :unit_of_measurement
      t.string :category

      t.references :inventory, foreign_key: true
      t.timestamps
    end
  end
end
