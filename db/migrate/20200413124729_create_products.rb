class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, limit: 30, null: false
      t.text :description, null: false
      t.references :shop, foreign_key: true

      t.timestamps
    end
    add_index :products, [:shop_id, :created_at]
  end
end
