class ChangeeColumns < ActiveRecord::Migration[5.2]
  def change
    change_column_default :items, :is_active, from: false, to: true
    change_column_default :customers, :is_deleted, false
  end
end
