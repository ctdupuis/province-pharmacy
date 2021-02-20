class CreateCheckEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :check_entries do |t|
      t.string :patient_name
      t.string :rx_num
      t.integer :original_amt
      t.integer :adjusted_amt
      
      t.references :check_log, foreign_key: true
      t.timestamps
    end
  end
end
