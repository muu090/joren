class CreateCheckIns < ActiveRecord::Migration[5.2]
  def change
    create_table :check_ins do |t|
      t.integer :user_id, null: false
      t.integer :store_id, null: false
      t.string :store_name
      t.boolean :open_status, default: true, null: false

      t.timestamps
    end
  end
end
