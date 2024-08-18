class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.decimal :price, null: false
      t.integer :sku, null: false
      t.boolean :is_seasonal
      t.string :image, null: false
      t.string :quantity, null: false
      t.string :category, null: false

      t.timestamps
    end
    add_index :products, :sku, unique: true
  end
end
