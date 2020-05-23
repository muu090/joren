class DeleteStores < ActiveRecord::Migration[5.2]
  def change
    drop_table :stores
  end
end
