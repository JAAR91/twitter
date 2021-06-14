class CreateFollowers < ActiveRecord::Migration[6.1]
  def change
    create_table :followers do |t|
      t.integer :user_id
      t.integer :follow_id

      t.timestamps
    end
  end
end
