class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.integer :user_id
      t.text :message, null: false
      t.timestamps
    end
  end
end
