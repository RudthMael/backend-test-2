class AddIndexesToNumbers < ActiveRecord::Migration
  def change
    add_index :company_numbers, :sip_endpoint
    add_index :user_numbers, :sip_endpoint
  end
end
