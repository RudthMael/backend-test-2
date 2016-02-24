class AddNameToCompanyNumbers < ActiveRecord::Migration
  def change
    add_column :company_numbers, :name, :string, after: :sip_endpoint
  end
end
