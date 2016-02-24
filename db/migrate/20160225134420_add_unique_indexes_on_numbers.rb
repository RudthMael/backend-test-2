class AddUniqueIndexesOnNumbers < ActiveRecord::Migration
  def change
    remove_index :company_numbers, :sip_endpoint
    remove_index :user_numbers, :sip_endpoint

    add_index :company_numbers, :sip_endpoint, unique: true
    add_index :user_numbers, :sip_endpoint, unique: true
  end
end
