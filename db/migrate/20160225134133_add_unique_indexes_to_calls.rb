class AddUniqueIndexesToCalls < ActiveRecord::Migration
  def change
    remove_index :calls, :uuid
    add_index :calls, :uuid, unique: true
  end
end
