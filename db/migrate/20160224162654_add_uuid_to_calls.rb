class AddUuidToCalls < ActiveRecord::Migration
  def change
    add_column :calls, :uuid, :string
  end
end
