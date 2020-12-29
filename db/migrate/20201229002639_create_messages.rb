class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string :body
      t.references :conversation, foreign_key: true

      t.timestamps
    end
  end
end
