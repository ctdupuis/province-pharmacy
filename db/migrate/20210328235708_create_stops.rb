class CreateStops < ActiveRecord::Migration[6.0]
  def change
    create_table :stops do |t|
      t.references :route, null: false, foreign_key: true
      t.string :patient_name
      t.string :patient_address

      t.timestamps
    end
  end
end
