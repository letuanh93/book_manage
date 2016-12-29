class CreateRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :relationships do |t|
      t.integer :Follower_Id
      t.integer :Followed_Id

      t.timestamps
    end
  end
end
