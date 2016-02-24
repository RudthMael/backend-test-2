class AddNameToUserNumbers < ActiveRecord::Migration
  def change
    add_column :user_numbers, :name, :string, after: :sip_endpoint
  end
end
