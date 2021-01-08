class CreateDeliveryEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :delivery_entries do |t|
      t.references :delivery_log, null: false, foreign_key: true
      t.references :user, foreign_key: true
      t.decimal :miles
      t.string :patient_name
      t.date :patient_dob
      t.string :patient_address

      t.timestamps
    end
  end
end
