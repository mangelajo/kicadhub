class CreateComponentsSupplierSkusTable < ActiveRecord::Migration
  def self.up
    create_table :components_supplier_skus, :id => false do |t|
      t.references :component
      t.references :supplier_sku
    end
    add_index :components_supplier_skus, [:supplier_sku_id, :component_id],:name => 'sku_comp_index'
    add_index :components_supplier_skus, [:component_id, :supplier_sku_id],:name => 'comp_sku_index'
  end

  def self.down
    drop_table :components_supplier_skus
  end
end
