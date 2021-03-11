class AddColumnsToItems < ActiveRecord::Migration[5.2]
  def change
    
    add_column :items, :name,           :string
    add_column :items, :image_id,       :string 
    add_column :items, :introduction,   :text
    add_column :items, :price,          :integer
    add_column :items, :is_active,      :boolean, default: false
    
    #id,created_at,updated_at,genre_ieは別途製作済み

  end
end