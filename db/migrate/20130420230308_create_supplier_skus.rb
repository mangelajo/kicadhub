class CreateSupplierSkus < ActiveRecord::Migration
  def change
    create_table :supplier_skus do |t|
      t.string :sku
      t.integer :moq
      t.text :prices
      t.string :product_url
      t.integer :in_stock_qty
      t.integer :on_order_qty
      t.datetime :on_order_eta
      t.integer :factory_lead_days
      t.integer :factory_pack_quantity
      t.integer :order_multiple
      t.string :packaging
      t.boolean :is_authorized
      t.datetime :last_updated
      t.references :supplier

      t.timestamps
    end

    add_index :supplier_skus, :supplier_id
  end
end
