class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.integer :User_Id
      t.integer :Book_Id
      t.datetime :Deadline
      t.integer :Status, default: 1

      t.timestamps
    end
  end
end
