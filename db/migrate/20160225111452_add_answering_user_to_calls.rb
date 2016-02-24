class AddAnsweringUserToCalls < ActiveRecord::Migration
  def change
    add_column :calls, :answering_number_id, :integer
    add_index :calls, :answering_number_id
  end
end
