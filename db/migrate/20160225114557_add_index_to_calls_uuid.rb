class AddIndexToCallsUuid < ActiveRecord::Migration
  def change
    add_index :calls, :uuid
  end
end
