class AddColumnsToAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses,  :customer_id, :integer, null: false
    add_column :addresses,  :name,        :string,  null: false
    add_column :addresses,  :postal_code, :string,  null: false
    add_column :addresses,  :address,     :string,  null: false
  end
end
