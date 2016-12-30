class AddCategoryIdToBooks < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :Category_id, :integer
  end
end
