class CreateShifts < ActiveRecord::Migration[6.0]
  def change
    create_table :shifts do |t|
      t.references :schedule
      t.references :user
      t.string :date
      t.string :time

      t.timestamps
    end
  end
end
