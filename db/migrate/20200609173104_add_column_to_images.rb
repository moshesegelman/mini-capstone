class AddColumnToImages < ActiveRecord::Migration[6.0]
  def change
    add_column :images, :products_id, :integer
  end
end
