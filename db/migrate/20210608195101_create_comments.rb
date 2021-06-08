class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.integer :post_id
      t.string :body
      t.integer :user_id

      t.timestamps
    end
  end
end
