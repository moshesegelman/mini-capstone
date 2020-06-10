class RenamesProductsInImage < ActiveRecord::Migration[6.0]
  def change
    rename_column :images, :products_id, :product_id
  end
end
