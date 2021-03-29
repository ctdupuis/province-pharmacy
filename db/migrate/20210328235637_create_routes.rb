class CreateRoutes < ActiveRecord::Migration[6.0]
  def change
    create_table :routes do |t|
      t.references :delivery_log, null: false, foreign_key: true
      t.references :user, foreign_key: true
      t.float :miles

      t.timestamps
    end
  end
end
