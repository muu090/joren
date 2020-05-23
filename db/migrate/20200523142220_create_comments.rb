class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :user_id, null: false
      t.integer :store_id, null: false
      t.integer :check_in_id, null: false
      t.text :comment, null: false

      t.timestamps
    end
  end
end
