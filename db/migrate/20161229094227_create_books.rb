class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :Title
      t.text :Description
      t.integer :Page_number
      t.string :Author
      t.string :Publisher
      t.integer :Status
      t.float :Score

      t.timestamps
    end
  end
end
