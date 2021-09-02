class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.references :vendor, null:false, foreign_key: true
      t.string :name
      t.string :description
      t.string :price_per_quantity
      t.integer :quantity
      t.boolean :available, default: false

      t.timestamps
    end
  end
end
