class CreateCalls < ActiveRecord::Migration
  def change
    create_table :calls do |t|
      t.string :direction
      t.string :from
      t.string :caller_name
      t.string :to
      t.string :status
      t.timestamps null: false
    end
  end
end
