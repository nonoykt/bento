class AddNameProfileToShops < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :profile, :text
  end
end
