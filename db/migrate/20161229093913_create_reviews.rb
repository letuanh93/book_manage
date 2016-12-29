class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.integer :User_Id
      t.integer :Book_Id
      t.text :Comment
      t.integer :Rating

      t.timestamps
    end
  end
end
